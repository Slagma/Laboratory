unit uChoiceMag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, DB, DBTables, Grids, DBGrids;

type
  TfChoiceMag = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsMagazins: TDataSource;
    dsMagsIngreds: TDataSource;
    tMagazins: TTable;
    tMagsIngreds: TTable;
    tMagazinsM_Code: TAutoIncField;
    tMagazinsM_Name: TStringField;
    tMagsIngredsMI_M_Code: TIntegerField;
    tMagsIngredsMI_I_Code: TIntegerField;
    tIngreds: TTable;
    tIngredsI_Code: TAutoIncField;
    tIngredsI_Name: TStringField;
    tIngredsI_Sorted: TIntegerField;
    tMagsIngredsIngreds: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm;

{$R *.dfm}

procedure TfChoiceMag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk;     end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

procedure TfChoiceMag.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfChoiceMag.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfChoiceMag.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
