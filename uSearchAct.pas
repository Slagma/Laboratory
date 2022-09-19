unit uSearchAct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfSearchAct = class(TForm)
    eAct: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CheckAct;
  public
    { Public declarations }
  end;

implementation

uses uStrings;

{$R *.DFM}

procedure TfSearchAct.CheckAct;
begin
  try
    StrToFloat(eAct.Text);
    ModalResult := mrOk;
  except
    ShowMessage(erNotValue);
  end;
end;

procedure TfSearchAct.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; CheckAct; end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

end.
