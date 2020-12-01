unit devControllerM;

interface
uses Winapi.windows, System.Classes, System.SysUtils, Vcl.Forms, CPort, Log, System.Threading, System.SyncObjs,
StrUtils, System.Types, Vcl.ExtCtrls, System.IniFiles;

const WaitTimeout=2000;

const IDMotX='M1';
      IDMotY='M6';
      IDMotZ='M2';
      IDMotBF='M3';
      IDMotFW='M4';
      IDMotSlit='M0';
      IDMotColim='M5';

type  TMotoDoneEv=(mdDone=0, mdCal1, mdCal2, mdES1, mdES2);
      TNotyfyMotoDone=Procedure(Sender: TObject; ev: TMotoDoneEv) Of Object;

      TFilter=record
         Name:string;
         position:Integer;
       end;


  {/*   CUSTOM UNIT  */}
type

  TCommEventThread = class;

  TCustomComUnit = class(TComponent)
    private
      fWA:Boolean;
      fComPort:TComPort;
      fLogName:String;
      fFindName:String;

      fConnected:Boolean;

      FMonitoringThread: TCommEventThread;

      procedure SendCmd(cmd:String);
      procedure SendCmdAsync(str:string);
      function SendCmdAnsw(cmd:String; logged:Boolean=True):String;

      procedure OnComPortAfterOpen(Sender: TObject);
      procedure OnComPortAfterClose(Sender: TObject);
      procedure AnalyseStr(str:string); virtual; abstract;

      procedure Log(str:string);

    public
      FCritSection:TCriticalSection;

      constructor Create(AOwner: TComponent; LogName:string=''; FindName:String='' );
      destructor Destroy; override;
      function Connect:Boolean;
      procedure Disconnect;

      property Connected:Boolean read fConnected;
  end;

  TCommEventThread = class(TThread)
     private
       FOwner: TCustomComUnit;
       FEvent: TEvent;
       fMonitoringBuffer:string;
     protected
       procedure DoEvent;
       procedure Execute; override;
       procedure StopThread;
     public
       constructor Create(AOwner: TCustomComUnit);
       destructor Destroy; override;

  end;


{/*   MOTOR  */}
  TMotor = class(TCustomComUnit)
    private
      FCalibrating:Boolean;
      FMoving:Boolean;
      fOnMotoDone:TNotyfyMotoDone;

      procedure AnalyseStr(str:string);  override;
      function GetPosition: Integer;
      procedure SetPosition(const Value: Integer);
      function GetEncPosition: Integer;
      procedure SetEncPosition(const Value: Integer);
      function GetReverse: Boolean;
      procedure SetReverse(const Value: Boolean);
      function GetEncReverse: Boolean;
      procedure SetEncReverse(const Value: Boolean);
      function GetLimit1: Integer;
      function GetLimit2: Integer;
      procedure SetLimit1(const Value: Integer);
      procedure SetLimit2(const Value: Integer);
      function GetCanUseLastPosition: Boolean;
      function GetAcceleration: Integer;
      function GetCurrent: Integer;
      function GetEndStopType: Integer;
      function GetSpeed: Integer;
      function GetStepMode: Integer;
      function GetMaxSpeed: Integer;
      procedure SetMaxSpeed(const Value: Integer);
      procedure SetAcceleration(const Value: Integer);
      procedure SetCurrent(const Value: Integer);
      procedure SetEndStopType(const Value: Integer);
      procedure SetSpeed(const Value: Integer);
      procedure SetStepMode(const Value: Integer);
    public
      constructor Create(AOwner: TComponent; LogName:string=''; FindName:String='');
      destructor Destroy; override;

      procedure MovAbs(step:integer);
      procedure MovRel(step:integer);
      procedure Cal1;
      procedure Cal2;
      procedure CalR1;
      procedure CalR2;
      procedure Stop;
      procedure ResetDriver;
      procedure ShowEndStop;
      procedure ShowError;

      procedure SaveLastPosition;

      property Position:Integer read GetPosition write SetPosition;
      property EncPosition:Integer read GetEncPosition write SetEncPosition;
      property Reverse:Boolean read GetReverse write SetReverse;
      property EncReverse:Boolean read GetEncReverse write SetEncReverse;
      property Limit1:Integer read GetLimit1 write SetLimit1;
      property Limit2:Integer read GetLimit2 write SetLimit2;

      property Speed:Integer read GetSpeed write SetSpeed;
      property MaxSpeed:Integer read GetMaxSpeed write SetMaxSpeed;
      property Acceleration:Integer read GetAcceleration write SetAcceleration;
      property StepMode:Integer read GetStepMode write SetStepMode;
      property Current:Integer read GetCurrent write SetCurrent;
      property EndStopType:Integer read GetEndStopType write SetEndStopType;

      property CanUseLastPosition:Boolean read GetCanUseLastPosition;

      property OnMotoDone: TNotyfyMotoDone read fOnMotoDone write fOnMotoDone;
      property Moving:Boolean read FMoving;
      property Calibrating:Boolean read FCalibrating;
  end;

