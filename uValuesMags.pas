unit uValuesMags;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ExtCtrls, Grids, DBGrids, StdCtrls,
  Mask, DBCtrls, DB, DBTables;

type
  TfValuesMags = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    ToolButton2: TToolButton;
    btnChoiceMag: TToolButton;
    btnChoiceAct: TToolButton;
    ToolButton5: TToolButton;
    btnEdit: TToolButton;
    Menu: TPopupMenu;
    F71: TMenuItem;
    F81: TMenuItem;
    ENTER1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    grTempValues: TDBGrid;
    tWorks: TTable;
    tWorksW_Code: TAutoIncField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    tTempValues: TTable;
    dsTempValues: TDataSource;
    tActs: TTable;
    tActsAC_Code: TAutoIncField;
    tActsAC_Act: TFloatField;
    tActsAC_Date: TDateField;
    tActsAC_W_Code: TIntegerField;
    tActsAC_Plan: TBooleanField;
    tActsAC_Proba: TBooleanField;
    tMagazins: TTable;
    tMagazinsM_Code: TAutoIncField;
    tMagazinsM_Name: TStringField;
    tMagsIngreds: TTable;
    tMagsIngredsMI_M_Code: TIntegerField;
    tMagsIngredsMI_I_Code: TIntegerField;
    tIngreds: TTable;
    tIngredsI_Code: TAutoIncField;
    tIngredsI_Name: TStringField;
    tIngredsI_Sorted: TIntegerField;
    dsMagazins: TDataSource;
    dsWorks: TDataSource;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dsActs: TDataSource;
    tValues: TTable;
    tValuesV_Code: TAutoIncField;
    tValuesV_AC_Code: TIntegerField;
    tValuesV_I_Code: TIntegerField;
    tValuesV_Value: TFloatField;
    tTempValuesTV_Code: TAutoIncField;
    tTempValuesTV_I_Code: TIntegerField;
    tTempValuesTV_I_Name: TStringField;
    tTempValuesTV_I_Sorted: TIntegerField;
    tTempValuesTV_Norma: TFloatField;
    tTempValuesTV_Value: TFloatField;
    qNorms: TQuery;
    tNorms: TTable;
    tNormsN_W_Code: TIntegerField;
    tNormsN_I_Code: TIntegerField;
    tNormsN_Date: TDateField;
    tNormsN_Value: TFloatField;
    qNormsN_Date: TDateField;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnChoiceActClick(Sender: TObject);
    procedure btnChoiceMagClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
   procedure FillTable;
  public
    { Public declarations }
  end;

implementation

uses uDm, uEditValueMag, uChoiceMag, uChoiceAct;

{$R *.dfm}

procedure TfValuesMags.btnOkClick(Sender: TObject);
begin
  Close
end;

procedure TfValuesMags.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; btnEditClick(nil);      end;
      VK_ESCAPE : begin Key := 0; Close;                  end;
      VK_F7     : begin Key := 0; btnChoiceMagClick(nil); end;
      VK_F8     : begin Key := 0; btnChoiceActClick(nil); end;
    end;
end;

procedure TfValuesMags.btnChoiceActClick(Sender: TObject);
var
  Choice : TfChoiceAct;
begin
  Choice := TfChoiceAct.Create(nil);
  try
    Choice.tActs.FindKey([tActsAC_Act.Value]);
    if Choice.ShowModal = mrOk then
    begin
      tTempValues.Close;
      tActs.FindKey([Choice.tActsAC_Code.Value]);
      FillTable;
    end;
  finally
    Choice.Free;
  end;
end;

procedure TfValuesMags.btnChoiceMagClick(Sender: TObject);
var
  Choice : TfChoiceMag;
begin
  Choice := TfChoiceMag.Create(nil);
  try
    if Choice.ShowModal = mrOk then
    begin
      tTempValues.Close;
      tMagazins.FindKey([Choice.tMagazinsM_Code.Value]);
      FillTable;
    end;
  finally
    Choice.Free;
  end;
end;

procedure TfValuesMags.N2Click(Sender: TObject);
begin
  Close
end;

procedure TfValuesMags.FormCreate(Sender: TObject);
begin
  FillTable;
end;

procedure TfValuesMags.FillTable;
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
  tMagsIngreds.First;
  while not tMagsIngreds.Eof do
  begin
    if not tValues.FindKey([tActsAC_Code.Value, tMagsIngredsMI_I_Code.Value]) then
    begin
      tValues.Insert;
      tValuesV_AC_Code.Value := tActsAC_Code.Value;
      tValuesV_I_Code.Value  := tMagsIngredsMI_I_Code.Value;
      tValuesV_Value.Clear;
      tValues.Post;
    end;
    if tValues.FindKey([tActsAC_Code.Value, tMagsIngredsMI_I_Code.Value]) then
    begin
      if tTempValues.FindKey([tMagsIngredsMI_I_Code.Value]) then
        tTempValues.Edit
      else
        tTempValues.Insert;
      tTempValuesTV_I_Code.Value := tMagsIngredsMI_I_Code.Value;
      if tIngreds.FindKey([tMagsIngredsMI_I_Code.Value]) then
      begin
        tTempValuesTV_I_Name.Value := tIngredsI_Name.Value;
        tTempValuesTV_I_Sorted.Value := tIngredsI_Sorted.Value;
      end;
      tTempValuesTV_Value.Value := tValuesV_Value.Value;
      tTempValues.Post;
    end;
    tMagsIngreds.Next;
  end;

// Заполняем нормы
  qNorms.ParamByName('MyDate').Value := tActsAC_Date.Value;
  qNorms.ParamByName('MyCode').Value := tWorksW_Code.Value;
  qNorms.Open;
  if qNorms.RecordCount > 0 then
  begin
    qNorms.Last;
    tMagsIngreds.First;
    while not tMagsIngreds.Eof do
    begin
      if tNorms.FindKey([tWorksW_Code.Value, qNormsN_Date.Value, tMagsIngredsMI_I_Code.Value]) then
      begin
        if tTempValues.FindKey([tNormsN_I_Code.Value]) then
          tTempValues.Edit
        else
          tTempValues.Insert;
        if tIngreds.FindKey([tNormsN_I_Code.Value]) then
        begin
          tTempValuesTV_I_Name.Value   := tIngredsI_Name.Value;
          tTempValuesTV_I_Sorted.Value := tIngredsI_Sorted.Value;
        end;
        tTempValuesTV_Norma.Value := tNormsN_Value.Value;
        tTempValues.Post;
      end;
      tMagsIngreds.Next;
    end;
  end;
  qNorms.Close;

  tTempValues.IndexFieldNames := 'TV_I_Sorted';
  tTempValues.First;
end;

procedure TfValuesMags.btnEditClick(Sender: TObject);
var
  Edit : TfEditValueMag;
begin
  if tTempValues.RecordCount = 0 then Exit;
  Edit := TfEditValueMag.Create(nil);
  try
    tTempValues.Edit;
    if Edit.ShowModal = mrOk then
    begin
      tTempValues.Post;
      if tValues.FindKey([tActsAC_Code.Value, tTempValuesTV_I_Code.Value]) then
      begin
        tValues.Edit;
        tValuesV_Value.Value := tTempValuesTV_Value.Value;
        tValues.Post;
      end;
    end
    else
      tTempValues.Cancel;
  finally
    Edit.Free;
  end;
end;

end.
