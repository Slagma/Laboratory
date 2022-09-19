unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Menus, DB, DBTables, IniFiles;

type
  TfMain = class(TForm)
    ToolBar: TToolBar;
    btnClose: TToolButton;
    ToolButton1: TToolButton;
    btnWorks: TToolButton;
    btnActs: TToolButton;
    btnValues: TToolButton;
    ToolButton2: TToolButton;
    btnMiscs: TToolButton;
    btnSave: TToolButton;
    btnRestore: TToolButton;
    ToolButton6: TToolButton;
    btnInfo: TToolButton;
    MiscsMenu: TPopupMenu;
    iNorms: TMenuItem;
    iAreas: TMenuItem;
    iIngreds: TMenuItem;
    iMagazins: TMenuItem;
    N5: TMenuItem;
    iNextYear: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    iCurrentYear: TMenuItem;
    iReturnWork: TMenuItem;
    tNorms: TTable;
    tNormsN_Date: TDateField;
    N3: TMenuItem;
    iRemont: TMenuItem;
    Table: TTable;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure btnWorksClick(Sender: TObject);
    procedure btnActsClick(Sender: TObject);
    procedure btnValuesClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnMiscsClick(Sender: TObject);
    procedure iNormsClick(Sender: TObject);
    procedure iAreasClick(Sender: TObject);
    procedure iIngredsClick(Sender: TObject);
    procedure iMagazinsClick(Sender: TObject);
    procedure iNextYearClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure iCurrentYearClick(Sender: TObject);
    procedure iReturnWorkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure iRemontClick(Sender: TObject);
  private
    { Private declarations }
    FixIni : TIniFile;
    function GetAlias : String;
    procedure DeleteIndexes;
    procedure CreateIndexes;
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses uStrings, uDm, uAbout, uAreas, uIngreds, uMagazins, uWorks, uActs,
  uNorms, uKns, uValuesMags, uSave, uRestore, uGoNextYear, uFormats,
  uCurrentYear, DateUtils, uVars, uSootnoshenie;

{$R *.DFM}

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (Application.MessageBox(sAppClose, sAppCloseH, MB_YESNO+MB_ICONQUESTION) = ID_YES);
end;

procedure TfMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close; end;
      VK_F2,
      VK_RETURN : begin Key := 0; btnWorksClick(nil);   end;
      VK_F3     : begin Key := 0; btnActsClick(nil);    end;
      VK_F4     : begin Key := 0; btnValuesClick(nil);  end;
      VK_F5     : begin Key := 0; btnMiscsClick(nil);   end;
      VK_F6     : begin Key := 0; btnSaveClick(nil);    end;
      VK_F7     : begin Key := 0; btnRestoreClick(nil); end;
      VK_F12    : begin Key := 0; btnInfoClick(nil);    end;
    end;
end;

procedure TfMain.btnCloseClick(Sender: TObject);
var
  Soot : TfSootnoshenie;
begin
    Soot := TfSootnoshenie.Create(nil);
  try
    Soot.DoWork;
  finally
    Soot.Free;
  end;
  Close
end;

procedure TfMain.btnWorksClick(Sender: TObject);
var
  Works : TfWorks;
begin
  try
    fMain.Hide;
    Works := TfWorks.Create(nil);
    try
      Works.ShowModal;
    finally
      Works.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.btnActsClick(Sender: TObject);
var
  Acts : TfActs;
begin
  try
    fMain.Hide;
    Acts := TfActs.Create(nil);
    try
      Acts.ShowModal;
    finally
      Acts.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.btnValuesClick(Sender: TObject);
var
  Values : TfValuesMags;
begin
  try
    fMain.Hide;
    Values := TfValuesMags.Create(nil);
    try
      Values.ShowModal;
    finally
      Values.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.btnSaveClick(Sender: TObject);
var
  Save : TfSave;
begin
  fMain.Hide;
  try
    Save := TfSave.Create(nil);
    try
      Save.ShowModal;
    finally
      Save.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.btnRestoreClick(Sender: TObject);
var
  Restore : TfRestore;
begin
  fMain.Hide;
  try
    Restore := TfRestore.Create(nil);
    try
      Restore.ShowModal;
    finally
      Restore.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.btnInfoClick(Sender: TObject);
var
  About : TfAbout;
begin
  try
    fMain.Hide;
    About := TfAbout.Create(nil);
    try
      About.ShowModal;
    finally
      About.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.btnMiscsClick(Sender: TObject);
begin
  btnMiscs.CheckMenuDropdown;
end;

procedure TfMain.iNormsClick(Sender: TObject);
var
  Norms : TfNorms;
begin
  try
    fMain.Hide;
    Norms := TfNorms.Create(nil);
    try
      Norms.ShowModal;
    finally
      Norms.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.iAreasClick(Sender: TObject);
var
  Areas : TfAreas;
begin
  try
    fMain.Hide;
    Areas := TfAreas.Create(nil);
    try
      Areas.ShowModal;
    finally
      Areas.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.iIngredsClick(Sender: TObject);
var
  Ingreds : TfIngreds;
begin
  try
    fMain.Hide;
    Ingreds := TfIngreds.Create(nil);
    try
      Ingreds.ShowModal;
    finally
      Ingreds.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.iMagazinsClick(Sender: TObject);
var
  Mags : TfMagazins;
begin
  try
    fMain.Hide;
    Mags := TfMagazins.Create(nil);
    try
      Mags.ShowModal;
    finally
      Mags.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.iNextYearClick(Sender: TObject);
var
  Next : TfGoNextYear;
begin
  if DirectoryExists(ExtractFilePath(Application.ExeName)+'CURRENT') then
  begin
    ShowMessage('������� ��������� � �������� ����.');
    Exit;
  end;
  try
    fMain.Hide;
    Next := TfGoNextYear.Create(nil);
    try
      Next.DoWork;
    finally
      Next.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.N1Click(Sender: TObject);