{/*   FILTER WHEEL  */}

 TFilterWheel=class (TMotor)
       private
         FLastFilterPosition:Integer;

       public
         Filter:array[0..7] of TFilter;
         constructor Create(AOwner: TComponent; LogName:string=''; FindName:String='');
         destructor Destroy; override;
         function LoadSettings:boolean;
         function SaveSettings:boolean;

         function DoCalibration:Boolean;
         function GotoFilter(idx:integer):Boolean;

         property Position:integer read FLastFilterPosition;

        end;

{/*   SLIT  */}

  TSlit = class(TMotor)
      private
         FProportion:Single;
         FSlitMicrons:Integer;
         FLastPosition:Integer;

         procedure SetSlit(microns:integer);
         function GetSlit:integer;

      public
         constructor Create(AOwner: TComponent; LogName:string=''; FindName:String='');
         destructor Destroy; override;

         function LoadSettings:boolean;
         function SaveSettings:boolean;
         function DoCalibration:Boolean;

         property Proportion:Single read FProportion write FProportion;
         property SlitMicrons:Integer read GetSlit write SetSlit;
    end;


{/*   SYNC  */}
  TSync = class(TCustomComUnit)
    private

    public
      constructor Create(AOwner: TComponent; LogName:string='SY'; FindName:String='SY');
      destructor Destroy; override;

  end;

{/*   PERIPHERIALS  */}
  TPeripherials = class(TCustomComUnit)
    private
      fLed1,fLed2:byte;
      fFlip1, fFlip2:Boolean;

      function  GetLed1: byte;
      procedure SetLed1(const Value: byte);
      function  GetLed2: byte;
      procedure SetLed2(const Value: byte);
      function  GetFlip1: Boolean;
      procedure SetFlip1(const Value: Boolean);
      function  GetFlip2: Boolean;
      procedure SetFlip2(const Value: Boolean);

    public
      constructor Create(AOwner: TComponent; LogName:string='PE'; FindName:String='PE');
      destructor Destroy; override;

      property Led1:byte read GetLed1 write SetLed1;
      property Led2:byte read GetLed2 write SetLed2;
      property Flip1:Boolean read GetFlip1 write SetFlip1;
      property Flip2:Boolean read GetFlip2 write SetFlip2;

      property LastFlip1:Boolean read fFlip1;
      property LastFlip2:Boolean read fFlip2;

      property LastLed1:Byte read fLed1;
      property LastLed2:Byte read fLed2;

      function LoadSettings:boolean;
      function SaveSettings:boolean;

  end;

 TControllerM = class(TCustomComUnit)
    private

    public
      MotX, MotY, MotZ, BF, MotColim:TMotor;
      FilterWheel :TFilterWheel;
      Slit:TSlit;
      Sync:TSync;
      Periph:TPeripherials;

      constructor Create(AOwner: TComponent; LogName:string=''; FindName:String='');
      destructor Destroy; override;

      function FindControllers:Boolean;
      function CheckControllers:Boolean;
      procedure DisconnectControllers;
      procedure SendCmdToConsole(cmd:string);
      procedure SaveXYZpos;


  end;




implementation

uses
  Main;

{ TCustomComUnit }

function TCustomComUnit.Connect: Boolean;
var answ:String;
begin
if fComPort.Port<>'' then
  fComPort.Open;

  answ:= SendCmdAnsw('ID?', false);

 // Log('connected to '+fComPort.Port+': ID? > '+ answ);
  if answ='RB '+fFindName then
      begin
      Result:=True;

      FMonitoringThread:= TCommEventThread.Create(Self);
      FMonitoringThread.Priority:=tpNormal;
      FMonitoringThread.Start;

      end
     else
      begin
      Result:=False;
      Disconnect;
      end;


