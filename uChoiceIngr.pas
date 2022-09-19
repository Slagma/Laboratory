unit uChoiceIngr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, DB, DBTables, Grids, DBGrids;

type
  TfChoiceIngr = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    dsIngreds: TDataSource;
    grIngreds: TDBGrid;
    tIngreds: TQuery;
    tIngredsI_Code: TIntegerField;
    tIngredsI_Name: TStringField;
    tIngredsI_Sorted: TIntegerField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm;

{$R *.dfm}

procedure TfChoiceIngr.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfChoiceIngr.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfChoiceIngr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk;     end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

end.
