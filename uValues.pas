unit uValues;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls, DB, DBTables;

type
  TfValues = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    grTempValues: TDBGrid;
    Panel3: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eNumber: TDBEdit;
    eDate: TDBEdit;
    tTempValues: TTable;
    dsTempValues: TDataSource;
    tValues: TTable;
    tIngreds: TTable;
    tValuesV_Code: TAutoIncField;
    tValuesV_AC_Code: TIntegerField;
    tValuesV_I_Code: TIntegerField;
    tValuesV_Value: TFloatField;
    tIngredsI_Code: TAutoIncField;
    tIngredsI_Name: TStringField;
    tIngredsI_Sorted: TIntegerField;
    tTempValuesTV_Code: TAutoIncField;
    tTempValuesTV_I_Code: TIntegerField;
    tTempValuesTV_I_Name: TStringField;
    tTempValuesTV_I_Sorted: TIntegerField;
    tTempValuesTV_Norma: TFloatField;
    tTempValuesTV_Value: TFloatField;
    tActs: TTable;
    tActsAC_Code: TAutoIncField;
    tActsAC_Act: TFloatField;
    tActsAC_Date: TDateField;
    tActsAC_W_Code: TIntegerField;
    tActsAC_Plan: TBooleanField;
    tActsAC_Proba: TBooleanField;
    qNorms: TQuery;
    qNormsN_Date: TDateField;
    tNorms: TTable;
    tNormsN_Code: TAutoIncField;
    tNormsN_W_Code: TIntegerField;
    tNormsN_I_Code: TIntegerField;
    tNormsN_Date: TDateField;
    tNormsN_Value: TFloatField;
    tNormsN_Output: TBooleanField;
    tWorks: TTable;
    tWorksW_Code: TAutoIncField;
    tWorksW_A_Code: TIntegerField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    tWorksW_Address: TStringField;
    tWorksW_FullName: TStringField;
    tWorksW_Label: TBooleanField;
    tWorksW_Side: TIntegerField;
    tWorksW_K_Code: TIntegerField;
    tWorksW_OldCode: TFloatField;
    qNormsN_W_Code: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure tTempValuesAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dsTempValuesStateChange(Sender: TObject);
  private
    { Private declarations }
    Closed : Boolean;
    procedure WriteToDB;
  public
    { Public declarations }
    MyW_Code : Integer;
    procedure DoWork;
  end;

implementation

uses uDm, uActs;

{$R *.dfm}

procedure TfValues.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE :
        begin
          Key := 0;
          Closed := True;
          if tTempValues.State = dsEdit then tTempValues.Post;
          WriteToDB;
          Close;
        end;
    end;
end;

procedure TfValues.btnOkClick(Sender: TObject);
begin
  Closed := True;
  if tTempValues.State = dsEdit then
    tTempValues.Post; 
  WriteToDB;
  Close;
end;

procedure TfValues.DoWork;
begin
  tTempValues.DatabaseName := ExtractFilePath(ParamStr(0));
  tTempValues.IndexDefs.Clear;
  tTempValues.IndexDefs.Add('', 'TV_Code', [ixPrimary, ixUnique]);
  tTempValues.IndexDefs.Add('iSorted', 'TV_I_Sorted', [ixCaseInsensitive]);
  tTempValues.IndexDefs.Add('iIngred', 'TV_I_Code', [ixCaseInsensitive]);
  tTempValues.CreateTable;
  tTempValues.Open;
  tTempValues.IndexFieldNames := 'TV_I_Code';
// Заполняем tTempValues - поле TV_Value
  if not tActs.FindKey([eNumber.Field.Value]) then Exit;
  tValues.SetRange([tActsAC_Code.Value], [tActsAC_Code.Value]);
  tValues.First;
  while not tValues.Eof do
  begin
    if tTempValues.FindKey([tValuesV_I_Code.Value]) then
      tTempValues.Edit
    else
      tTempValues.Insert;
    tTempValuesTV_I_Code.Value := tValuesV_I_Code.Value;
    if tIngreds.FindKey([tValuesV_I_Code.Value]) then
    begin
      tTempValuesTV_I_Name.Value   := tIngredsI_Name.Value;
      tTempValuesTV_I_Sorted.Value := tIngredsI_Sorted.Value;
    end;
    if tValuesV_Value.IsNull then
      tTempValuesTV_Value.Clear
    else
      tTempValuesTV_Value.Value := tValuesV_Value.Value;
    tTempValues.Post;
    tValues.Next;
  end;
  tValues.CancelRange;
// Заполняем нормы
  qNorms.ParamByName('MyDate').Value := tActsAC_Date.Value;
  qNorms.ParamByName('MyCode').Value := MyW_Code;
  qNorms.Open;
  if qNorms.RecordCount > 0 then
  begin
    qNorms.Last;

    tNorms.SetRange([MyW_Code, qNormsN_Date.Value], [MyW_Code, qNormsN_Date.Value]);
    while not tNorms.Eof do
    begin
      if tTempValues.FindKey([tNormsN_I_Code.Value]) then
        tTempValues.Edit
      else
        tTempValues.Insert;
      if tIngreds.FindKey([tNormsN_I_Code.Value]) then
      begin
        tTempValuesTV_I_Code.Value   := tIngredsI_Code.Value;
        tTempValuesTV_I_Name.Value   := tIngredsI_Name.Value;
        tTempValuesTV_I_Sorted.Value := tIngredsI_Sorted.Value;
      end;
      if tNormsN_Value.IsNull then
        tTempValuesTV_Norma.Clear
      else
        tTempValuesTV_Norma.Value := tNormsN_Value.Value;
      tTempValues.Post;
      tNorms.Next;
    end;
    tNorms.CancelRange;
  end;
  qNorms.Close;
  tTempValues.IndexFieldNames := 'TV_I_Sorted';
  tTempValues.First;
  grTempValues.SelectedField := tTempValuesTV_Value;
  tTempValues.AfterPost      := tTempValuesAfterPost;
  tTempValues.AfterScroll    := tTempValuesAfterPost;
  dsTempValues.OnStateChange := dsTempValuesStateChange;
end;

procedure TfValues.tTempValuesAfterPost(DataSet: TDataSet);
begin
  if not Closed then WriteToDB;
end;

procedure TfValues.FormCreate(Sender: TObject);
begin
  Closed := False;
end;

procedure TfValues.WriteToDB;
begin
  if tTempValues.RecordCount = 0 then Exit;
  if tActs.FindKey([eNumber.Field.Value]) then
  begin
    if tValues.FindKey([tActsAC_Code.Value, tTempValuesTV_I_Code.Value]) then
    begin
      tValues.Edit;
      if tTempValuesTV_Value.IsNull then
        tValuesV_Value.Clear
      else
        tValuesV_Value.Value := tTempValuesTV_Value.Value;
      tValues.Post;
    end
    else
    begin
      tValues.Insert;
      tValuesV_Value.Value := tTempValuesTV_Value.Value;
      tValuesV_AC_Code.Value := tActsAC_Code.Value;
      tValuesV_I_Code.Value := tTempValuesTV_I_Code.Value;
      tValues.Post;
    end;
  end;
end;

procedure TfValues.dsTempValuesStateChange(Sender: TObject);
begin
  if tTempValues.State = dsInsert then tTempValues.Cancel
end;

end.
