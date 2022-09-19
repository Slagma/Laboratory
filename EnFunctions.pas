unit enFunctions;

interface

uses Windows;

//===================================================================
// ������������� ���� ������ �� ��� ������
  function RecodeString(Input, FromStr, ToStr : String) : String;
//===================================================================
// ������� ������������� Win --> Koi
  function RecodeWinToKoi(Input : String) : String;
//===================================================================
// ������� ������������� Koi --> Win
  function RecodeKoiToWin(Input : String) : String;
//===================================================================
// ������� ������������� WIN --> DOS
  function RecodeWinToDos(Input : String) : String;
//===================================================================
// ������� ������������� DOS --> WIN
  function RecodeDosToWin(Input : String) : String;
//===================================================================
// ���������� True, ���� Ch �������� �������� �����
  function IsNumber(const Ch: Char): Boolean;
//===================================================================
// ���������� True, ���� S �������� ������ ����� �� 0 �� 9
  function StringIsNumber(const S : String) : Boolean;
//===================================================================
// ���������� ���������� ��������� ��� � 32-���������� �����
//===================================================================
function GetBits(const Val : DWORD) : Integer;
//===================================================================
// ������� ��������� ������ ������������������ ����� (��������, '9', 'E' � �.�.,
// � ���������� �������������� ��� �������� ��������, �.�. ��������, �� �����
// ���� 'E', �� ������ ����� �����, ������ 14
//===================================================================
function HexTrans(const Value : Char) : Byte;
//===================================================================
// "��������" ���� Value
function Reverse7Bit(const Value : Byte) : Byte;
//===================================================================
// ���������� ��� ����������
function EnGetComputerName : String;
//===================================================================
// ���������� ��� ������������ ����������
function EnGetUserName : String;
//===================================================================
// ���������� ���� � ���������� �������� Windows
function EnGetSystemDirectory : String;
//===================================================================
// ���������� ���� � �������� Windows
function EnGetWindowsDirectory : String;
//===================================================================
// ���������� ������ ������������ �������
function EnGetVersionInfo : String;
//===================================================================

implementation

uses SysUtils;

//===================================================================
// ������� ������������� ���� ������ �� ��� ������
//===================================================================
function RecodeString(Input, FromStr, ToStr : String) : String;
var
  i, p, Lngth : Integer;
begin
  Result := '';
  Lngth := Length(Input);
  for i := 1 to Lngth do
  begin
    p := Pos(Input[i], FromStr);
    if p > 0 then Result := Result+ToStr[p]
    else          Result := Result+Input[i];
  end;
end;

//===================================================================
// ������� ������������� ������ �� Win � Koi
//===================================================================
function RecodeWinToKoi(Input : String) : String;
var
  Win, Koi : String;
begin
  Win := '����������������������������������������������������������������';
  Koi := '����������������������������������������������������������������';
  Result := RecodeString(Input, Win, Koi);
end;

//===================================================================
// ������� ������������� ������ �� Koi � Win
//===================================================================
function RecodeKoiToWin(Input : String) : String;
var
  Win, Koi : String;
begin
  Win := '����������������������������������������������������������������';
  Koi := '����������������������������������������������������������������';
  Result := RecodeString(Input, Koi, Win);
end;

//===================================================================
// ������� ������������� WIN --> DOS
//===================================================================
function RecodeWinToDos(Input : String) : String;
var
  Win, Dos : String;
begin
  Win := '����������������������������������������������������������������'#171#187;
  Dos := #128#129#130#131#132#133#134#135#136#137#138#139#140#141#142#143#144#145#146#147#148#149#150#151#152#153#154#155#156#157#158#159#160#161#162#163#164#165#166#167#168#169#170#171#172#173#174#175#224#225#226#227#228#229#230#231#232#233#234#235#236#237#238#239#34#34;
  Result := RecodeString(Input, Win, Dos);
end;

//===================================================================
// ������� ������������� DOS --> WIN
//===================================================================
function RecodeDosToWin(Input : String) : String;
var
  Win, Dos : String;
begin
  Win := '����������������������������������������������������������������';
  Dos := #128#129#130#131#132#133#134#135#136#137#138#139#140#141#142#143#144#145#146#147#148#149#150#151#152#153#154#155#156#157#158#159#160#161#162#163#164#165#166#167#168#169#170#171#172#173#174#175#224#225#226#227#228#229#230#231#232#233#234#235#236#237#238#239;
  Result := RecodeString(Input, Dos, Win);
end;

