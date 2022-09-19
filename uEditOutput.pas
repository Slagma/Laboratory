unit uEditOutput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls;

type
  TfEditOutput = class(TForm)
    DBRadioGroup1: TDBRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uNorms;

{$R *.dfm}

procedure TfEditOutput.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk; end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

end.
