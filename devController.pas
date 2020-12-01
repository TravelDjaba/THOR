unit devController;

interface
uses Winapi.windows, System.Classes, System.SysUtils, Vcl.Forms, CPort, Log, System.Threading, System.SyncObjs,
StrUtils, System.Types, Vcl.ExtCtrls, System.IniFiles;

const WaitTimeout=1000;
const MotX=6;
      MotY=1;
      MotZ=2;
      MotBF=3;
      MotFW=4;
      MotSlit=5;
      MotEmpty=0;


type  TMotoDoneEv=(mdDone=0, mdCal1, mdCal2, mdES1, mdES2, mdFWCalDone, mdFWDone, mdSlitCalDone, mdSlitDone, mdXDone, mdYDone, mdZDone);

      TNotyfyMotoDone=Procedure(Sender: TObject; ev: TMotoDoneEv) Of Object;


type
   TFilterWheel=class;
   TSlit=class;

   TController = class
     private
       fComPort: TComPort;
       fMonitoringTask:array[0..0]of ITask;

       fConnected:Boolean;
       fOnConnect, fOnDisconnect: TNotifyEvent;
       fOnMotoDone:TNotyfyMotoDone;
       fStopMonitoring:Boolean;

       FWA:Boolean;
       FParallelBuffer:string;

       procedure Log(str:string);
       function GetWorkPort: string;
       procedure AnalyseStr(inStr:string);

     //Leds
     private
       LedTimer:TTimer;
       led1c, led1p, led2c, led2p:Integer;
       procedure OnLedTimer(Sender:TObject);
       function  GetLedValue(idx: Integer): Integer;
       procedure SetLedValue(idx: Integer; const Value: Integer);

       property Led[idx:Integer]:Integer read GetLedValue write SetLedValue;
     public
       procedure SetLedValueAsync(idx: Integer; const Value: Integer);
       property Led1Value:Integer read led1p;
       property Led2Value:Integer read led2p;
     //End Leds

     //Flips
     private
       flip1c, flip2c:Integer;
       function  GetFlipValue(idx: Integer): Integer;
       procedure SetFlipValue(idx: Integer; const Value: Integer);
       property Flip[idx:Integer]:Integer read GetFlipValue write SetFlipValue;
     public
       procedure SetFlipValueAsync(idx: Integer; const Value: Integer);
       property Flip1Value:Integer read flip1c;
       property Flip2Value:Integer read flip2c;

     //EndFlips

     public
       fCritSection:TCriticalSection;
       FilterWheel:TFilterWheel;
       Slit:TSlit;
       FXMoving,FYMoving,FZMoving:Boolean;

       constructor Create(AOwner: TComponent);
       destructor Destroy; override;
       property WorkPort:string read GetWorkPort;

       property OnConnect: TNotifyEvent read fOnConnect write fOnConnect;
       property OnDisconnect: TNotifyEvent read fOnDisconnect write fOnDisconnect;
       property OnMotoDone: TNotyfyMotoDone read fOnMotoDone write fOnMotoDone;


       property Connected:Boolean read fConnected;

       procedure Send(cmd:String);
       function SendCmdAnsw(cmd:String; showBin:Boolean=false):String;
       procedure SendCmdAsync(str:string);
       function FindController:Boolean;
       function CloseController:Boolean;
       procedure SaveXYZpos;
       procedure CalibrateXYZasync;
       function CanUseLastPosition(const motoIdx:integer):boolean;

       procedure InitParams;
       procedure ReadParallel;

    end;

       TFilter=record
         Name:string;
         position:Integer;
       end;

       TFilterWheel=class (TObject)
       private
         FPort:Integer;
         FOwner:TController;
         FCalibrating:Boolean;
         FMoving:Boolean;
         FLastFilterPosition:Integer;

       public
         Filter:array[0..7] of TFilter;
         constructor Create(AOwner: TController);
         destructor Destroy;
         function LoadSettings:boolean;
         function SaveSettings:boolean;

         function DoCalibration:Boolean;
         function GotoFilter(idx:integer):Boolean;

         property Port:Integer read FPort;
         property Calibrating:Boolean read FCalibrating;
         property Moving:Boolean read FMoving;

         property Position:integer read FLastFilterPosition;

        end;

     TSlit=class (TObject)
       private
         FPort:Integer;
         FOwner:TController;
         FCalibrating:Boolean;
         FMoving:Boolean;
         FProportion:Single;
         FSlitMicrons:Integer;
         FLastPosition:Integer;

       public

         constructor Create(AOwner: TController);
         destructor Destroy;
         function LoadSettings:boolean;
         function SaveSettings:boolean;

         function DoCalibration:Boolean;
         procedure SetSlit(microns:integer);

         property Port:Integer read FPort;
         property Proportion:Single read FProportion write FProportion;

         property Calibrating:Boolean read FCalibrating;
         property Moving:Boolean read FMoving;
         property SlitMicrons:Integer read FSlitMicrons ;
        end;

