unit uIngreds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, Db, DBTables, Menus;

type
  TfIngreds = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    ToolButton2: TToolButton;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    grIngreds: TDBGrid;
    tIngreds: TTable;
    dsIngreds: TDataSource;
    tIngredsI_Code: TAutoIncField;
    tIngredsI_Name: TStringField;
    Menu: TPopupMenu;
    iAdd: TMenuItem;
    iEdit: TMenuItem;
    iDel: TMenuItem;
    N4: TMenuItem;
    iClose: TMenuItem;
    ToolButton1: TToolButton;
    btnMoves: TToolButton;
    tIngreds2: TTable;
    tIngreds2I_Name: TStringField;
    tIngreds2I_Sorted: TIntegerField;
    tIngredsI_Sorted: TIntegerField;
    tIngredsI_HowOutput: TStringField;
    tIngredsI_HowOutput2: TStringField;
    tIngredsI_EdIzm: TStringField;
    tIngredsI_EdIzm2: TStringField;
    tIngredsI_IsPH: TBooleanField;
    tIngredsI_HowRegistr: TBooleanField;
    tIngredsI_EdRegistr: TBooleanField;
    tIngredsDocument: TStringField;
    tIngredsStarlet: TBooleanField;
    tQuery: TQuery;
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure iCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grIngredsCellClick(Column: TColumn);
    procedure btnMovesClick(Sender: TObject);
    procedure grIngredsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Moved : Boolean;
    IngrName : String;
    IngrSort : Integer;
    procedure DoOnMoved;
  public
    { Public declarations }
  end;

implementation

uses uDm, uEditIngreds, uVars, uStrings;

{$R *.DFM}

procedure TfIngreds.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfIngreds.btnAddClick(Sender: TObject);
var
  Add : TfEditIngreds;
begin
  if Moved then
  begin
    ShowMessage(sEndMoved); Exit;
  end;
  Add := TfEditIngreds.Create(nil);
  try
    tIngreds.Insert;
    tIngredsI_IsPH.Value       := False;
    tIngredsI_HowRegistr.Value := False;
    tIngredsI_EdRegistr.Value  := True;
    Add.WhatDo := wdInsert;
    if Add.ShowModal = mrOk then tIngreds.Post
    else                         tIngreds.Cancel;
  finally
    Add.Free;
  end;
end;

procedure TfIngreds.btnEditClick(Sender: TObject);
var
  Edit : TfEditIngreds;
begin
  if Moved then
  begin
    ShowMessage(sEndMoved); Exit;
  end;
  if tIngreds.RecordCount = 0 then Exit;
  Edit := TfEditIngreds.Create(nil);
  try
    Edit.Caption := sEditIngred;
    Edit.WhatDo := wdEdit;
    Edit.PrevIngred := tIngredsI_Name.Value;
    tIngreds.Edit;
    if tIngredsI_IsPH.IsNull       then tIngredsI_IsPH.Value       := False;
    if tIngredsI_HowRegistr.IsNull then tIngredsI_HowRegistr.Value := False;
    if tIngredsI_EdRegistr.IsNull  then tIngredsI_EdRegistr.Value  := True;
    if Edit.ShowModal = mrOk then tIngreds.Post
    else                          tIngreds.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfIngreds.btnDeleteClick(Sender: TObject);
begin
  if Moved then
  begin
    ShowMessage(sEndMoved); Exit;
  end;
  if tIngreds.RecordCount = 0 then Exit;
  if (Application.MessageBox(PChar(Format(sDelIngred, [tIngredsI_Name.Value])), sDelIngredCap, MB_YESNO+MB_ICONQUESTION) = ID_YES) then
  begin
    tQuery.SQL.Text := 'DELETE FROM Formats WHERE F_I_CODE = :MyCode';
    tQuery.ParamByName('MyCode').AsInteger := tIngredsI_Code.AsInteger;
    tQuery.ExecSql;
    tQuery.Close;

    tQuery.SQL.Text := 'DELETE FROM Mags_Ingreds WHERE MI_I_CODE = :MyCode';
    tQuery.ParamByName('MyCode').AsInteger := tIngredsI_Code.AsInteger;
    tQuery.ExecSql;
    tQuery.Close;

    tQuery.SQL.Text := 'DELETE FROM Norms WHERE N_I_CODE = :MyCode';
    tQuery.ParamByName('MyCode').AsInteger := tIngredsI_Code.AsInteger;
    tQuery.ExecSql;
    tQuery.Close;

    tQuery.SQL.Text := 'DELETE FROM "values" WHERE V_I_CODE = :MyCode';
    tQuery.ParamByName('MyCode').AsInteger := tIngredsI_Code.AsInteger;
    tQuery.ExecSql;
    tQuery.Close;

    tIngreds.Delete;
  end;
end;

procedure TfIngreds.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close;               end;
      VK_RETURN : begin Key := 0; btnEditClick(nil);   end;
      VK_INSERT : begin Key := 0; btnAddClick(nil);    end;
      VK_DELETE : begin Key := 0; btnDeleteClick(nil); end;
      VK_SPACE  : begin Key := 0; btnMovesClick(nil);  end;
    end;
end;

procedure TfIngreds.iCloseClick(Sender: TObject);
begin
  Close
end;

procedure TfIngreds.FormCreate(Sender: TObject);
begin
  Moved := False;
end;

procedure TfIngreds.grIngredsCellClick(Column: TColumn);
begin
  if Moved then
    DoOnMoved;
end;

procedure TfIngreds.btnMovesClick(Sender: TObject);
begin
  if tIngreds.RecordCount < 2 then Exit;
  Moved := not Moved;
  if Moved then
  begin
    Caption := sMovedIngred;
    IngrName := tIngredsI_Name.Value;
    IngrSort := tIngredsI_Sorted.Value;
  end
  else
    Caption := sIngred;
end;

procedure TfIngreds.grIngredsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Moved then
    DoOnMoved;
end;

procedure TfIngreds.DoOnMoved;
var
  CurOrd, Step, I : Integer;
begin
  if IngrSort = tIngredsI_Sorted.Value then Exit;
  if tIngredsI_Sorted.Value < IngrSort then Step := -1
  else                                      Step :=  1;
  CurOrd := tIngredsI_Sorted.Value;
  tIngreds2.Open;
  tIngreds2.FindKey([IngrSort]);
  tIngreds2.Edit;
  tIngreds2I_Sorted.Value := 0;
  tIngreds2.Post;
  if Step > 0 then
  begin
    I := 1;
    tIngreds2.First;
    tIngreds2.Next;
  end
  else
  begin
    I := tIngreds2.RecordCount;
    tIngreds2.Last;
  end;
  while True do
  begin
    tIngreds2.Edit;
    tIngreds2I_Sorted.Value := I;
    tIngreds2.Post;
    I := I + Step;
    tIngreds2.MoveBy(Step);
    if I = CurOrd then break;
  end;
  tIngreds2.First;
  tIngreds2.Edit;
  tIngreds2I_Sorted.Value := CurOrd;
  tIngreds2.Post;
  tIngreds2.Close;
  tIngreds.Refresh;
  tIngreds.FindKey([CurOrd]);
  IngrSort := CurOrd;
end;

end.
