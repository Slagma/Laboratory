unit uCurrentYear;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, StdCtrls, Buttons;

type
  TfCurrentYear = class(TForm)
    Panel: TPanel;
    lbYears: TListBox;
    Panel1: TPanel;
    btnOk: TBitBtn;
    tNorms: TTable;
    tNormsN_Date: TDateField;
    btnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    CurYear : Integer;
    function GetAlias : String;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  DateUtils, uVars;

procedure TfCurrentYear.FormCreate(Sender: TObject);
var
  SearchRec : TSearchRec;
begin
  tNorms.Open;
  Panel.Caption := '������� ��� - ' + IntToStr(YearOf(tNormsN_Date.Value));
  CurYear := YearOf(tNormsN_Date.Value);
  tNorms.Close;
// ���� ��������
  if FindFirst(ExtractFilePath(Application.ExeName)+'\2???', faDirectory, SearchRec) = 0 then
    repeat
      lbYears.Items.Add(SearchRec.Name);
    until(FindNext(SearchRec) <> 0);
  FindClose(SearchRec);
  if lbYears.Count > 0 then lbYears.ItemIndex := lbYears.Count - 1;
end;

procedure TfCurrentYear.btnOkClick(Sender: TObject);
var
  CurrentDir : String;
  Alias : String;
  Year : String;
begin
  if (lbYears.Items.Count = 0) or (lbYears.ItemIndex < 0) then Exit;
  if CurYear = StrToInt(lbYears.Items[lbYears.ItemIndex]) then
  begin
    ShowMessage('��� '+IntToStr(CurYear)+' ��� �������� �������');
    Exit;
  end;
  if Application.MessageBox(PAnsiChar('������� ������� '+lbYears.Items[lbYears.ItemIndex]+' ���?'), '������� ���', MB_YESNO+MB_ICONQUESTION) <> ID_YES then
    Exit;
  CurrentDir := ExtractFilePath(Application.ExeName)+'CURRENT';
  Alias := GetAlias;
  if FileExists(Alias+'\paradox.lck')  then DeleteFile(Alias+'\paradox.lck');
  if FileExists(Alias+'\pdoxusrs.lck') then DeleteFile(Alias+'\pdoxusrs.lck');
// ���� ������� CURRENT �� ����������, ������
// ������� �� - �� ������� ��� - ������� ������� CURRENT � ��������� � ��� ��
  if not DirectoryExists(CurrentDir) then
  begin
    ForceDirectories(CurrentDir);
    CopyDirectory(Alias, CurrentDir+'\');
  end
  else
  begin
// ������� CURRENT ����������, ������ ��� �������� �� � ������� ��, � � �����-��
// �� ���������� ���. ������:
//  1. ����������, ���� �� ��������� ��� �� (����� ���� �� �������������)
//     � ���� - ��, ��������� (������� ��� �������, ����� ��������)
    if Application.MessageBox('��������� ��?', '���������� ��', MB_YESNO+MB_ICONQUESTION) = ID_YES then
    begin
      tNorms.Open;
      Year := IntToStr(YearOf(tNormsN_Date.Value));
      tNorms.Close;
      DeleteFiles(ExtractFilePath(Application.ExeName)+Year);
      CopyDirectory(Alias, ExtractFilePath(Application.ExeName)+'\'+Year+'\');
    end;
  end;
//  3. ������� ��� �� �������� � ������� ��
  DeleteFiles(Alias);
//  4. �������� � ���� ������ �� ���������� ��������
  CopyDirectory(ExtractFilePath(Application.ExeName)+lbYears.Items[lbYears.ItemIndex], Alias+'\');
  ShowMessage('������� ��� - '+lbYears.Items[lbYears.ItemIndex]);
  ModalResult := mrOk;
end;

function TfCurrentYear.GetAlias: String;
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

procedure TfCurrentYear.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; btnOkClick(nil); end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

end.
