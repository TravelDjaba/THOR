unit devLaserRBOXX;

interface
uses Winapi.windows, System.Classes, System.SysUtils, CPort, Log, System.Threading, System.SyncObjs, StrUtils, System.Types;

const WaitTimeout=2000;

type TAlarm = record
     PWR:Boolean;
     LASER_TEC:Boolean;
     LASER:Boolean;
     TEMP:Boolean;
     BIAS:Boolean;
     end;

     TCM_MODE=(AutoPowCtrl, AutoCurCtrl, Modulation);
     TOP_MODE=(AutoLaserShutDown, LaserOn, LaserOff);

type
   TLaserRBOXX = class
     private
       fComPort: TComPort;
       fCritSection:TCriticalSection;
       fMonitoringTask:array[0..0]of ITask;

       fConnected:Boolean;
       fAlarm:TAlarm;
       fCM_MODE:TCM_MODE;
       fOP_MODE:TOP_MODE;

       fPower_mW:Integer;
       fRefPower_mW:Integer;
       fBias_mA:Integer;
       fRefBias_mA:Integer;

       fTemp, fCaseTemp, fRefTemp:Single;
       fTempHighAlarm, fTempLowAlarm:Single;
       fMaxOptPow_mW, fMinOptPow_mW:integer;
       fPhDiodeCur_uA:Integer;
       fWaveLength:Single;

       fOnConnect, fOnDisconnect: TNotifyEvent;
       fStopMonitoring:Boolean;

       function ParseInt(str:string; var value:integer):Boolean;
       function ParseFloat(str:string; var value:Single):Boolean;

       function GetAlarm(isLog:Boolean=false):Boolean;
       function GetOperationMode(isLog:Boolean=false):Boolean;
       function GetPower_mW(isLog:Boolean=false):Boolean;
       function GetRefPower_mW(isLog:Boolean=false):Boolean;
       function GetBias_mA(isLog:Boolean=false):Boolean;
       function GetRefBias_mA(isLog:Boolean=false):Boolean;
       function GetTemp(isLog:Boolean=false):Boolean;
       function GetCaseTemp(isLog:Boolean=false):Boolean;
       function GetRefTemp(isLog:Boolean=false):Boolean;
       function GetMaxOptPow_mW(isLog:Boolean=false):Boolean;
       function GetMinOptPow_mW(isLog:Boolean=false):Boolean;
       function GetTempHighAlarm(isLog:Boolean=false):Boolean;
       function GetTempLowAlarm(isLog:Boolean=false):Boolean;
       function GetPhDiodeCur_uA(isLog:Boolean=false):Boolean;

       procedure Log(str:string);
       function GetWorkPort: string;
     public

       constructor Create;
       destructor Destroy; override;

       property WorkPort:string read GetWorkPort;

       property OnConnect: TNotifyEvent read fOnConnect write fOnConnect;
       property OnDisconnect: TNotifyEvent read fOnDisconnect write fOnDisconnect;

       property Alarm:TAlarm read fAlarm;
       property Power_mW:Integer read fPower_mW;
       property RefPower_mW:Integer read fRefPower_mW;
       property Bias_mA:Integer read fBias_mA;
       property RefBias_mA:Integer read fRefBias_mA;
       property WaveLength:Single read fWaveLength;

       property Temp:Single read fTemp;
       property CaseTemp:Single read fCaseTemp;
       property RefTemp:Single read fRefTemp;
       property TempHighAlarm:Single read fTempHighAlarm;
       property TempLowAlarm:Single read fTempLowAlarm;
       property MaxOptPow_mW:integer read fMaxOptPow_mW;
       property MinOptPow_mW:integer read fMinOptPow_mW;
       property PhDiodeCur_uA:Integer read fPhDiodeCur_uA;

       property Connected:Boolean read fConnected;
       property CM_MODE:TCM_MODE read fCM_MODE;
       property OP_MODE:TOP_MODE read fOP_MODE;


       function SetMode(mode:TCM_MODE):Boolean;
       function SetModulation(enable:Boolean):Boolean;
       function SetOnOff(on_:boolean ):Boolean;
       function SetPower(power:integer):Boolean;
       function SetBias(bias:integer):Boolean;

       procedure UpdateParams;

       function SendCmdAnsw(cmd:String; showBin:Boolean=false):String;
       procedure Send(cmd:String);
       function FindLaser:Boolean;
       function CloseLaser:Boolean;
       procedure InitParams;
   end;

  function IntToBin1(Value: Longint; Digits: Integer): string;

