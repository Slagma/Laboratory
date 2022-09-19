unit uLetter1Params;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin;

type
  TfLetter1Params = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    eBoss: TEdit;
    Label3: TLabel;
    eDolgnost: TEdit;
    Label4: TLabel;
    ePhone: TEdit;
    Label5: TLabel;
    eAddress: TEdit;
    Label6: TLabel;
    eNumber: TEdit;
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    eText: TEdit;
    Label7: TLabel;
    eText2_2: TEdit;
    Label8: TLabel;
    ePost: TEdit;
    Label9: TLabel;
    eText2_1: TEdit;
    Label10: TLabel;
    eDate: TDateTimePicker;
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

uses uVars, uDm, EnFunctions;

{$R *.dfm}

procedure TfLetter1Params.btnOkClick(Sender: TObject);
begin
  SetTextLetter1('"'+eText.Text+'"');
  SetBossLetter(eBoss.Text);
  SetDolgnostLetter(eDolgnost.Text);
  SetPhoneLetter(ePhone.Text);
  SetAddressLetter(eAddress.Text);
  if StringIsNumber(eNumber.Text) then SetNumberLetter(StrToInt(eNumber.Text))
  else                                 SetNumberLetter(1);
  SetTextLetter2_1(eText2_1.Text);
  SetTextLetter2_2(eText2_2.Text);
  SetPost(ePost.Text);
  SetDateLetter(eDate.Date);
  ModalResult := mrOk;
end;

procedure TfLetter1Params.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfLetter1Params.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; btnOkClick(nil);         end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

procedure TfLetter1Params.FormCreate(Sender: TObject);
begin
  eText.Text     := GetTextLetter1;
  eBoss.Text     := GetBossLetter;
  eDolgnost.Text := GetDolgnostLetter;
  ePhone.Text    := GetPhoneLetter;
  eAddress.Text  := GetAddressLetter;
  eNumber.Text   := IntToStr(GetNumberLetter);
  eText2_1.Text  := GetTextLetter2_1;
  eText2_2.Text  := GetTextLetter2_2;
  ePost.Text     := GetPost;
  eDate.Date     := GetDateLetter;
end;

end.