end;

constructor TCustomComUnit.Create(AOwner: TComponent; LogName, FindName: String);
begin
  inherited Create(AOwner);
fComPort:=TComPort.Create(AOwner);
fComPort.BaudRate:=br115200;
fComPort.Parity.Bits:=prNone;
fComPort.StopBits:=sbOneStopBit;
fComPort.DataBits:=dbEight;

fComPort.OnAfterOpen:=OnComPortAfterOpen;
fComPort.OnAfterClose:=OnComPortAfterClose;
//fComPort.OnRxChar:=OnComPortRxChar;

fComPort.Port:='';
fWA:=False;


fLogName:=LogName;
fFindName:=FindName;
fConnected:=False;
FCritSection:=TCriticalSection.Create;

end;

destructor TCustomComUnit.Destroy;
begin
  if fComPort.Connected then
  Disconnect;
  FCritSection.Free;

  fComPort.Free;
  inherited;
end;

procedure TCustomComUnit.Disconnect;
begin
  if FMonitoringThread <> nil then
  begin
    FMonitoringThread.StopThread;
    FMonitoringThread.WaitFor;  //Do not free until thread is finished executing
    FMonitoringThread.Free;
    FMonitoringThread := nil;
  end;

 try
 if fComPort.Connected then
   fComPort.Close;

 finally
 fConnected:=False;
 end;

end;

procedure TCustomComUnit.Log(str: string);
begin
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add(fLogName+' '+ str);

          end);
      end);
end;

procedure TCustomComUnit.OnComPortAfterClose(Sender: TObject);
begin
fConnected:=False;
end;

procedure TCustomComUnit.OnComPortAfterOpen(Sender: TObject);
begin
fConnected:=True;
end;

procedure TCustomComUnit.SendCmd(cmd: String);
begin
if fCOMport.Connected then
    begin
    fComPort.WriteStr(cmd+#13#10);
    Log( '>> ' + cmd);
    end;
end;

function TCustomComUnit.SendCmdAnsw(cmd: String; logged:Boolean=true): String;
const repeatCnt=1;
 var
   tmp:string;
   buf:String;
   cnt, rcnt, i:integer;
   bFlag, timeLimit:Boolean;
   t1, t2:cardinal;
begin
  if not fComPort.Connected then
   begin
 //  Log(' Disconnected');
   Exit;
   end;

//rcnt:=0;
//  repeat
    fWA:=True;
    try
    fComPort.WriteStr(cmd+#13#10);
    if logged then
          Log( '>> ' + cmd);
    except
    Log('Error: write to port');
    exit;
    end;

    buf:='';
    tmp:='';
    bFlag:=False;
    timeLimit:= False;

     t1:=GetTickCount;

    repeat
      try
      cnt:=fComPort.InputCount;
      if cnt>0 then
         begin
          fComPort.ReadStr(tmp,1);
          if tmp[1]=#13 then
          else
          if tmp[1]=#10 then
            bFlag:=True
          else
           buf:=buf+tmp[1];
         end;
      except
      Log('Error: Read port');
      exit;
      end;

     if not bFlag then
       begin
       Sleep(10);

        if GetTickCount-t1>WaitTimeout then
         begin
            Log('Error: Wait timeout');
            timeLimit:=True;
         end;
       end;

    until bFlag or timeLimit;
    fWA:=False;

//    Inc(rcnt);
//  until (  (Pos('WRONG CMD', buf)=0) or (rcnt=repeatCnt) or bFlag) ;

  if logged then
    Log( '<< ' + buf);

  Result:=buf;


end;

procedure TCustomComUnit.SendCmdAsync(str: string);
begin
if fComPort.Connected then
TTask.Run( procedure
           var s:string;
           begin
           FCritSection.Acquire;
           s:=SendCmdAnsw(str);
           FCritSection.Release;
           end);
end;

{ TMotor }

procedure TMotor.AnalyseStr(str: string);
begin
Log(' << '+str);
if Pos('done', str)=1 then
    begin
    fMoving:=False;
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdDone)
    end
else

if Pos('ES1', str)>0 then
    begin
    fMoving:=False;
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdES1)
    end
else

