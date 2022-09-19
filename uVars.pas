unit uVars;

interface

uses
  Db, Excel97, Controls;

type
  TWhatDo = (wdEdit, wdInsert);

function FieldToVariant(Field : TField) : OLEVariant;
procedure DrawBorders(BeginRange, EndRange : String; Excel : ExcelWorkSheet);
function GetAlpha(const Value : Integer) : String;
function GetWorkName : String;
procedure SetWorkName(const Value : String);
function GetCurrentYear : Integer;
procedure SetCurrentYear(const Value : Integer);
procedure CopyDirectory(const Src, Dst : String);
procedure DeleteFiles(const Where : String);
function GetTextLetter1 : String;
procedure SetTextLetter1(const Value : String);
function GetBossLetter : String;
procedure SetBossLetter(const Value : String);
function GetDolgnostLetter : String;
procedure SetDolgnostLetter(const Value : String);
function GetPhoneLetter : String;
procedure SetPhoneLetter(const Value : String);
function GetAddressLetter : String;
procedure SetAddressLetter(const Value : String);
function GetNumberLetter : Integer;
procedure SetNumberLetter(const Value : Integer);

function GetDateLetter : TDate;
procedure SetDateLetter(const Value : TDate);

function GetWidthMainWindow : Integer;
function GetHeightMainWindow : Integer;

function GetTextLetter2_1 : String;
procedure SetTextLetter2_1(const Value : String);
function GetTextLetter2_2 : String;
procedure SetTextLetter2_2(const Value : String);
function GetPost : String;
procedure SetPost(const Value : String);

implementation

uses
  IniFiles, SysUtils, Forms, Windows;

procedure DrawBorders(BeginRange, EndRange : String; Excel : ExcelWorkSheet);
begin
  with Excel.Range[BeginRange,EndRange] do
    begin
      Borders[xlEdgeLeft].LineStyle         := xlContinuous;
      Borders[xlEdgeTop].LineStyle          := xlContinuous;
      Borders[xlEdgeBottom].LineStyle       := xlContinuous;
      Borders[xlEdgeRight].LineStyle        := xlContinuous;
      Borders[xlInsideHorizontal].LineStyle := xlContinuous;
      Borders[xlInsideVertical].LineStyle   := xlContinuous;

      Borders[xlEdgeLeft].Weight         := xlThin;
      Borders[xlEdgeTop].Weight          := xlThin;
      Borders[xlEdgeBottom].Weight       := xlThin;
      Borders[xlEdgeRight].Weight        := xlThin;
      Borders[xlInsideHorizontal].Weight := xlThin;
      Borders[xlInsideVertical].Weight   := xlThin;
    end;
end;

