// Intel IPP 8.2 Update 3

{$IFDEF INTELCUSTOM}
const
  ippcoredll = 'intelipp.dll';
  ippsdll = ippcoredll;
  ippidll = ippcoredll;
  ippcvdll = ippcoredll;
  ipprdll = ippcoredll;
  ippdidll = ippcoredll;
  ippdcdll = ippcoredll;
  ippvmdll = ippcoredll;
{$ELSE}
{$DEFINE IPPDELAYED}
const
  ippcoredll = 'ippcore-8.2.dll';
  ippsdll = 'ipps-8.2.dll';
  ippidll = 'ippi-8.2.dll';
  ippcvdll = 'ippcv-8.2.dll';
  ipprdll = 'ippr-8.2.dll';
  ippdidll = 'ippdi-8.2.dll';
  ippdcdll = 'ippdc-8.2.dll';
  ippvmdll = 'ippvm-8.2.dll';
{$ENDIF}
