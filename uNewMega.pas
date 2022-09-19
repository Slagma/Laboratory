unit uNewMega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin;

type
  TfNewMega = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
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

uses uStrings, uMegaWork, uDm;

{$R *.dfm}

procedure TfNewMega.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk;     end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

procedure TfNewMega.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfNewMega.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
