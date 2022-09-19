unit uChoiceArea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, Db, DBTables;

type
  TfChoiceArea = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    tAreas: TTable;
    dsAreas: TDataSource;
    DBGrid1: TDBGrid;
    tAreasA_Code: TAutoIncField;
    tAreasA_Name: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm;

{$R *.DFM}

procedure TfChoiceArea.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk; end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

procedure TfChoiceArea.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfChoiceArea.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
