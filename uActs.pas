unit uActs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, Db, DBTables, Menus, Grids, DBGrids,
  StdCtrls, DBCtrls, Mask;

type
  TfActs = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    tActs: TTable;
    tActsAC_Code: TAutoIncField;
    tActsAC_Act: TFloatField;
    tActsAC_Date: TDateField;
    tActsAC_W_Code: TIntegerField;
    tActsAC_Plan: TBooleanField;
    tActsAC_Proba: TBooleanField;
    ToolButton1: TToolButton;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    ToolButton2: TToolButton;
    btnSearchAct: TToolButton;
    btnSearchDate: TToolButton;
    ToolButton7: TToolButton;
    btnValues: TToolButton;
    Menu: TPopupMenu;
    iAdd: TMenuItem;
    iEdit: TMenuItem;
    iDelete: TMenuItem;
    N4: TMenuItem;
    iSearchAct: TMenuItem;
    iSearchDate: TMenuItem;
    N7: TMenuItem;
    iWorks: TMenuItem;
    N9: TMenuItem;
    iValues: TMenuItem;
    N11: TMenuItem;
    iClose: TMenuItem;
    dsActs: TDataSource;
    grActs: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    tWorks: TTable;
    tAreas: TTable;
    tWorksW_Code: TAutoIncField;
    tWorksW_A_Code: TIntegerField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    tWorksW_Address: TStringField;
    tWorksW_FullName: TStringField;
    tWorksW_Label: TBooleanField;
    tAreasA_Code: TAutoIncField;
    tAreasA_Name: TStringField;
    tWorksArea: TStringField;
    dsWorks: TDataSource;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSearchActClick(Sender: TObject);
    procedure btnSearchDateClick(Sender: TObject);
    procedure btnValuesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm, uEditAct, uStrings, uSearchAct, uSearchDate, uVars, uValues;

{$R *.DFM}

procedure TfActs.btnOkClick(Sender: TObject);
begin
  Close
end;

procedure TfActs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close;                   end;
      VK_RETURN : begin Key := 0; btnEditClick(nil);       end;
      VK_INSERT : begin Key := 0; btnAddClick(nil);        end;
      VK_DELETE : begin Key := 0; btnDeleteClick(nil);     end;
      VK_F7     : begin Key := 0; btnSearchActClick(nil);  end;
      VK_F6     : begin Key := 0; btnSearchDateClick(nil); end;
      VK_F2     : begin Key := 0; btnValuesClick(nil);     end;
    end;
end;

procedure TfActs.btnAddClick(Sender: TObject);
var
  Add : TfEditAct;
begin
  Add := TfEditAct.Create(nil);
  try
    tActs.Insert;
    tActsAC_Plan.Value := True;
    tActsAC_Proba.Value := True;
    tActsAC_Date.Value := Date;
    Add.WhatDo := wdInsert;
    if Add.ShowModal = mrOk then tActs.Post
    else                         tActs.Cancel;
  finally
    Add.Free;
  end;
end;

procedure TfActs.btnEditClick(Sender: TObject);
var
  Edit : TfEditAct;
begin
  Edit := TfEditAct.Create(nil);
  try
    Edit.WhatDo := wdEdit;
    Edit.ActCode := tActsAC_Code.Value;
    tActs.Edit;
    if Edit.ShowModal = mrOk then tActs.Post
    else                          tActs.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfActs.btnDeleteClick(Sender: TObject);
begin
  if tActs.RecordCount = 0 then Exit;
  if (Application.MessageBox(PChar(Format(sDelAct, [tActsAC_Act.Value])), sDelActCap, MB_YESNO+MB_ICONQUESTION) = ID_YES) then
    tActs.Delete;
end;

procedure TfActs.btnSearchActClick(Sender: TObject);
var
  Search : TfSearchAct;
begin
  Search := TfSearchAct.Create(nil);
  try
    if Search.ShowModal = mrOk then
      tActs.FindNearest([StrToFloat(Search.eAct.Text)]);
  finally
    Search.Free;
  end;
end;

procedure TfActs.btnSearchDateClick(Sender: TObject);
var
  Search : TfSearchDate;
begin
  Search := TfSearchDate.Create(nil);
  try
    Search.eDate.Date := Date;
    if Search.ShowModal = mrOk then
    begin
      tActs.IndexFieldNames := 'AC_Date';
      tActs.FindNearest([Search.eDate.Date]);
      tActs.IndexFieldNames := 'AC_Act';
    end;
  finally
    Search.Free;
  end;
end;

procedure TfActs.btnValuesClick(Sender: TObject);
var
  Values : TfValues;
begin
  Values := TfValues.Create(nil);
  try
    Values.MyW_Code := tWorksW_Code.Value;
    Values.DoWork;
    Values.ShowModal;
  finally
    Values.Free;
  end;
end;

end.
