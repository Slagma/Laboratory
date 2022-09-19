unit uNorms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Menus, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  DBCtrls, Db, DBTables;

type
  TfNorms = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    ToolButton2: TToolButton;
    btnNew: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    ToolButton6: TToolButton;
    btnEditDate: TToolButton;
    btnWorks: TToolButton;
    ToolButton1: TToolButton;
    Popup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel1: TPanel;
    grTempNorms: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    tWorks: TTable;
    tWorksW_Code: TAutoIncField;
    tWorksW_A_Code: TIntegerField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    tWorksW_Address: TStringField;
    tWorksW_FullName: TStringField;
    tWorksW_Label: TBooleanField;
    dsWorks: TDataSource;
    tTempNorms: TTable;
    dsTempNorms: TDataSource;
    qNorms: TQuery;
    tNorms: TTable;
    tIngreds: TTable;
    tNormsN_Code: TAutoIncField;
    tNormsN_W_Code: TIntegerField;
    tNormsN_I_Code: TIntegerField;
    tNormsN_Date: TDateField;
    tNormsN_Value: TFloatField;
    tNormsN_Output: TBooleanField;
    tIngredsI_Code: TAutoIncField;
    tIngredsI_Name: TStringField;
    tIngredsI_Sorted: TIntegerField;
    ToolButton3: TToolButton;
    btnNewNorms: TToolButton;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    btnDelNorms: TToolButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditDateClick(Sender: TObject);
    procedure btnWorksClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewNormsClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateTempTable;
    procedure FullTempTable;
    procedure FillGrid;
    procedure EditNorma;
    procedure EditOutput;
  public
    { Public declarations }
  end;

var
  fNorms: TfNorms;

implementation

uses uDm, uSearchWork, uEditNorm, uEditOutput, uChoiceDate, uStrings,
  uChoiceIngr;

{$R *.DFM}

procedure TfNorms.btnOkClick(Sender: TObject);
begin
  Close
end;

procedure TfNorms.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close;                 end;
      VK_INSERT : begin Key := 0; btnNewClick(nil);      end;
      VK_RETURN : begin Key := 0; btnEditClick(nil);     end;
      VK_DELETE : begin Key := 0; btnDeleteClick(nil);   end;
      VK_F7     : begin Key := 0; btnEditDateClick(nil); end;
      VK_F8     : begin Key := 0; btnWorksClick(nil);    end;
      VK_F11    : begin Key := 0; btnNewNormsClick(nil); end;
      VK_F12    : begin Key := 0; N9Click(nil);          end;
    end;
end;

procedure TfNorms.btnNewClick(Sender: TObject);
var
  Choice : TfChoiceIngr;
begin
  Choice := TfChoiceIngr.Create(nil);
  try
    Choice.tIngreds.ParamByName('MyCode').Value := tWorksW_Code.Value;
    Choice.tIngreds.Open;
    if (Choice.ShowModal = mrOk) and (Choice.tIngreds.RecordCount > 0) then
    begin
      qNorms.Open;
      qNorms.First;
      while not qNorms.Eof do
      begin
        if not tNorms.FindKey([tWorksW_Code.Value, qNorms.FieldByName('N_Date').Value, Choice.tIngredsI_Code.Value]) then
        begin
          tNorms.Insert;
          tNormsN_W_Code.Value := tWorksW_Code.Value;
          tNormsN_I_Code.Value := Choice.tIngredsI_Code.Value;
          tNormsN_Output.Value := True;
          tNormsN_Date.Value   := qNorms.FieldByName('N_Date').Value;
          tNormsN_Value.Clear;
          tNorms.Post;
        end;
        qNorms.Next;
      end;
      qNorms.Close;
      tTempNorms.Close;
      FormCreate(nil);
    end;
  finally
    Choice.Free;
  end;
end;

procedure TfNorms.btnEditClick(Sender: TObject);
begin
  case grTempNorms.SelectedIndex of
    0 : ;
    1 : EditOutput;
    else EditNorma;
  end;
end;

procedure TfNorms.btnDeleteClick(Sender: TObject);

begin
  if Application.MessageBox(PChar(Format(sDelIngrNorms, [tTempNorms.FieldByName('TN_I_Name').Value])), sDelIngrNormsHdr, MB_YESNO+MB_ICONQUESTION) = ID_YES then
  begin
    qNorms.Open;
    qNorms.First;
    while not qNorms.Eof do
    begin
      if tNorms.FindKey([tWorksW_Code.Value, qNorms.FieldByName('N_Date').Value, tTempNorms.FieldByName('TN_I_Code').Value]) then
        tNorms.Delete;
      qNorms.Next;
    end;
    qNorms.Close;
    tTempNorms.Close;
    FormCreate(nil);
  end;
end;

procedure TfNorms.btnEditDateClick(Sender: TObject);
var
  Choice : TfChoiceDate;
  OldDate : TDate;
