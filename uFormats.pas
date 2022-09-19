unit uFormats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, DB, Grids, DBGrids, DBTables;

type
  TfFormats = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    ToolButton2: TToolButton;
    btnEdit: TToolButton;
    tFormats: TTable;
    grFormats: TDBGrid;
    dsFormats: TDataSource;
    tFormatsF_Code: TAutoIncField;
    tFormatsF_I_Code: TIntegerField;
    tFormatsF_Header: TStringField;
    tFormatsF_All: TIntegerField;
    tFormatsF_Posle: TIntegerField;
    tIngreds: TTable;
    tIngredsI_Code: TAutoIncField;
    tIngredsI_Name: TStringField;
    tIngredsI_Sorted: TIntegerField;
    dsIngreds: TDataSource;
    tFormatsIngred: TStringField;
    procedure btnEditClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm, uEditFormat;

{$R *.dfm}

procedure TfFormats.btnEditClick(Sender: TObject);
var
  Edit : TfEditFormat;
begin
  Edit := TfEditFormat.Create(nil);
  try
    tFormats.Edit;
    if Edit.ShowModal = mrOk then tFormats.Post
    else                          tFormats.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfFormats.btnOkClick(Sender: TObject);
begin
  Close
end;

procedure TfFormats.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; btnEditClick(nil); end;
      VK_ESCAPE : begin Key := 0; Close; end; 
    end;
end;

procedure TfFormats.FormCreate(Sender: TObject);
begin
// Добавляем
  tIngreds.First;
  while not tIngreds.Eof do
  begin
    if not tFormats.FindKey([tIngredsI_Code.Value]) then
    begin
      tFormats.Insert;
      tFormatsF_I_Code.Value := tIngredsI_Code.Value;
      tFormatsF_Header.Value := tIngredsI_Name.Value;
      tFormatsF_All.Value := 6;
      tFormatsF_Posle.Value := 3;
      tFormats.Post;
    end;
    tIngreds.Next;
  end;
// Удаляем
  tFormats.First;
  while not tFormats.Eof do
  begin
    if not tIngreds.FindKey([tFormatsF_I_Code.Value]) then
      tFormats.Delete
    else
      tFormats.Next;
  end;
  tFormats.IndexFieldNames := 'F_Code';
  tFormats.First;
end;

end.