if Pos('ES2', str)>0 then
    begin
    fMoving:=False;
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdES2)
    end
else

if Pos('CAL1 done', str)>0 then
    begin
    FCalibrating:=False;
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdCal1)
    end
else

if Pos('CAL2 done', str)>0 then
    begin
    FCalibrating:=False;
    if Assigned(fOnMotoDone) then
         fOnMotoDone(Self, mdCal2)
    end;
end;

procedure TMotor.Cal1;
var answ:string;
begin
answ:=SendCmdAnsw('CAL1');
if Pos('start', answ)>0 then
  FCalibrating:=True;
end;

procedure TMotor.Cal2;
var answ:string;
begin
answ:=SendCmdAnsw('CAL2');
if Pos('start', answ)>0 then
  FCalibrating:=True;
end;

procedure TMotor.CalR1;
var answ:string;
begin
answ:=SendCmdAnsw('CALR1');
if Pos('start', answ)>0 then
  begin
  FCalibrating:=True;
  FMoving:=True;
  end;
end;

procedure TMotor.CalR2;
var answ:string;
begin
answ:=SendCmdAnsw('CALR2');
if Pos('start', answ)>0 then
  begin
  FCalibrating:=True;
  FMoving:=True;
  end;
end;

constructor TMotor.Create(AOwner: TComponent; LogName, FindName: String);
begin
inherited Create(AOwner, LogName, FindName);
FCalibrating:=False;
FMoving:=False;
end;

destructor TMotor.Destroy;
begin
 inherited;
end;

function TMotor.GetAcceleration: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('ACC?');
if Pos('ACC ', answ)>0 then
  begin
   Delete(answ, 1,4);
   Result:=Round(StrToFloatDef(answ, 0));
  end;
end;

function TMotor.GetCanUseLastPosition: Boolean;
var answ:string;
begin
answ:=SendCmdAnsw('CANUSELP?');
if Pos('CANUSELP 0', answ)>0 then
  Result:=False
else
if Pos('CANUSELP 1', answ)>0 then
  Result:=True;
end;

function TMotor.GetCurrent: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('CUR?');
if Pos('CUR ', answ)>0 then
  begin
   Delete(answ, 1,4);
   Result:=StrToIntDef(answ, 0);
  end;
end;

function TMotor.GetEncPosition: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('ENCPOS?');
if Pos('ENCPOS ', answ)>0 then
  begin
   Delete(answ, 1,7);
   Result:=StrToIntDef(answ, 0);
  end;
end;

function TMotor.GetEncReverse: Boolean;
var answ:string;
begin
answ:=SendCmdAnsw('ENCREV?');
if Pos('ENCREV 0', answ)>0 then
  Result:=False
else
if Pos('ENCREV 1', answ)>0 then
  Result:=True;
end;

function TMotor.GetEndStopType: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('ESTYPE?');
if Pos('ESTYPE ', answ)>0 then
  begin
   Delete(answ, 1,7);
   Result:=StrToIntDef(answ, 0);
  end;
end;

function TMotor.GetLimit1: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('LIM1?');
if Pos('LIM1 ', answ)>0 then
  begin
   Delete(answ, 1,5);
   Result:=StrToIntDef(answ, 0);
  end;
end;

function TMotor.GetLimit2: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('LIM2?');
if Pos('LIM2 ', answ)>0 then
  begin
   Delete(answ, 1,5);
   Result:=StrToIntDef(answ, 0);
  end;
end;

function TMotor.GetMaxSpeed: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('MSPD?');
if Pos('MSPD ', answ)>0 then
  begin
   Delete(answ, 1,5);
   Result:=Round(StrToFloatDef(answ, 0));
  end;
end;

function TMotor.GetPosition: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('POS?');
if Pos('POS ', answ)>0 then
  begin
   Delete(answ, 1,4);
   Result:=StrToIntDef(answ, 0);
  end;
end;

function TMotor.GetReverse: Boolean;
var answ:string;
begin
answ:=SendCmdAnsw('REV?');
if Pos('REV 0', answ)>0 then
  Result:=False
else
if Pos('REV 1', answ)>0 then
  Result:=True;
end;

function TMotor.GetSpeed: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('SPD?');
if Pos('SPD ', answ)>0 then
  begin
   Delete(answ, 1,4);
   Result:=Round(StrToFloatDef(answ, 0));
  end;