begin
  if grTempNorms.SelectedIndex < 2 then Exit;
  Choice := TfChoiceDate.Create(nil);
  try
    Choice.Caption := 'Смена даты норм';
    OldDate := StrToDate(grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName);
    Choice.Calendar.Date := OldDate;
    if (Choice.ShowModal = mrOk) and (Choice.Calendar.Date <> OldDate) then
    begin
      tNorms.SetRange([tWorksW_Code.Value, OldDate], [tWorksW_Code.Value, OldDate]);
      while tNorms.RecordCount > 0 do
      begin
        tNorms.Edit;
        tNormsN_Date.Value := Choice.Calendar.Date;
        tNorms.Post;
      end;
      tNorms.CancelRange;
      tTempNorms.Close;
      FormCreate(nil);
    end;
  finally
    Choice.Free;
  end;
end;

procedure TfNorms.btnWorksClick(Sender: TObject);
var
  Choice : TfSearchWork;
begin
  Choice := TfSearchWork.Create(nil);
  try
    Choice.tWorks.FindKey([tWorksW_ShortName.Value]);
    if Choice.ShowModal = mrOk then
    begin
      tWorks.FindKey([Choice.tWorksW_Code.Value]);
      tTempNorms.Close;
      tTempNorms.DeleteTable;
      FormCreate(nil);
    end;
  finally
    Choice.Free;
  end;
end;

procedure TfNorms.FormCreate(Sender: TObject);
var
  MyField : TBooleanField;
begin
  tWorks.Open;
  tTempNorms.DatabaseName := ExtractFilePath(ParamStr(0));
  CreateTempTable;
  tTempNorms.IndexFieldNames := 'TN_I_Code';
  tTempNorms.Open;
  FillGrid;
  FullTempTable;
  tTempNorms.IndexFieldNames := 'TN_I_Sorted';
  MyField := TBooleanField(tTempNorms.FieldByName('TN_N_Output'));
  MyField.DisplayValues := 'Да;Нет';
  qNorms.Close;
  tTempNorms.First;
end;

procedure TfNorms.CreateTempTable;
begin
// Создаем поля
  tTempNorms.FieldDefs.Clear;
  tTempNorms.FieldDefs.Add('TN_Code', ftAutoInc, 0, True);
  tTempNorms.FieldDefs.Add('TN_I_Code', ftInteger, 0, False);
  tTempNorms.FieldDefs.Add('TN_I_Name', ftString, 35, False);
  tTempNorms.FieldDefs.Add('TN_I_Sorted', ftInteger, 0, False);
  tTempNorms.FieldDefs.Add('TN_N_Output', ftBoolean, 0, False);
// Определяем даты норм
  qNorms.ParamByName('MyCode').Value := tWorksW_Code.Value;
  qNorms.Open;
  qNorms.First;
  while not qNorms.Eof do
  begin
    tTempNorms.FieldDefs.Add(DateToStr(qNorms.FieldByName('N_Date').Value), ftFloat, 0, False);
    qNorms.Next;
  end;
// Создаем индексы
  tTempNorms.IndexDefs.Clear;
  tTempNorms.IndexDefs.Add('', 'TN_Code', [ixPrimary, ixUnique]);
  tTempNorms.IndexDefs.Add('iSorted', 'TN_I_Sorted', [ixCaseInsensitive]);
  tTempNorms.IndexDefs.Add('iIngred', 'TN_I_Code', [ixCaseInsensitive]);
  tTempNorms.CreateTable;
end;

procedure TfNorms.FillGrid;
var
  I : Integer;
begin
  while grTempNorms.Columns.Count > 2 do
    grTempNorms.Columns.Delete(grTempNorms.Columns.Count - 1);
  I := 0;
  qNorms.First;
  while not qNorms.Eof do
  begin
    grTempNorms.Columns.Add;
    grTempNorms.Columns.Items[2+I].Title.Caption := DateToStr(qNorms.FieldByName('N_Date').Value);
    grTempNorms.Columns.Items[2+I].Width := 80;
    grTempNorms.Columns.Items[2+I].Title.Alignment := taCenter;
    grTempNorms.Columns.Items[2+I].FieldName := DateToStr(qNorms.FieldByName('N_Date').Value);

    qNorms.Next;
    Inc(I);
  end;
end;

procedure TfNorms.FullTempTable;
begin
  qNorms.First;
  while not qNorms.Eof do
  begin
    tNorms.SetRange([tWorksW_Code.Value, qNorms.FieldByName('N_Date').Value], [tWorksW_Code.Value, qNorms.FieldByName('N_Date').Value]);
    tNorms.First;
    while not tNorms.Eof do
    begin
      if tIngreds.FindKey([tNormsN_I_Code.Value]) then
      begin
        if tTempNorms.FindKey([tNormsN_I_Code.Value]) then tTempNorms.Edit
        else                                               tTempNorms.Insert;
        tTempNorms.FieldByName('TN_I_Code').Value   := tIngredsI_Code.Value;
        tTempNorms.FieldByName('TN_I_Name').Value   := tIngredsI_Name.Value;
        tTempNorms.FieldByName('TN_I_Sorted').Value := tIngredsI_Sorted.Value;
        if tTempNorms.State = dsInsert then
          tTempNorms.FieldByName('TN_N_Output').Value := tNormsN_Output.Value;
        if not tNormsN_Value.IsNull then
          tTempNorms.FieldByName(qNorms.FieldByName('N_Date').Value).Value := tNormsN_Value.Value;
        tTempNorms.Post;
      end;
      tNorms.Next;
    end;
    tNorms.CancelRange;
    qNorms.Next;
  end;