var canChange:Boolean=True;

implementation

{ TController }

procedure TController.AnalyseStr(inStr: string);
begin

///Separately EndStops

if Pos('ES1', inStr)>0 then
    begin
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdES1)
    end
else
if Pos('ES2', inStr)>0 then
    begin
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdES2)
    end;
/////////////////////
///


if Pos(Format('M%d CAL1 done',[FilterWheel.Port]), inStr )>0 then
    begin
    FilterWheel.FCalibrating:=False;
    SendCmdAnsw(Format('M%d POS 0',[FilterWheel.Port]));
    if FilterWheel.FLastFilterPosition>=0 then
       FilterWheel.GotoFilter(FilterWheel.FLastFilterPosition);

    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdFWCalDone)
    end
else
if Pos(Format('M%d done',[FilterWheel.Port]), inStr)>0 then
    begin
    FilterWheel.FMoving:=False;
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdFWDone)
    end
else

if Pos(Format('M%d CAL1 done',[Slit.Port]), inStr )>0 then
    begin
    Slit.FCalibrating:=False;
    Slit.FSlitMicrons:=0;
    SendCmdAnsw(Format('M%d POS 0',[Slit.Port]));
    if (Slit.FLastPosition>=0) and (Slit.FLastPosition<=2000)   then
      Slit.SetSlit(Slit.FLastPosition);
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdSlitCalDone)
    end
else
if Pos(Format('M%d done',[MotX]), inStr)>0 then
    begin
    FXMoving:=False;
    Log('X move done');
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdXDone)
    end
else
if Pos(Format('M%d done',[MotY]), inStr)>0 then
    begin
    FYMoving:=False;
    Log('Y move done');
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdYDone)
    end
else
if Pos(Format('M%d done',[MotZ]), inStr)>0 then
    begin
    FZMoving:=False;
    Log('Z move done');
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdZDone)
    end
else
if Pos(Format('M%d done',[Slit.Port]), inStr)>0 then
    begin
    Slit.FMoving:=False;
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdSlitDone)
    end
else
if Pos('CAL1', inStr)>0 then
    begin
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdCal1)
    end
else
if Pos('CAL2', inStr)>0 then
    begin
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdCal2)
    end
else
if Pos('done', inStr)>0 then
    begin
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdDone);
    end;


end;

procedure TController.CalibrateXYZasync;
begin
if fConnected then
TTask.Run(procedure()
        begin
        fCritSection.Acquire;
        SendCmdAnsw(Format('M%d CALR1',[MotX]));
        fCritSection.Release;
        sleep(50);
        fCritSection.Acquire;
        SendCmdAnsw(Format('M%d CALR1',[MotY]));
        fCritSection.Release;
        sleep(50);
        fCritSection.Acquire;
        SendCmdAnsw(Format('M%d CALR1',[MotZ]));
        fCritSection.Release;
        sleep(50);
        end);
end;

function TController.CanUseLastPosition(const motoIdx: integer): boolean;
var str:string;
begin
Result:=false;

    str:=SendCmdAnsw(Format('M%d CANUSELP?',[motoIdx]));
    if Pos(Format('M%d CANUSELP',[motoIdx]), str)>0 then
          begin
            Delete(str, 1, 12);
            str:=trim(str);
            if (str='0') then Result:=false
              else Result:=true;
          end;
end;

function TController.CloseController: Boolean;
begin
   if Assigned(fMonitoringTask[0]) and (fMonitoringTask[0].Status = TTaskStatus.Running) then
        begin
        fStopMonitoring:=True;

        if not fMonitoringTask[0].Wait(1000) then
           begin
           fMonitoringTask[0].Cancel;
           Sleep(500);
          end;
        end;

       if fComPort.Connected then
            fComPort.Close;
       fConnected:=False;
       if Assigned(OnDisconnect) then OnDisconnect(Self);
       result:=True;