implementation

 // Integer to Binary

function IntToBin1(Value: Longint; Digits: Integer): string;
 var
   i: Integer;
 begin
   Result := '';
   for i := Digits downto 0 do
     if Value and (1 shl i) <> 0 then
       Result := Result + '1'
   else
     Result := Result + '0';
 end;


{ TLaserRBOXX }

function TLaserRBOXX.CloseLaser: Boolean;
begin

   if Assigned(fMonitoringTask[0]) and (fMonitoringTask[0].Status = TTaskStatus.Running)
                                    then
        begin
        fStopMonitoring:=True;
        if not fMonitoringTask[0].Wait(1000) then
           fMonitoringTask[0].Cancel;
           sleep(500);
        end;

       if fComPort.Connected then
            fComPort.Close;
       fConnected:=False;
       if Assigned(OnDisconnect) then OnDisconnect(Self);
       result:=True;
end;

constructor TLaserRBOXX.Create;
begin
  inherited Create;
  fConnected:=False;
  fComPort:= TComPort.Create(nil);
  fComPort.BaudRate:=br9600;
  fComPort.StopBits:=sbOneStopBit;
  fComPort.DataBits:=dbEight;
  fComPort.Parity.Bits:=prNone;
  fComPort.FlowControl.FlowControl:=fcSoftware;
  fCritSection:=TCriticalSection.Create;
  FormatSettings.DecimalSeparator:='.';
  fWaveLength:=785.0;
end;

destructor TLaserRBOXX.Destroy;
begin
  CloseLaser;
  fCritSection.Free;
  fConnected:=false;
  FreeAndNil(fComPort);
  inherited Destroy;
end;

function TLaserRBOXX.FindLaser: Boolean;
var i:integer;
    sl:TStringList;
    answ:String;
begin
  sl:=TStringList.Create;
  Result:=False;

  fCritSection.Acquire;

  CloseLaser;

  EnumComPorts(sl);

  for i := 0 to sl.Count-1 do
    begin
    Log(Format(' Port[%d] %s',[i,  sl[i]]));
    fComPort.Port:= sl[i];

     //   Log('try to open');
    try
    fComPort.Open;
    except
    fComPort.Close;
    Continue;
    end;