function FieldToVariant(Field : TField) : OLEVariant;
begin
  Result := '';
  case Field.DataType of
    ftString, ftFixedChar, ftWideString, ftMemo, ftFmtMemo : Result := ''''+Field.AsString;
    ftSmallInt, ftInteger, ftWord, ftLargeInt, ftAutoInc : Result := Field.AsInteger;
    ftFloat, ftCurrency, ftBCD : Result := Field.AsFloat;
    ftBoolean : Result := Field.AsBoolean;
    ftDate, ftTime, ftDateTime : Result := Field.AsDateTime;
  end;
end;

function GetAlpha(const Value : Integer) : String;
begin
  if Value > 26 then Result := 'A'+Char(Ord('A')+(Value - 26)-1)
  else               Result :=     Char(Ord('A')+Value-1);
end;

function GetWorkName : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Params', 'WorkName', 'Канал');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetWorkName(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Params', 'WorkName', Value);
  finally
    MyIni.Free;
  end;
end;

function GetCurrentYear : Integer;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadInteger('Params', 'CurrentYear', 1);
    finally
      MyIni.Free;
    end;
  except
    Result := 0;
  end;
end;

procedure SetCurrentYear(const Value : Integer);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteInteger('Params', 'CurrentYear', Value);
  finally
    MyIni.Free;
  end;
end;

{procedure CopyDirectory(Src, Dst : String);
var
  FileStruct : TSHFileOpStruct;
begin
  with FileStruct do
  begin
    Wnd := 0;
    wFunc := FO_COPY;
    pFrom := PChar(Src);
    pTo := PChar(Dst);
    fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION or FOF_FILESONLY;
    fAnyOperationsAborted := False;
    hNameMappings := nil;
    lpszProgressTitle := nil;
  end;
  ShFileOperation(FileStruct); // Копируем
end;
}

function GetTextLetter1 : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Letter1', 'Text', 'Здесь должен быть текст');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetTextLetter1(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'Text', Value);
  finally
    MyIni.Free;
  end;
end;

function GetBossLetter : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Letter1', 'Boss', 'Имя начальника');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetBossLetter(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'Boss', Value);
  finally
    MyIni.Free;
  end;
end;

function GetDolgnostLetter : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Letter1', 'Dolgnost', 'Название должности');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetDolgnostLetter(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'Dolgnost', Value);
  finally
    MyIni.Free;
  end;
end;

function GetPhoneLetter : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Letter1', 'Phone', 'Тел. 11-11-11');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetPhoneLetter(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'Phone', Value);
  finally
    MyIni.Free;
  end;
end;

function GetAddressLetter : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Letter1', 'Address', 'Адрес');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetAddressLetter(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'Address', Value);
  finally
    MyIni.Free;
  end;
end;

function GetNumberLetter : Integer;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadInteger('Letter1', 'LetterNumber', 1);
    finally
      MyIni.Free;
    end;
  except
    Result := 1;
  end;
end;

procedure SetNumberLetter(const Value : Integer);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteInteger('Letter1', 'LetterNumber', Value);
  finally
    MyIni.Free;
  end;
end;

function GetDateLetter : TDate;
var
  MyIni : TIniFile;
  S : String;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      S := MyIni.ReadString('Letter1', 'LetterDate', '01.01.2005');
      Result := StrToDate(S);
    finally
      MyIni.Free;
    end;
  except
    Result := StrToDate('01.01.2005');
  end;
end;

procedure SetDateLetter(const Value : TDate);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'LetterDate', DateToStr(Value));
  finally
    MyIni.Free;
  end;
end;

function GetWidthMainWindow : Integer;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadInteger('Params', 'MainWindowWidth', 723);
    finally
      MyIni.Free;
    end;
  except
    Result := 1;
  end;
end;

function GetHeightMainWindow : Integer;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadInteger('Params', 'MainWindowHeight', 90);
    finally
      MyIni.Free;
    end;
  except
    Result := 1;
  end;
end;

procedure CopyDirectory(const Src, Dst : String);
var
  SearchRec : TSearchRec;
begin
// Ищем каталоги
  if FindFirst(Src+'\*.*', 0, SearchRec) = 0 then
    repeat
      CopyFile(PAnsiChar(Src+'\'+SearchRec.Name), PAnsiChar(Dst+SearchRec.Name), False);
    until(FindNext(SearchRec) <> 0);
  SysUtils.FindClose(SearchRec);
end;

procedure DeleteFiles(const Where : String);
var
  SearchRec : TSearchRec;
begin
// Ищем каталоги
  if FindFirst(Where+'\*.*', 0, SearchRec) = 0 then
    repeat
      DeleteFile(PAnsiChar(Where+'\'+SearchRec.Name));
    until(FindNext(SearchRec) <> 0);
  SysUtils.FindClose(SearchRec);
end;

function GetTextLetter2_1 : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Letter1', 'TextLetter2Part1', '');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetTextLetter2_1(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'TextLetter2Part1', '"'+Value+'"');
  finally
    MyIni.Free;
  end;
end;

function GetTextLetter2_2 : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Letter1', 'TextLetter2Part2', '');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetTextLetter2_2(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'TextLetter2Part2', '"'+Value+'"');
  finally
    MyIni.Free;
  end;
end;

function GetPost : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    try
      Result := MyIni.ReadString('Letter1', 'Postanovlenie', '');
    finally
      MyIni.Free;
    end;
  except
    Result := '';
  end;
end;

procedure SetPost(const Value : String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Laboratory.ini');
  try
    MyIni.WriteString('Letter1', 'Postanovlenie', Value);
  finally
    MyIni.Free;
  end;
end;

end.