end;

constructor TController.Create(AOwner: TComponent);
begin
  inherited Create;
  fConnected:=False;
  fComPort:= TComPort.Create(nil);
  fComPort.BaudRate:=br19200;
  fComPort.StopBits:=sbOneStopBit;
  fComPort.DataBits:=dbEight;
  fComPort.Parity.Bits:=prNone;
  fComPort.FlowControl.FlowControl:= fcNone;
  fCritSection:=TCriticalSection.Create;
  FormatSettings.DecimalSeparator:='.';
  FWA:=False;

  LedTimer:=TTimer.Create(AOwner);
  LedTimer.Interval:=500;
  LedTimer.OnTimer:=OnLedTimer;
  LedTimer.Enabled:=False;

  FParallelBuffer:='';

  fMonitoringTask[0]:=TTask.Create( procedure()
      var i:Integer;
       begin
        fStopMonitoring:=False;
        while true do
          begin
          if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
          if fStopMonitoring then Break;

          if not FWA then
             begin
              fCritSection.Acquire;
               ReadParallel;
              fCritSection.Release;
             end;
          for i := 0 to 0 do
              begin
              if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
              if fStopMonitoring then Break;
              sleep(5);
              end;
          end;
       end);

  FilterWheel:=TFilterWheel.Create(Self);
  Slit:=TSlit.Create(Self);
end;

destructor TController.Destroy;
begin
 // CloseController;
  FilterWheel.Free;
  Slit.Free;
  fCritSection.Free;
  fConnected:=false;
  FreeAndNil(fComPort);
  inherited Destroy;
end;

function TController.FindController: Boolean;
var i,j:integer;
    sl:TStringList;
    answ:String;
begin
  sl:=TStringList.Create;
  Result:=False;

  fCritSection.Acquire;
  CloseController;

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

//    Log('try to Clear');

    try
    fComPort.ClearBuffer(True,True);
    except
    fComPort.Close;
    Continue;
    end;

//    Log('try to send ""');
      try
    fComPort.WriteStr('');
    except
    fComPort.Close;
    Continue;
    end;
    fComPort.ClearBuffer(True,True);

//    Log('try to "LOG IN"#13#10');
 //    for j := 0 to 3 do
    answ:=SendCmdAnsw('LOG IN');
    if PosEx('RB MAIN CONTROLLER', answ,1)>0  then
    begin
      Result:=True;
      fConnected:=True;

         for j := 0 to 6 do
         begin
         answ:=SendCmdAnsw(Format('M%d ADDR %d',[j,j]) );
         sleep(5);
         end;

//         for j := 0 to 5 do
//         begin
//         answ:=SendCmdAnsw(Format('M%d ADDR %d',[j,j]) );
//         sleep(5);
//         end;
//         SendCmdAnsw(Format('M6 ADDR 0',[]) );


         answ:=SendCmdAnsw('PE ?');
         sleep(5);

         answ:=SendCmdAnsw('SY ?');
         sleep(5);

      fMonitoringTask[0].Start;

      if Assigned(OnConnect) then OnConnect(Self);
      Log('Find Port='+sl[i]);
      Break;
    end
    else
       fComPort.Close;
    end;
  fCritSection.Release ;

  sl.Free;

end;

function TController.GetFlipValue(idx: Integer): Integer;
var s:string;
begin
   s:=SendCmdAnsw(Format('PE F%d?',[idx]));

   if Pos(Format('PE F%d',[idx]), s)>0 then
           begin
            Delete(s, 1, 5);
            s:=trim(s);
            if Pos('U', s)>0 then Result:=1
            else
            if Pos('D', s)>0 then Result:=0
            else Result:=-1;
           end;
end;

function TController.GetLedValue(idx: Integer): Integer;
var s:string;
begin
   s:=SendCmdAnsw(Format('PE L%d?',[idx]));

   if Pos(Format('PE L%d ',[idx]), s)>0 then
           begin
            Delete(s, 1, 6);
            s:=trim(s);
            Result:=StrToIntDef(s, -1);
           end;
end;

function TController.GetWorkPort: string;
begin
result:=fComPort.Port;
end;

procedure TController.InitParams;
begin
 fCritSection.Acquire;

led1p:=Led[1];
led1c:=led1p;
led2p:=Led[2];
led2c:=led2p;

flip1c:=Flip[1];
flip2c:=Flip[2];

fCritSection.Release;
end;