end;

function TMotor.GetStepMode: Integer;
var answ:string;
begin
answ:=SendCmdAnsw('STEPM?');
if Pos('STEPM ', answ)>0 then
  begin
   Delete(answ, 1,6);
   Result:=StrToIntDef(answ, 0);
  end;
end;

procedure TMotor.MovAbs(step: integer);
var answ:string;
begin
answ:=SendCmdAnsw('MOVA '+step.ToString);
if Pos('start', answ)>0 then
  FMoving:=True;
end;

procedure TMotor.MovRel(step: integer);
var answ:string;
begin
answ:=SendCmdAnsw('MOVAR '+step.ToString);
if Pos('start', answ)>0 then
  FMoving:=True;
end;

procedure TMotor.ResetDriver;
begin
SendCmdAnsw('RST');
end;

procedure TMotor.SaveLastPosition;
begin
SendCmdAnsw('SAVELP');
end;

procedure TMotor.SetAcceleration(const Value: Integer);
begin
SendCmdAnsw('ACC '+value.ToString);
end;

procedure TMotor.SetCurrent(const Value: Integer);
begin
SendCmdAnsw('CUR '+value.ToString);
end;

procedure TMotor.SetEncPosition(const Value: Integer);
begin
SendCmdAnsw('ENCPOS '+value.ToString);
end;

procedure TMotor.SetEncReverse(const Value: Boolean);
begin
if value then
SendCmdAnsw('ENCREV 1')
else
SendCmdAnsw('ENCREV 0');
end;

procedure TMotor.SetEndStopType(const Value: Integer);
begin
SendCmdAnsw('ESTYPE '+value.ToString);
end;

procedure TMotor.SetLimit1(const Value: Integer);
begin
SendCmdAnsw('LIM1 '+value.ToString);
end;

procedure TMotor.SetLimit2(const Value: Integer);
begin
SendCmdAnsw('LIM2 '+value.ToString);
end;

procedure TMotor.SetMaxSpeed(const Value: Integer);
begin
SendCmdAnsw('MSPD '+value.ToString);
end;

procedure TMotor.SetPosition(const Value: Integer);
begin
SendCmdAnsw('POS '+value.ToString);
end;

procedure TMotor.SetReverse(const Value: Boolean);
begin
if value then
SendCmdAnsw('REV 1')
else
SendCmdAnsw('REV 0');
end;

procedure TMotor.SetSpeed(const Value: Integer);
begin
SendCmdAnsw('SPD '+value.ToString);
end;

procedure TMotor.SetStepMode(const Value: Integer);
begin
SendCmdAnsw('STEPM '+value.ToString);
end;

procedure TMotor.ShowEndStop;
begin
SendCmdAnsw('ES?');
end;

procedure TMotor.ShowError;
begin
SendCmdAnsw('ERR?');
end;

procedure TMotor.Stop;
begin
SendCmdAnsw('STOP');
end;


{ TSync }

constructor TSync.Create(AOwner: TComponent; LogName, FindName: String);
begin
   inherited Create(AOwner, LogName, FindName);
end;

destructor TSync.Destroy;
begin

  inherited;
end;

{ TPeripherials }

constructor TPeripherials.Create(AOwner: TComponent; LogName, FindName: String);
begin
inherited Create(AOwner, LogName, FindName);

end;

destructor TPeripherials.Destroy;
begin

inherited;
end;

function TPeripherials.GetFlip1: Boolean;
var answ:string;
begin
answ:=SendCmdAnsw('F1?');
if Pos('F1', answ)>0 then
  begin
   if Pos('F1U', answ)>0 then Result:=True
   else if Pos('F1D', answ)>0 then Result:=False;
   fFlip1:=Result;
  end;
end;

function TPeripherials.GetFlip2: Boolean;
var answ:string;
begin
answ:=SendCmdAnsw('F2?');
if Pos('F2', answ)>0 then
  begin
   if Pos('F2U', answ)>0 then Result:=True
   else if Pos('F2D', answ)>0 then Result:=False;
   fFlip1:=Result;
  end;
end;

function TPeripherials.GetLed1: byte;
var answ:string;
begin
answ:=SendCmdAnsw('L1?');
if Pos('L1 ', answ)>0 then
  begin
   Delete(answ, 1,3);
   Result:=StrToIntDef(answ, 0);
   fLed1:=Result;
  end;
