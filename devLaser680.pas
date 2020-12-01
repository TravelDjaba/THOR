unit devLaser680;

interface
uses Winapi.windows, System.Classes, System.SysUtils, CPort, Log, System.Threading, System.SyncObjs, StrUtils, System.Types;

const WaitTimeout=2000;

type
   TLaser680 = class
     private
       fComPort: TComPort;
       fConnected:Boolean;

       fPower_mW:Integer;
       fRefPower_mW:Integer;

       fWaveLength:Single;
       fOn:Boolean;
       fCritSection:TCriticalSection;

       fOnConnect, fOnDisconnect: TNotifyEvent;
       function GetWorkPort: string;
       procedure Log(str:String);

       function GetPower_mW:integer;
       function GetRefPower_mW:integer;

       function GetPower_fromDev(isLog:Boolean=false):Boolean;

     public
       constructor Create;
       destructor Destroy; override;

       property WorkPort:string read GetWorkPort;
       property OnConnect: TNotifyEvent read fOnConnect write fOnConnect;
       property OnDisconnect: TNotifyEvent read fOnDisconnect write fOnDisconnect;
       property WaveLength:Single read fWaveLength;
       property Connected:Boolean read fConnected;
       property SwitchedOn:Boolean read fOn;

       property Power_mW:Integer read GetPower_mW;
       property RefPower_mW:Integer read GetRefPower_mW;




       function SetOnOff(on_:boolean ):Boolean;
       function GetOnOff( ):Boolean;
       function SetPower(power:integer):Boolean;

       procedure UpdateParams;
       procedure InitParams;


       function SendCmdAnsw(cmd:String; showBin:Boolean=false):String;
       procedure Send(cmd:String);
       function FindLaser:Boolean;
       function CloseLaser:Boolean;

   end;

implementation

{ TLaser680 }

function TLaser680.CloseLaser: Boolean;
begin
 if fComPort.Connected then
       begin
            SetOnOff(false);
            fComPort.Close;
       end;
       fConnected:=False;
       if Assigned(OnDisconnect) then OnDisconnect(Self);
       result:=True;
end;

constructor TLaser680.Create;
begin
 inherited Create;
  fConnected:=False;
  fOn:=False;
  fComPort:= TComPort.Create(nil);
  fComPort.BaudRate:=br115200;
  fComPort.StopBits:=sbOneStopBit;
  fComPort.DataBits:=dbEight;
  fComPort.Parity.Bits:=prNone;
  fComPort.FlowControl.FlowControl:=fcSoftware;
  fCritSection:=TCriticalSection.Create;
  fWaveLength:=680.0;
end;

destructor TLaser680.Destroy;
begin
CloseLaser;
  fConnected:=false;
  FreeAndNil(fComPort);
  fCritSection.Free;
  inherited Destroy;
end;

function TLaser680.FindLaser: Boolean;
var i:integer;
    sl:TStringList;
    answ:String;
begin
 sl:=TStringList.Create;
  Result:=False;

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
    fComPort.WriteStr(#13#10);
    except
    fComPort.Close;
    Continue;
    end;
    fComPort.ClearBuffer(True,True);
    answ:=SendCmdAnsw('ID?');
    fComPort.ClearBuffer(True,True);
    answ:=SendCmdAnsw('ID?');
    Log('answ='+answ);
    if PosEx('LASER680', answ,1)>0  then
    begin
      Result:=True;
      fConnected:=True;


      if Assigned(OnConnect) then OnConnect(Self);
      Log('Find Port='+sl[i]);
      Log('>');
      Break;
    end
    else
       fComPort.Close;
    end;


  sl.Free;

end;

function TLaser680.GetOnOff: Boolean;
var str:string;
begin
  Result:=False;

if fCOMport.Connected then
  begin
      str:=SendCmdAnsw('LOCK?');

      if PosEx('LOCK 0', str)>0 then
               fOn:=True
      else
      if PosEx('LOCK 1', str)>0 then
               fOn:=False;
  Result:=True;
  end;

end;

function TLaser680.GetPower_fromDev(isLog: Boolean): Boolean;
var str:string;
    data:Integer;
begin
Result:=False;
if not fComPort.Connected then Exit;

str:=SendCmdAnsw('L1?');
if str<>'' then

// if ParseInt(str, data) then
  data:=StrToIntDef(str, 0);
  begin
    if isLog then Log(Format('Power=%d ',[data]));
    fPower_mW:=data;
    result:=True;
  end;
end;

function TLaser680.GetPower_mW: integer;
begin
  if fOn=False then
    Result:=0
  else
    Result:=fRefPower_mW;
end;

function TLaser680.GetRefPower_mW: integer;
begin
 Result:=fRefPower_mW;
end;

function TLaser680.GetWorkPort: string;
begin
result:=fComPort.Port;
end;

procedure TLaser680.InitParams;
begin
 fCritSection.Acquire;

    GetOnOff;
    GetPower_fromDev(True);

  fCritSection.Release;
end;

procedure TLaser680.Log(str: String);
begin
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('Laser680_COM  '+str);
          end);
      end);
end;

procedure TLaser680.Send(cmd: String);
begin
if fCOMport.Connected then
    begin
    TTask.Run( procedure()
          begin
            fCritSection.Acquire;
            FormLog.MemoLog.Text:=FormLog.MemoLog.Text+ SendCmdAnsw(cmd, false);
            fCritSection.Release;
           end);
    end;
end;

function TLaser680.SendCmdAnsw(cmd: String; showBin: Boolean): String;
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
  fComPort.WriteStr(cmd+#13#10);
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
//     if showBin then Log(Format('cnt=%d  %s  %s', [cnt, str, ByteToHex(Byte(str[1]) )]));

     if str[1]=#13 then
     else buf:=buf+str;
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

  until str[1]= #10;
  Result:=buf;

end;

function TLaser680.SetOnOff(on_: boolean): Boolean;
var str:string;
begin
if fCOMport.Connected then
  begin
  TTask.Run( procedure
    begin
    fCritSection.Acquire;
    if on_ then
           begin
            str:=SendCmdAnsw('LOCK 0');
            if PosEx('LOCK 0', str)>0 then
                     fOn:=True;
           end
     else
           begin
            str:=SendCmdAnsw('LOCK 1');
            if PosEx('LOCK 1', str)>0 then
                     fOn:=False;
           end;
       fCritSection.Release;
    end);
  Result:=True;
  end else
  Result:=False
end;

function TLaser680.SetPower(power: integer): Boolean;
var str:string;
begin

fRefPower_mW := power;

if fCOMport.Connected then
    begin
    TTask.Run( procedure()
          begin
            fCritSection.Acquire;

            str:=SendCmdAnsw('L1  '+IntToStr(power));
            if PosEx('L1 ', str)>0 then
                begin
                Log('SetPower '+inttostr(power));
                fPower_mW := power;
                end;

             fCritSection.Release;
           end);
     Result:=True;
    end else
    result:=False;
end;

procedure TLaser680.UpdateParams;
begin

 if fComPort.Connected then
     begin
       GetOnOff;
       GetPower_fromDev();
     end;
end;


end.
