unit uAddIngr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, Db, DBTables;

type
  TfAddIngr = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    DBGrid1: TDBGrid;
    tIngrs: TQuery;
    dsIngrs: TDataSource;
    tIngrsI_code: TIntegerField;
    tIngrsi_name: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm;

{$R *.DFM}

procedure TfAddIngr.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfAddIngr.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfAddIngr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk;     end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

procedure TfAddIngr.FormCreate(Sender: TObject);
begin
  tIngrs.Open;
end;

end.