end;

function TPeripherials.GetLed2: byte;
var answ:string;
begin
answ:=SendCmdAnsw('L2?');
if Pos('L2 ', answ)>0 then
  begin
   Delete(answ, 1,3);
   Result:=StrToIntDef(answ, 0);
   fLed2:=Result;
  end;
end;

function TPeripherials.LoadSettings: boolean;
 var Ini:TMemIniFile;
  section:string;

  i,j:integer;
begin
result:=False;
Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
try
    section:='Periph';

   if Ini.SectionExists(section) then
       begin
         fFlip1:= Ini.ReadBool(section,'LastFlip1', False );
         fFlip2:= Ini.ReadBool(section,'LastFlip2', False );
       end;

result:=True;
finally
Ini.Free;
end;
end;

function TPeripherials.SaveSettings: boolean;
var Ini:TMemIniFile;
    section:string;
    i,j:Integer;
begin
  result:=False;
  Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
    section:='Periph';

     Ini.WriteBool(section,'LastFlip1', fFlip1 );
     Ini.WriteBool(section,'LastFlip2', fFlip2);

  try
  Ini.UpdateFile;
  result:=True;
  finally
  Ini.Free;
  end;

end;

procedure TPeripherials.SetFlip1(const Value: Boolean);
var answ:string;
begin
if Value then
    answ:=SendCmdAnsw('F1U')
else
    answ:=SendCmdAnsw('F1D');
if Pos('F1', answ)>0 then
  fFlip1:=Value;
end;

procedure TPeripherials.SetFlip2(const Value: Boolean);
var answ:string;
begin
if Value then
    answ:=SendCmdAnsw('F2U')
else
    answ:=SendCmdAnsw('F2D');
if Pos('F2', answ)>0 then
    fFlip2:=Value;
end;

procedure TPeripherials.SetLed1(const Value: byte);
var answ:string;
begin
  answ:= SendCmdAnsw('L1 '+value.ToString);
if Pos('L1', answ)>0 then
    fLed1:=Value;
end;

procedure TPeripherials.SetLed2(const Value: byte);
var answ:string;
begin
  answ:= SendCmdAnsw('L2 '+value.ToString);
if Pos('L2', answ)>0 then
    fLed2:=Value;
end;

{ TFilterWheel }

constructor TFilterWheel.Create(AOwner: TComponent; LogName, FindName: String);
var i:Integer;
begin
inherited Create(AOwner, LogName, FindName);

 for i := 0 to 7 do
 begin
 Filter[i].Name:='Filter #'+intToStr(i+1);
 Filter[i].Position:=0;
 end;

 FLastFilterPosition:=0;
 //LoadSettings;
end;

destructor TFilterWheel.Destroy;
begin
//SaveSettings;
inherited;
end;

function TFilterWheel.DoCalibration: Boolean;
begin
if fComPort.Connected  then
   Cal1;
end;

function TFilterWheel.GotoFilter(idx: integer): Boolean;
begin
 if fComPort.Connected  then
      begin
        MovAbs(Filter[idx].Position);
        FLastFilterPosition:=idx;
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

           FLastFilterPosition :=Ini.ReadInteger(section,'LastFilterPosition',0 );
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

constructor TSlit.Create(AOwner: TComponent; LogName, FindName: String);
begin
inherited Create(AOwner, LogName, FindName);
 FProportion:= 0.425;
 FLastPosition:=0;
 //LoadSettings;
end;

destructor TSlit.Destroy;
begin
//SaveSettings;
inherited;
end;

function TSlit.DoCalibration: Boolean;
begin
if fComPort.Connected then
    CalR1;
end;

function TSlit.GetSlit: integer;
begin
Result:=Round( Position/FProportion );
FSlitMicrons:=Result;
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
         FProportion :=Ini.ReadFloat(section,'Proportion',0.425 );
         FLastPosition :=Ini.ReadInteger(section,'LastPosition',0 );
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
 if fComPort.Connected  then
      begin
        MovAbs(Round(microns*FProportion));
        FSlitMicrons:=microns;
      end;
end;

{ TControllerM }

function TControllerM.CheckControllers: Boolean;
var LogStr:string;
begin
LogStr:=#13#10+'  ||  Devices  ||'+#13#10;
Result:=True;

 if MotX.fComPort.Connected then begin
