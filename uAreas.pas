unit uAreas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, Db, DBTables, Menus;

type
  TfAreas = class(TForm)
    ToolBar: TToolBar;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    grAreas: TDBGrid;
    btnQuit: TToolButton;
    ToolButton2: TToolButton;
    tAreas: TTable;
    dsAreas: TDataSource;
    tAreasA_Code: TAutoIncField;
    tAreasA_Name: TStringField;
    Menu: TPopupMenu;
    iAdd: TMenuItem;
    iEdit: TMenuItem;
    iDel: TMenuItem;
    N4: TMenuItem;
    iClose: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnQuitClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure iCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm, uEditArea, uStrings, uVars;

{$R *.DFM}

procedure TfAreas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close; end;
      VK_RETURN : begin Key := 0; btnEditClick(nil); end;
      VK_INSERT : begin Key := 0; btnAddClick(nil); end;
      VK_DELETE : begin Key := 0; btnDeleteClick(nil); end;
    end;
end;

procedure TfAreas.btnQuitClick(Sender: TObject);
begin
  Close
end;

procedure TfAreas.btnAddClick(Sender: TObject);
var
  Add : TfEditArea;
begin
  Add := TfEditArea.Create(nil);
  try
    tAreas.Insert;
    Add.WhatDo := wdInsert;
    if Add.ShowModal = mrOk then tAreas.Post
    else                         tAreas.Cancel;
  finally
    Add.Free;
  end;
end;

procedure TfAreas.btnEditClick(Sender: TObject);
var
  Edit : TfEditArea;
begin
  if tAreas.RecordCount = 0 then Exit;
  Edit := TfEditArea.Create(nil);
  try
    Edit.Caption := sEditArea;
    Edit.WhatDo := wdEdit;
    Edit.PrevArea := tAreasA_Name.Value;
    tAreas.Edit;
    if Edit.ShowModal = mrOk then tAreas.Post
    else                          tAreas.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfAreas.btnDeleteClick(Sender: TObject);
begin
  if tAreas.RecordCount = 0 then Exit;
  if (Application.MessageBox(PChar(Format(sDelArea, [tAreasA_Name.Value])), sDelAreaCap, MB_YESNO+MB_ICONQUESTION) = ID_YES) then
    tAreas.Delete;
end;

procedure TfAreas.iCloseClick(Sender: TObject);
begin
  Close
end;

end.