var
  KNS : TfKNS;
begin
  try
    fMain.Hide;
    KNS := TfKNS.Create(nil);
    try
      KNS.ShowModal;
    finally
      KNS.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.N2Click(Sender: TObject);
var
  Formats : TfFormats;
begin
  try
    fMain.Hide;
    Formats := TfFormats.Create(nil);
    try
      Formats.ShowModal;
    finally
      Formats.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.iCurrentYearClick(Sender: TObject);
var
  Current : TfCurrentYear;
begin
  try
    fMain.Hide;
    Current := TfCurrentYear.Create(nil);
    try
      Current.ShowModal;
    finally
      Current.Free;
    end;
  finally
    fMain.Show;
  end;
end;

procedure TfMain.iReturnWorkClick(Sender: TObject);
var
  Year : String;
  Alias : String;
  CurrentPath : String;
begin
  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'CURRENT') then
  begin
    ShowMessage('�� ��� ��������� � ������� �����.');
    Exit;
  end;
// 1. ����������, ���� �� ��������� ������� ��, �, ���� ���� - ���������
  if Application.MessageBox('��������� ��?', '���������� ��', MB_YESNO+MB_ICONQUESTION) = ID_YES then
  begin
    Alias := GetAlias;
    tNorms.Open;
    Year := IntToStr(YearOf(tNormsN_Date.Value));
    tNorms.Close;
    DeleteFiles(ExtractFilePath(Application.ExeName)+Year);
    CopyDirectory(Alias, ExtractFilePath(Application.ExeName)+Year+'\');
  end;
// 2. ������� ������� �������
  DeleteFiles(Alias);
// 3. �������� ������ �� CURRENT � ������� �������
  CurrentPath := ExtractFilePath(Application.ExeName)+'CURRENT';
  CopyDirectory(CurrentPath, Alias+'\');
// 4. ������� ����� �� �������� CURRENT � ��� ������� CURRENT
  DeleteFiles(ExtractFilePath(Application.ExeName)+'CURRENT');
  RemoveDir(CurrentPath);
  ShowMessage('���������� ������� ���');
end;

function TfMain.GetAlias : String;
var
  MyList : TStringList;
  I, J   : Integer;
  MyTemp : String;
begin
  Result := '';
  MyList := TStringList.Create;
  try
    Session.GetAliasParams('Labor_WIN32', MyList);
    for I := 0 to MyList.Count-1 do
    begin
      MyTemp := MyList[I];
      if (MyTemp[1] = 'P') and (MyTemp[2] = 'A') and
         (MyTemp[3] = 'T') and (MyTemp[4] = 'H') then
      begin
        for J := 6 to Length(MyTemp) do
          Result := Result + MyTemp[J];
        break;
      end;
    end;
  finally
    MyList.Free;
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  Width := GetWidthMainWindow;
  ClientHeight := Toolbar.Height;
end;

procedure TfMain.iRemontClick(Sender: TObject);
var
  MyCursor : TCursor;
begin
  if Application.MessageBox('������ ����. ����� �������� ���������� ������� ����� ��. ����������?', '������ ��', MB_YESNO+MB_ICONQUESTION) <> ID_YES then
    Exit;
  MyCursor := Screen.Cursor;
  FixIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Fixing.ini');
  try
    Screen.Cursor := crSQLWait;
    DeleteIndexes;
    CreateIndexes;
    ShowMessage('������ ��������...');
  finally
    FixIni.Free;
    Screen.Cursor := MyCursor;
  end;
end;

procedure TfMain.CreateIndexes;
var
  Sections, Section, Values : TStringList;
  Value, NameIndex, Index : String;
  I, J, K : Integer;
begin
  Sections := TStringList.Create;
  Section := TStringList.Create;
  Values := TStringList.Create;
  try
    FixIni.ReadSections(Sections);
    for I := 0 to Sections.Count-1 do
    begin
      Values.Clear;
      FixIni.ReadSection(Sections[I], Section);
      for J := 0 to Section.Count-1 do
      begin
        Value := FixIni.ReadString(Sections[I], Section[J], '');
        Table.TableName := Sections[I];
        Table.Open;
        if Section[J] = 'Primary' then
          Table.AddIndex('', Value, [ixPrimary])
        else
        begin
          K := LastDelimiter(' ', Value);
          NameIndex := Copy(Value, 1, K-1);
          Index := Copy(Value , K+1, Length(Value)-K);
          Table.AddIndex(NameIndex, Index, [ixCaseInsensitive]);
        end;
        Table.Close;
      end;
    end;
  finally
    Values.Free;
    Section.Free;
    Sections.Free;
  end;
end;

procedure TfMain.DeleteIndexes;
var
  MyList    : TStringList;
  Alias     : String;
  SearchRec : TSearchRec;
  I         : Integer;
begin
  MyList := TStringList.Create;
  try
    Alias := GetAlias;
    if FileExists(Alias+'\paradox.lck')  then DeleteFile(Alias+'\paradox.lck');
    if FileExists(Alias+'\pdoxusrs.lck') then DeleteFile(Alias+'\pdoxusrs.lck');

    if FindFirst(Alias+'\*.*', 0, SearchRec) = 0 then
      repeat
        MyList.Add(SearchRec.Name);
      until (FindNext(SearchRec) <> 0);
    FindClose(SearchRec);
    for I := 0 to MyList.Count - 1 do
    begin
      if not AnsiSameText(ExtractFileExt(MyList.Strings[I]), '.db') then
        DeleteFile(Alias+'\'+MyList.Strings[I]);
    end;
  finally
    MyList.Free;
  end;
end;

end.