LogStr:=LogStr+'MotX +'+#13#10;
 end else begin
LogStr:=LogStr+'MotX ---!'+#13#10;
 Result:=False;
 end;

 if MotY.fComPort.Connected then begin
LogStr:=LogStr+'MotY +'+#13#10;
 end else begin
LogStr:=LogStr+'MotY ---!'+#13#10;
 Result:=False;
 end;

 if MotZ.fComPort.Connected then begin
LogStr:=LogStr+'MotZ +'+#13#10;
 end else begin
LogStr:=LogStr+'MotZ ---!'+#13#10;
 Result:=False;
 end;

 if MotColim.fComPort.Connected then begin
LogStr:=LogStr+'MotC +'+#13#10;
 end else begin
LogStr:=LogStr+'MotC ---!'+#13#10;
 Result:=False;
 end;

 if BF.fComPort.Connected then begin
LogStr:=LogStr+'BF +'+#13#10;
 end else begin
LogStr:=LogStr+'BF ---!'+#13#10;
 Result:=False;
 end;
 if FilterWheel.fComPort.Connected then begin
LogStr:=LogStr+'FW +'+#13#10;
 end else begin
LogStr:=LogStr+'FW ---!'+#13#10;
 Result:=False;
 end;
 if Slit.fComPort.Connected then begin
LogStr:=LogStr+'Slit +'+#13#10;
 end else begin
LogStr:=LogStr+'Slit ---!'+#13#10;
 Result:=False;
 end;
 if Periph.fComPort.Connected then begin
LogStr:=LogStr+'PE +'+#13#10;
 end else begin
LogStr:=LogStr+'PE ---!'+#13#10;
 Result:=False;
 end;
// if Sync.fComPort.Connected then begin
// LogStr:=LogStr+'SY +'+#13#10;
// end else begin
// LogStr:=LogStr+'SY ---!'+#13#10;
// Result:=False;
// end;
Log(LogStr);
end;

constructor TControllerM.Create(AOwner: TComponent; LogName, FindName: String);
begin
inherited Create(AOwner);
MotX:=TMotor.Create(Self, 'MotX', IDMotX);
MotY:=TMotor.Create(Self, 'MotY', IDMotY);
MotZ:=TMotor.Create(Self, 'MotZ', IDMotZ);

BF:=TMotor.Create(Self, 'BF', IDMotBF);
FilterWheel:=TFilterWheel.Create(Self, 'FW', IDMotFW);
Slit:=TSlit.Create(Self, 'SLIT',  IDMotSlit);

MotColim:=TMotor.Create(Self, 'MotC', IDMotColim);


Sync:=TSync.Create(Self, 'SY', 'SY');
Periph:=TPeripherials.Create(Self, 'PE', 'PE');
fComPort.OnRxChar:=nil;

end;

destructor TControllerM.Destroy;
begin
DisconnectControllers;

MotX.Free;
MotY.Free;
MotZ.Free;

BF.Free;
FilterWheel.Free;
Slit.Free;

MotColim.Free;

Sync.Free;
Periph.Free;

inherited;
end;

procedure TControllerM.DisconnectControllers;
begin
MotX.Disconnect;
MotY.Disconnect;
MotZ.Disconnect;
BF.Disconnect;
FilterWheel.Disconnect;
Slit.Disconnect;
MotColim.Disconnect;
Sync.Disconnect;
Periph.Disconnect;
end;

function TControllerM.FindControllers: Boolean;
var i,j:integer;
    sl:TStringList;
    answ:String;
begin

  sl:=TStringList.Create;
  EnumComPorts(sl);
  for i := 0 to sl.Count-1 do
    begin
    fComPort.Port:=sl[i];
//    Form1.Memo1.Lines.Add(sl[i]);

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

//    Log('try to "ID?"#13#10');

//     for j := 0 to 1 do
    answ:=SendCmdAnsw('ID?', false);