//===================================================================
// ���������� True, ���� ������ Ch �������� ������
//===================================================================
function IsNumber(const Ch: Char): Boolean;
begin
  IsNumber := ((Ch >= '0') and (Ch <= '9'));
end;

//===================================================================
// ���������� True, ���� S �������� ������ ����� �� 0 �� 9
//===================================================================
function StringIsNumber(const S: String): Boolean;
var
  I, Ln : Integer;
begin
  Result := True;
  Ln := Length(S);
  for I := 1 to Ln do
  begin
    Result := (S[I] >= '0') and (S[I] <= '9');
    if not Result then break;
  end;
end;

//===================================================================
// ���������� ���������� ��������� ��� � 32-���������� �����
//===================================================================
function GetBits(const Val : DWORD) : Integer;
var
  I : Integer;
begin
  Result := 0;
  for I := 1 to 32 do
    if (($80000000 shr (I-1)) and Val)  > 0 then
      Inc(Result);
end;

//===================================================================
// ������� ��������� ������ ������������������ ����� (��������, '9', 'E' � �.�.,
// � ���������� �������������� ��� �������� ��������, �.�. ��������, �� �����
// ���� 'E', �� ������ ����� �����, ������ 14
//===================================================================
function HexTrans(const Value : Char) : Byte;
begin
  if Value > #64 then Result := Ord(Value) - 55
  else                Result := Ord(Value) - 48
end;

//===================================================================
// "��������" ���� Value
//===================================================================
function Reverse7Bit(const Value : Byte) : Byte;
var
  I : Integer;
begin
  Result := 0;
  for I  := 0 to 6 do
    Result := Result or (((Value and (1 shl I)) shr I) shl (6 - I));
end;
//===================================================================
// ���������� ��� ����������
//===================================================================
function EnGetComputerName : String;
var
  MaxLength : DWORD;
  ComputerName : array[0..MAX_COMPUTERNAME_LENGTH+1] of AnsiChar;
begin
  MaxLength := MAX_COMPUTERNAME_LENGTH+1;
  if GetComputerName(@ComputerName[0], MaxLength) then
    Result := ComputerName
  else
    Result := 'GetComputerName : #ERROR#';
end;

//===================================================================
// ���������� ��� ������������ ����������
//===================================================================
function EnGetUserName : String;
const
  MAX_USERNAME_LENGTH = 50;
var
  MaxLength : DWORD;
  UserName : array[0..MAX_USERNAME_LENGTH] of AnsiChar;
begin
  MaxLength := MAX_USERNAME_LENGTH;
  if GetUserName(@UserName[0], MaxLength) then
    Result := UserName
  else
    Result := 'GetUserName : #ERROR#';
end;

//===================================================================
// ���������� ���� � ���������� �������� Windows
//===================================================================
function EnGetSystemDirectory : String;
var
  MaxLength : DWORD;
  SystemDirectory : array[0..MAX_PATH+1] of AnsiChar;
begin
  MaxLength := MAX_PATH;
  if GetSystemDirectory(@SystemDirectory[0], MaxLength) > 0 then
    Result := SystemDirectory
  else
    Result := 'GetSystemDirectory : #ERROR#';
end;

//===================================================================
// ���������� ���� � ���������� �������� Windows
//===================================================================
function EnGetWindowsDirectory : String;
var
  MaxLength : DWORD;
  WindowsDirectory : array[0..MAX_PATH+1] of AnsiChar;
begin
  MaxLength := MAX_PATH;
  if GetWindowsDirectory(@WindowsDirectory[0], MaxLength) > 0 then
    Result := WindowsDirectory
  else
    Result := 'GetWindowsDirectory : #ERROR#';
end;
//===================================================================
// ���������� ������ ������������ �������
//===================================================================
function EnGetVersionInfo : String;
var
  VersionInfo : TOSVersionInfo;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  if GetVersionEx(VersionInfo) then
    with VersionInfo do
    begin
      case dwPlatformId of
        VER_PLATFORM_WIN32s        : Result := 'Windows 3.1 ';
        VER_PLATFORM_WIN32_WINDOWS : Result := 'Windows 95 ';
        VER_PLATFORM_WIN32_NT      : Result := 'Windows NT ';
      end;
      Result := Result + IntToStr(dwMajorVersion)+'.'+
                IntToStr(dwMinorVersion) + '.' +
                IntToStr(Lo(dwBuildNumber)+(Hi(dwBuildNumber) shl 8)) +
                szCSDVersion;
    end
  else
    Result := 'GetVersionInfo : #ERROR#';
end;

end.