procedure TController.Log(str: string);
begin
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('ControllerCOM  '+str);
          end);
      end);
end;

procedure TController.OnLedTimer(Sender: TObject);
begin
if (led1c=led1p)and(led2c=led2p) then
   begin
   LedTimer.Enabled:=False;
   Exit;
   end;

 if canChange then
 TTask.Run(procedure
   begin
     if canChange then
       begin
          fCritSection.Acquire;
          if led1c<>led1p then
             begin
             Led[1]:=led1c;
             led1p:=led1c;
             end;

          if led2c<>led2p then
             begin
             Led[2]:=led2c;
             led2p:=led2c;
             end;

           fCritSection.Release;
     end;
 end);
end;

procedure TController.ReadParallel;
var cnt:Integer;
    s:string;
begin

   cnt:=fComPort.InputCount;
   if cnt>0 then
     try
       repeat
       fComPort.ReadStr(s,1);
       FParallelBuffer:=FParallelBuffer+s;
       until (fComPort.InputCount=0) or (s=#10);
     except
     end;

     if s=#10 then
       begin
       Log(FParallelBuffer);
       AnalyseStr(FParallelBuffer);
       FParallelBuffer:='';
       s:='';
       end;

end;

procedure TController.SaveXYZpos;
begin
if Connected then
 TTask.Run( procedure
           var s:string;
           begin
           FCritSection.Acquire;
           s:=SendCmdAnsw('M0 SAVELP');
           s:=SendCmdAnsw('M1 SAVELP');
           s:=SendCmdAnsw('M2 SAVELP');
           FCritSection.Release;
           end);

end;

procedure TController.Send(cmd: String);
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

function TController.SendCmdAnsw(cmd: String; showBin: Boolean=false): String;

function ByteToHex(InByte:byte):string;
const Digits:array[0..15] of char='0123456789ABCDEF';
begin
 result:=digits[InByte shr 4]+digits[InByte and $0F];
end;

const repeatCnt=2;
var
   str, buf:String;
   cnt, rcnt:integer;
   t1, t2:cardinal;
begin
    if not fComPort.Connected then
   begin
   Log(' Disconnected');
   Exit;
   end;

rcnt:=0;
  repeat
  Inc(rcnt);
  FWA:=True;

  try
  fComPort.WriteStr(cmd+#13#10);
  Log( '>> ' + cmd);
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
  Log('Error: Wait timeout');
  exit;
  end;

  Sleep(10);
  t2:=GetTickCount;
  if t2-t1>WaitTimeout then
   begin
      Log('Error: Wait timeout');
      break;
   end;

  until str[1]= #10;

 until ( ((Pos('WRONG CMD', buf)=0) and (Pos('NoAnsw', buf)=0)) or (rcnt=repeatCnt)) ;
  FWA:=False;

Log( '<< ' + buf);

  Result:=buf;

end;

procedure TController.SendCmdAsync(str: string);
begin
if Connected then

TTask.Run( procedure
           var s:string;
           begin
           FCritSection.Acquire;
           s:=SendCmdAnsw(str);
       //    frmControllerSettings.MemoLog.text:=frmControllerSettings.MemoLog.text + s;
           FCritSection.Release;
           end);
end;

procedure TController.SetFlipValue(idx: Integer; const Value: Integer);
var s, v:string;
begin
   if Value=0 then v:='D'
   else v:='U';
   s:=SendCmdAnsw(Format('PE F%d%s',[idx, v]));
   if Pos('PE F1D',s)>0 then flip1c:=0
   else
   if Pos('PE F1U',s)>0 then flip1c:=1
   else
   if Pos('PE F2D',s)>0 then flip2c:=0
   else
   if Pos('PE F2U',s)>0 then flip2c:=1;
end;

procedure TController.SetFlipValueAsync(idx: Integer; const Value: Integer);
begin
if Connected then
 if canChange  then
   TTask.Run(procedure
      begin
        fCritSection.Acquire;
        case idx of
          1: begin
            Flip[1]:=Value;
          end;
          2: begin
            Flip[2]:=Value;
          end;
          end;
        fCritSection.Release;
    end);
end;

procedure TController.SetLedValue(idx: Integer; const Value: Integer);
var s:string;
begin
   s:=SendCmdAnsw(Format('PE L%d %d',[idx, Value]));
end;

procedure TController.SetLedValueAsync(idx: Integer; const Value: Integer);
begin
if Connected then
 if canChange  then
    case idx of
      1: begin
        led1c:=Value;
        LedTimer.Enabled:=True;
      end;
      2: begin
        led2c:=Value;
        LedTimer.Enabled:=True;
      end;

    end;
end;

{ TFilterWheel }



constructor TFilterWheel.Create(AOwner: TController);
var
  i: Integer;
begin
 FOwner:=AOwner;
 FPort:=MotFW;
for i := 0 to 7 do
 begin
 Filter[i].Name:='Filter #'+intToStr(i+1);
 Filter[i].Position:=0;
 end;


end;

destructor TFilterWheel.Destroy;
begin

end;

function TFilterWheel.DoCalibration: Boolean;
begin
if FOwner.Connected  then
         begin
         Fowner.SendCmdAnsw(Format('M%d CAL1',[Port]));
         FCalibrating:=True;
         end;
end;

function TFilterWheel.GotoFilter(idx:integer): Boolean;
begin
if FOwner.Connected  then
  begin
  FOwner.SendCmdAsync(Format('M%d MOVA %d',[Port, Filter[idx].Position ]));
  FLastFilterPosition:=idx;
  FMoving:=True;
  end;
end;


function TFilterWheel.LoadSettings: boolean;
var Ini:TIniFile;
  section:string;

  i,j:integer;
begin
result:=False;
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
try
    section:='FilterWheel';

   if Ini.SectionExists(section) then
         begin

         FPort :=Ini.ReadInteger(section,'Port',4 );
         FLastFilterPosition :=Ini.ReadInteger(section,'LastFilterPosition',-9999 );
         for j:=0 to 7 do
           begin
             Filter[j].Name :=Ini.ReadString(section,'Name'+IntToStr(j),'Filter'+IntToStr(j));
             Filter[j].Position :=Ini.ReadInteger(section,'Position'+IntToStr(j),0 );
          end;
       end;

result:=True;
finally
Ini.Free;
end;


end;

function TFilterWheel.SaveSettings: boolean;
var Ini:TMemIniFile;
    section:string;
    i,j:Integer;
begin
result:=False;
Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
  section:='FilterWheel';

      Ini.WriteInteger(section,'Port', Port);
      Ini.WriteInteger(section,'LastFilterPosition',FLastFilterPosition);
  for I := 0 to 7 do
      begin
        Ini.WriteString(section,'Name'+intToStr(i), Filter[i].Name);
        Ini.WriteInteger(section,'Position'+intToStr(i), Filter[i].Position);
      end;

try
Ini.UpdateFile;
result:=True;
finally
Ini.Free;
end;


end;

{ TSlit }

constructor TSlit.Create(AOwner: TController);
begin
 FOwner:=AOwner;
 FPort:=MotSlit;
 FProportion:= 0.4;
 FLastPosition:=0;
 LoadSettings;

end;

destructor TSlit.Destroy;
begin
 SaveSettings;
end;

function TSlit.DoCalibration: Boolean;
begin
if FOwner.Connected  then
         begin
         Fowner.SendCmdAnsw(Format('M%d CAL1',[Port]));
         FCalibrating:=True;
         end;

end;


function TSlit.LoadSettings: boolean;
 var Ini:TMemIniFile;
  section:string;

  i,j:integer;
begin
result:=False;
Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
try
    section:='Slit';

   if Ini.SectionExists(section) then
       begin
         FPort :=Ini.ReadInteger(section,'Port',4 );
         FProportion :=Ini.ReadFloat(section,'Proportion',0.4 );
         FLastPosition :=Ini.ReadInteger(section,'LastPosition',-9999 );
       end;

result:=True;
finally
Ini.Free;
end;
end;

function TSlit.SaveSettings: boolean;
var Ini:TMemIniFile;
    section:string;
    i,j:Integer;
begin
result:=False;
Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
  section:='Slit';

   Ini.WriteInteger(section,'Port', Port);
   Ini.WriteFloat(section,'Proportion', FProportion );
   Ini.WriteInteger(section,'LastPosition', FSlitMicrons);

try
Ini.UpdateFile;
result:=True;
finally
Ini.Free;
end;
end;

procedure TSlit.SetSlit(microns: integer);
begin
if FOwner.Connected  then
  begin
  FOwner.SendCmdAsync(Format('M%d MOVA %d',[Port, Round(microns*FProportion) ]));
  FSlitMicrons:=microns;
  FMoving:=True;
  end;

end;

end.