//    answ:=SendCmdAnsw('ID?');

    Log(Trim(sl[i])+' ID? - '+ answ );

    if PosEx('WRONG CMD', answ, 1)>0  then
    answ:=SendCmdAnsw('ID?', false);


      if PosEx('RB '+IDMotX, answ,1)>0  then
         begin
         MotX.fComPort.Port:=sl[i];
         fComPort.Close;
         MotX.Connect;
         end
      else
      if PosEx('RB '+IDMotY, answ,1)>0  then
         begin
         MotY.fComPort.Port:=sl[i];
         fComPort.Close;
         MotY.Connect;
         end
      else
      if PosEx('RB '+IDMotZ, answ,1)>0  then
         begin
         MotZ.fComPort.Port:=sl[i];
         fComPort.Close;
         MotZ.Connect;
         end
      else
      if PosEx('RB '+IDMotBF, answ,1)>0  then
         begin
         BF.fComPort.Port:=sl[i];
         fComPort.Close;
         BF.Connect;
         end
      else
      if PosEx('RB '+IDMotFW, answ,1)>0  then
         begin
         FilterWheel.fComPort.Port:=sl[i];
         fComPort.Close;
         FilterWheel.Connect;
         end
      else
      if PosEx('RB '+IDMotSlit, answ,1)>0  then
         begin
         Slit.fComPort.Port:=sl[i];
         fComPort.Close;
         Slit.Connect;
         end
      else
      if PosEx('RB '+IDMotColim, answ,1)>0  then
         begin
         MotColim.fComPort.Port:=sl[i];
         fComPort.Close;
         MotColim.Connect;
         end
      else
      if PosEx('RB SY', answ,1)>0  then
         begin
         Sync.fComPort.Port:=sl[i];
         fComPort.Close;
         Sync.Connect;
         end
      else
      if PosEx('RB PE', answ,1)>0  then
         begin
         Periph.fComPort.Port:=sl[i];
         fComPort.Close;
         Periph.Connect;
         end
      else
         begin
         fComPort.Close;
         end;

    end;

  sl.Free;


end;

procedure TControllerM.SaveXYZpos;
begin

     MotX.SaveLastPosition;
     MotY.SaveLastPosition;
     MotZ.SaveLastPosition;

end;

procedure TControllerM.SendCmdToConsole(cmd: string);
begin
if Pos('MX', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   MotX.SendCmdAsync(cmd);
   end
else
if Pos('MY', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   MotY.SendCmdAsync(cmd);
   end
else
if Pos('MZ', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   MotZ.SendCmdAsync(cmd);
   end
else
if Pos('MC', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   MotColim.SendCmdAsync(cmd);
   end
else
if Pos('BF', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   BF.SendCmdAsync(cmd);
   end
else
if Pos('FW', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   FilterWheel.SendCmdAsync(cmd);
   end
else
if Pos('SL', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   Slit.SendCmdAsync(cmd);
   end
else
if Pos('SY', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   Sync.SendCmdAsync(cmd);
   end
else
if Pos('PE', cmd)>0 then
   begin
   Delete(cmd, 1, 3);
   Periph.SendCmdAsync(cmd);
   end
else
   Log('Incorrect dev');

end;

{ TCommEventThread }

constructor TCommEventThread.Create(AOwner: TCustomComUnit);
begin
  FOwner := AOwner;
  FEvent := TEvent.Create;
  FreeOnTerminate := False;
  fMonitoringBuffer:='';
  inherited Create(True); //create suspended
end;

destructor TCommEventThread.Destroy;
begin
  FEvent.Free;
  inherited Destroy;
end;

procedure TCommEventThread.DoEvent;
var cnt:Integer;
    tmp:string;
    bFlag:Boolean;
begin

 cnt:=fOwner.fComPort.InputCount;
   if cnt>0 then
     try
       repeat
       fOwner.fComPort.ReadStr(tmp,1);
       if tmp[1]=#13 then
       else
       if tmp[1]=#10 then
          bFlag:=True
       else
       fMonitoringBuffer:=fMonitoringBuffer+tmp[1];

       until (fOwner.fComPort.InputCount=0) or (bFlag);
     except
     end;

     if bFlag then
       begin
       fOwner.AnalyseStr(fMonitoringBuffer);
       fMonitoringBuffer:='';
       end;

end;

procedure TCommEventThread.Execute;
begin
  while not Terminated do
    begin
      if not FOwner.fWA then
        begin
//        FOwner.FCritSection.Acquire;
        DoEvent;
//        FOwner.FCritSection.Release;
        end;
      Sleep(10);
    end;

end;

procedure TCommEventThread.StopThread;
begin
 Terminate;
 FEvent.SetEvent;
end;

end.