//    fComPort.Open;
    try
    fComPort.ClearBuffer(True,True);
    except
    fComPort.Close;
    Continue;
    end;
    try
    fComPort.WriteStr(#13);
    except
    fComPort.Close;
    Continue;
    end;
    fComPort.ClearBuffer(True,True);
    answ:=SendCmdAnsw('');
    if PosEx('>', answ,1)>0  then
    begin
      Result:=True;
      fConnected:=True;

      fMonitoringTask[0]:=TTask.Create( procedure()
      var i:Integer;
       begin
        fStopMonitoring:=False;
        while true do
          begin
          if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
          if fStopMonitoring then Break;

          fCritSection.Acquire;
          UpdateParams;
          fCritSection.Release;
          for i := 0 to 9 do
              begin
              if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
              if fStopMonitoring then Break;
              sleep(100);
              end;
          end;


       end);

      fMonitoringTask[0].Start;

      if Assigned(OnConnect) then OnConnect(Self);
      Log('Find Port='+sl[i]);
      Log('>');
      Break;
    end
    else
       fComPort.Close;
    end;
  fCritSection.Release ;

  sl.Free;
end;

function TLaserRBOXX.GetAlarm(isLog:Boolean=false): Boolean;
var str, datas:string;
    pos0A, Pos0D, data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MAL');
if str<>'' then
  begin
  pos0A:=PosEx( #10, str ,1);
  pos0D:=PosEx( #13, str ,pos0A+1);
//  Log(Format('Pos0A=%d Pos0D=%d',[pos0A, pos0D]));
  if (pos0A=0) or (Pos0D=0) then
  begin
    Log(Format('Error: GetAlarm Pos0A=%d Pos0D=%d',[pos0A, pos0D]));
    exit;
  end;
  datas:=Copy(str, pos0A+1, Pos0D-pos0A-1);

  try
  data:=StrToInt(datas);
  except
  Log(Format('Error: GetAlarm incorrect value [%s]',[datas]));
  Exit;
  end;

  if isLog then Log('Alarm='+IntToBin1(data,5));
  if (data and $0001 >0) then fAlarm.PWR:=True else fAlarm.PWR:=False;
  if (data and $0002 >0) then fAlarm.LASER_TEC:=True else fAlarm.LASER_TEC:=False;

  if (data and $0008 >0) then fAlarm.LASER:=True else fAlarm.LASER:=False;
  if (data and $0010 >0) then fAlarm.TEMP:=True else fAlarm.TEMP:=False;

  if (data and $0040 >0) then fAlarm.BIAS:=True else fAlarm.BIAS:=False;
  result:=True;
  end;
end;

function TLaserRBOXX.GetBias_mA(isLog:Boolean=false): Boolean;
var str:string;
    data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MBC');

if str<>'' then
   if ParseInt(str, data) then
   begin
    if isLog then Log(Format( 'Bias=%d mA',[data]));
    fBias_mA:=data;
    result:=True;
  end;

end;

function TLaserRBOXX.GetCaseTemp(isLog:Boolean=false): Boolean;
var str:string;
    data:Single;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MCT');

if str<>'' then
   if ParseFloat(str, data) then
   begin
    if isLog then Log(Format( 'CaseTemperature=%.1f C',[data]));
    fCaseTemp:=data;
    result:=True;
  end;
end;

function TLaserRBOXX.GetMaxOptPow_mW(isLog:Boolean=false): Boolean;
var str:string;
    data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MPOH');

if str<>'' then
   if ParseInt(str, data) then
   begin
    if isLog then Log(Format( 'MaxOptPower:=%d mW',[data]));
    fMaxOptPow_mW:=data;
    result:=True;
  end;
end;

function TLaserRBOXX.GetMinOptPow_mW(isLog:Boolean=false): Boolean;
var str:string;
    data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MPOL');

if str<>'' then
   if ParseInt(str, data) then
   begin
    if IsLog then Log(Format( 'MinOptPower:=%d mW',[data]));
    fMinOptPow_mW:=data;
    result:=True;
  end;
end;

function TLaserRBOXX.GetOperationMode(isLog:Boolean=false): Boolean;
var str, datas:string;
    pos0A,Pos20, Pos0D, data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MCM');
if str<>'' then
  begin
  pos0A:=PosEx( #10, str ,1);
  pos20:=PosEx( ' ', str ,pos0A+1);
  pos0D:=PosEx( #13, str ,pos20+1);
//  Log(Format('Pos0A=%d Pos0D=%d',[pos0A, pos0D]));
  if (pos0A=0) or (Pos20=0) or (Pos0D=0) then
  begin
    Log(Format('Error: GetOpMode Pos0A=%d Pos20=%d Pos0D=%d',[pos0A, pos20, pos0D]));
    exit;
  end;
  datas:=Copy(str, pos0A+1, Pos20-pos0A-1);
  try
  data:=StrToInt(datas);
  except
  Log(Format('Error: GetOpMode incorrect value [%s]',[datas]));
  Exit;
  end;

  if isLog then Log('CM='+IntToStr(data));
  case data of
  30: fCM_MODE:=AutoPowCtrl;
  10: fCM_MODE:=AutoCurCtrl;
  11: fCM_MODE:=Modulation;
  end;

  datas:=Copy(str, pos20+1, Pos0D-pos20-1);
  try
  data:=StrToInt(datas);
  except
  Log(Format('Error: GetOpMode Not correct value [%s]',[datas]));
  Exit;
  end;

  if isLog then Log('OP='+IntToStr(data));
  case data of
  40: fOP_MODE:=AutoLaserShutDown;
  10: fOP_MODE:=LaserOn;
  0: fOP_MODE:=LaserOff;
  end;
  result:=True;
  end;
end;

function TLaserRBOXX.GetPhDiodeCur_uA(isLog:Boolean=false): Boolean;
var str:string;
    data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MPD');
if str<>'' then
 if ParseInt(str, data) then
  begin
    if isLog then Log(Format('PhotoDiodeCurrent=%d uA',[data]));
    fPhDiodeCur_uA:=data;
    result:=True;
  end;
end;

function TLaserRBOXX.GetPower_mW(isLog:Boolean=false): Boolean;
var str:string;
    data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MPO');
if str<>'' then
 if ParseInt(str, data) then
  begin
    if isLog then Log(Format('Power=%d mW',[data]));
    fPower_mW:=data;
    result:=True;
  end;
end;

function TLaserRBOXX.GetRefBias_mA(isLog:Boolean=false): Boolean;
var str:string;
    data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MBR');

if str<>'' then
   if ParseInt(str, data) then
   begin
    if isLog then Log(Format( 'RefBias=%d mA',[data]));
    fRefBias_mA:=data;
    result:=True;
  end;

end;

function TLaserRBOXX.GetRefPower_mW(isLog:Boolean=false): Boolean;
var str:string;
    data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MPR');
if str<>'' then
  if ParseInt(str,data) then
    begin
      if isLog then Log( Format('RefPower=%d mW',[data]));
      fRefPower_mW:=data;
      result:=True;
    end;
end;

function TLaserRBOXX.GetRefTemp(isLog:Boolean=false): Boolean;
var str:string;
    data:Single;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MTR');

if str<>'' then
   if ParseFloat(str, data) then
   begin
    if isLog then Log(Format( 'RefTemperature=%.1f C',[data]));
    fRefTemp:=data;
    result:=True;
  end;

end;

function TLaserRBOXX.GetTemp(isLog:Boolean=false): Boolean;
var str:string;
    data:Single;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MTT');

if str<>'' then
   if ParseFloat(str, data) then
   begin
    if isLog then Log(Format( 'Temperature=%.1f C',[data]));
    fTemp:=data;
    result:=True;
  end;

end;

function TLaserRBOXX.GetTempHighAlarm(isLog:Boolean=false): Boolean;
var str:string;
    data:Single;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MATH');

if str<>'' then
   if ParseFloat(str, data) then
   begin
    if isLog then Log(Format( 'TempHighAlarm=%.1f C',[data]));
    fTempHighAlarm:=data;
    result:=True;
  end;
end;

function TLaserRBOXX.GetTempLowAlarm(isLog:Boolean=false): Boolean;
var str:string;
    data:Single;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('MATL');

if str<>'' then
   if ParseFloat(str, data) then
   begin
    if isLog then Log(Format( 'TempLowAlarm=%.1f C',[data]));
    fTempLowAlarm:=data;
    result:=True;
  end;
end;

function TLaserRBOXX.GetWorkPort: string;
begin
result:=fComPort.Port;
end;

procedure TLaserRBOXX.InitParams;
begin
 fCritSection.Acquire;
    GetAlarm(True);
    GetOperationMode(True);
    GetPower_mW(True);
    GetRefPower_mW(True);
    GetBias_mA(True);
    GetTemp(True);
    GetRefTemp(True);
    GetCaseTemp(True);
    GetMaxOptPow_mW(True);
    GetMinOptPow_mW(True);
    GetTempHighAlarm(True);
    GetTempLowAlarm(True);
    GetPhDiodeCur_uA(True);
  fCritSection.Release;
end;

procedure TLaserRBOXX.Log(str: string);
begin
//  FormLog.MemoLog.Lines.Add('LaserCOMport  '+str);
//  Exit;
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('Laser_COM  '+str);
          end);
      end);
end;

function TLaserRBOXX.ParseFloat(str: string; var value: Single): Boolean;
var datas:string;
    pos0A, Pos0D, i:Integer;
    data:Single;
begin
    Result:=False;
    data:=0.0;

    pos0A:=PosEx( #10, str ,1);
    pos0D:=PosEx( #13, str ,pos0A+1);
  //  Log(Format('Pos0A=%d Pos0D=%d',[pos0A, pos0D]));
    if (pos0A=0) or (Pos0D=0) then
    begin
      Log(Format('Error: ParseFloat Pos0A=%d Pos0D=%d',[pos0A, pos0D]));
      exit;
    end;
    datas:=Copy(str, pos0A+1, Pos0D-pos0A-1);
    if datas='E0' then begin
                  Log('Error: ParseFloat E0');
                  Exit; end;
    if datas='E1' then begin
                  Log('Error: ParseFloat E1');
                  Exit; end;


    try
    datas:=Trim(datas);
//    FormatSettings.DecimalSeparator:='.';
//    for i := 1 to Length(datas)-1 do
//      if datas[i]=',' then  datas[i]:='.';

//    data:=Datas.ToDouble;

    data:=StrToFloat(datas);
    except
    Log(Format('Error: ParseFloat incorrect value [%s]',[datas]));
    Exit;
    end;

    value:=data;
    result:=True;
end;

function TLaserRBOXX.ParseInt(str: string; var value: integer): Boolean;
var datas:string;
    pos0A, Pos0D, data:Integer;
begin
    Result:=False;
    data:=0;

    pos0A:=PosEx( #10, str ,1);
    pos0D:=PosEx( #13, str ,pos0A+1);
  //  Log(Format('Pos0A=%d Pos0D=%d',[pos0A, pos0D]));
    if (pos0A=0) or (Pos0D=0) then
    begin
      Log(Format('Error: ParseInt Pos0A=%d Pos0D=%d',[pos0A, pos0D]));
      exit;
    end;
    datas:=Copy(str, pos0A+1, Pos0D-pos0A-1);

    if datas='E0' then begin
                  Log('Error: ParseInt E0');
                  Exit; end;
    if datas='E1' then begin
                  Log('Error: ParseInt E1');
                  Exit; end;

    try
    data:=StrToInt(datas);
    except
    Log(Format('Error: ParseInt incorrect value [%s]',[datas]));
    Exit;
    end;

    value:=data;
    result:=True;
end;

procedure TLaserRBOXX.Send(cmd: String);
begin
if fCOMport.Connected then
    begin
    TTask.Run( procedure()
          begin
            fCritSection.Acquire;
            FormLog.MemoLog.Text:=FormLog.MemoLog.Text+ SendCmdAnsw(cmd, true);
            fCritSection.Release;
           end);
    end;
end;

function TLaserRBOXX.SendCmdAnsw(cmd: String; showBin:Boolean=false): String;

function ByteToHex(InByte:byte):string;
const Digits:array[0..15] of char='0123456789ABCDEF';
begin
 result:=digits[InByte shr 4]+digits[InByte and $0F];
end;

var
   str, buf:String;
   cnt:integer;
   t1, t2:cardinal;
begin
    if not fComPort.Connected then
   begin
   Log(' Disconnected');
   Exit;
   end;

  try
  fComPort.ClearBuffer(True, True);
  fComPort.WriteStr(cmd+#13);
  except
  Log('Error: write to port');
  exit;
  end;

  buf:='';
  str:=' ';

   t1:=GetTickCount;

  repeat
  try
  cnt:=fComPort.InputCount;
  if cnt>0 then
     begin
     fComPort.ReadStr(str,1);
     if showBin then Log(Format('cnt=%d  %s  %s', [cnt, str, ByteToHex(Byte(str[1]) )]));
     buf:=buf+str;
     end;
  except
  Log('Error: Wait timeout r1');
  Result:='';
  exit;
  end;

  Sleep(10);
  t2:=GetTickCount;
  if t2-t1>WaitTimeout then
   begin
      Log('Error: Wait timeout r2');
//      break;
      Result:='';
      exit;
   end;

  until str[1]= '>';
  Result:=buf;
end;

function TLaserRBOXX.SetBias(bias: integer): Boolean;
var str:string;
begin
if fCOMport.Connected then
    begin
    TTask.Run( procedure()
          begin
            fCritSection.Acquire;

            str:=SendCmdAnsw('SBR '+IntToStr(bias));
            if PosEx('SBR', str)>0 then
                Log('SetBias '+inttostr(bias));

             fCritSection.Release;
           end);
     Result:=True;
    end else
    result:=False;
end;

function TLaserRBOXX.SetMode(mode: TCM_MODE): Boolean;
var str:string;
begin
if fCOMport.Connected then
  begin
  TTask.Run( procedure
    begin
    fCritSection.Acquire;
      case mode of
        AutoPowCtrl: begin
                     str:=SendCmdAnsw('SAPC');
                     if PosEx('SAPC', str)>0 then
                            begin
                            //Result:=True;
                            fCM_MODE:=AutoPowCtrl;
                            end
                            //else Result:=False;
                     end ;
        AutoCurCtrl: begin
                     str:=SendCmdAnsw('SACC');
                     if PosEx('SACC', str)>0 then
                            begin
                            //Result:=True;
                            fCM_MODE:=AutoCurCtrl;
                            end
                       //else Result:=False;
                     end ;
        //else Result:=False;
       end;
       fCritSection.Release;
    end);
  Result:=True;
  end else
  Result:=False;

end;

function TLaserRBOXX.SetModulation(enable: Boolean): Boolean;
var str:string;
begin
if fCOMport.Connected then
  begin
  TTask.Run( procedure
    begin
    fCritSection.Acquire;
if enable then
         begin
          str:=SendCmdAnsw('SAMN');
          if PosEx('SAMN', str)>0 then
                 begin
            //     Result:=True;
                 fCM_MODE:=Modulation;
                 end
              //   else Result:=False;
         end
   else
         begin
          str:=SendCmdAnsw('SAMF');
          //if PosEx('SAMF', str)>0 then
          //         Result:=True
          //       else Result:=False;
         end;
       fCritSection.Release;
    end);
  Result:=True;
  end else
  Result:=False;
end;

function TLaserRBOXX.SetOnOff(on_: boolean): Boolean;
var str:string;
begin
if fCOMport.Connected then
  begin
  TTask.Run( procedure
    begin
    fCritSection.Acquire;
    if on_ then
           begin
            str:=SendCmdAnsw('SALO');
            //if PosEx('SALO', str)>0 then
            //         Result:=True
            //       else Result:=False;
           end
     else
           begin
            str:=SendCmdAnsw('SALS');
            //if PosEx('SALS', str)>0 then
            //         Result:=True
            //       else Result:=False;
           end;
       fCritSection.Release;
    end);
  Result:=True;
  end else
  Result:=False

end;

function TLaserRBOXX.SetPower(power: integer): Boolean;
var str:string;
begin
if fCOMport.Connected then
    begin
    TTask.Run( procedure()
          begin
            fCritSection.Acquire;

            str:=SendCmdAnsw('SPR '+IntToStr(power));
            if PosEx('SPR', str)>0 then
                Log('SetPower '+inttostr(power));

             fCritSection.Release;
           end);
     Result:=True;
    end else
    result:=False;
end;

procedure TLaserRBOXX.UpdateParams;
begin
 if fComPort.Connected then
     begin
       GetAlarm;
       GetOperationMode;

       GetPower_mW;
       GetBias_mA;
       GetTemp;
       GetCaseTemp;
     end;
end;

end.