end;

procedure TfNorms.EditNorma;
var
  Edit : TfEditNorm;
begin
  Edit := TfEditNorm.Create(nil);
  try
    tTempNorms.Edit;
    Edit.Caption := Edit.Caption + grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName;
    Edit.eValue.DataField := grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName;
    if Edit.ShowModal = mrOk then
    begin
      tTempNorms.Post;
      if tNorms.FindKey([tWorksW_Code.Value, StrToDate(grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName), tTempNorms.FIeldByName('TN_I_Code').Value]) then
      begin
        tNorms.Edit;
        if tTempNorms.FieldByName(grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName).IsNull then
          tNormsN_Value.Clear
        else
          tNormsN_Value.Value := tTempNorms.FieldByName(grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName).Value;
        tNorms.Post;
      end;
    end
    else
      tTempNorms.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfNorms.EditOutput;
var
  Edit : TfEditOutput;
begin
  Edit := TfEditOutput.Create(nil);
  try
    tTempNorms.Edit;
    Edit.Caption := tTempNorms.FieldByName('TN_I_Name').Value+'. '+Edit.Caption;
    if Edit.ShowModal = mrOk then
    begin
      tTempNorms.Post;
      // Редактируем tNorms
      qNorms.Open;
      qNorms.First;
      while not qNorms.Eof do
      begin
        if tNorms.FindKey([tWorksW_Code.Value, qNorms.FieldByName('N_Date').Value, tTempNorms.FIeldByName('TN_I_Code').Value]) then
        begin
          tNorms.Edit;
          tNormsN_Output.Value := tTempNorms.FieldByName('TN_N_Output').Value;
          tNorms.Post;
        end;
        qNorms.Next;
      end;
      qNorms.Close;
    end
    else
      tTempNorms.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfNorms.btnNewNormsClick(Sender: TObject);
var
  Choice : TfChoiceDate;
  Founded : Boolean;
begin
  Founded := False;
  Choice := TfChoiceDate.Create(nil);
  try
    Choice.Caption := 'Новые нормы';
    Choice.Calendar.Date := Date;
    if Choice.ShowModal = mrOk then
    begin
    // Проверяем - есть ли нормы с такой датой
      qNorms.Open;
      qNorms.First;
      while not qNorms.Eof do
      begin
        if qNorms.FieldByName('N_Date').Value = Choice.Calendar.Date then
        begin
          Founded := True;
          break;
        end;
        qNorms.Next;
      end;
      qNorms.Close;
      if Founded then
        ShowMessage(erNormDate)
      else
      begin
        tTempNorms.First;
        while not tTempNorms.Eof do
        begin
          tNorms.Insert;
          tNormsN_W_Code.Value := tWorksW_Code.Value;
          tNormsN_I_Code.Value := tTempNorms.FieldByName('TN_I_Code').Value;
          tNormsN_Output.Value := True;
          tNormsN_Date.Value   := Choice.Calendar.Date;
          tNormsN_Value.Clear;
          tNorms.Post;
          tTempNorms.Next;
        end;
        if tTempNorms.RecordCount = 0 then
        begin
          tIngreds.First;
          while not tIngreds.Eof do
          begin
            tNorms.Insert;
            tNormsN_W_Code.Value := tWorksW_Code.Value;
            tNormsN_I_Code.Value := tIngredsI_Code.Value;
            tNormsN_Output.Value := True;
            tNormsN_Date.Value   := Choice.Calendar.Date;
            tNormsN_Value.Clear;
            tNorms.Post;
            tIngreds.Next;
          end;
        end;
        tTempNorms.Close;
        FormCreate(nil);
      end;
    end;
  finally
    Choice.Free;
  end;
end;

procedure TfNorms.N9Click(Sender: TObject);
begin
  if grTempNorms.SelectedIndex < 2 then Exit;
  if Application.MessageBox(PChar(Format(sDelNorms, [grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName])), sDelNormsHdr, MB_YESNO+MB_ICONQUESTION) = ID_YES then
  begin
    tNorms.SetRange([tWorksW_Code.Value, StrToDate(grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName)], [tWorksW_Code.Value, StrToDate(grTempNorms.Columns[grTempNorms.SelectedIndex].FieldName)]);
    while tNorms.RecordCount > 0 do
      tNorms.Delete;
    tNorms.CancelRange;
    tTempNorms.Close;
    FormCreate(nil);
  end;
end;

end.
