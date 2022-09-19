unit uPeriodAct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables;

type
  TfPeriodAct = class(TForm)
    BeginAct: TEdit;
    EndAct: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    tAct: TTable;
    tActAC_Code: TAutoIncField;
    tActAC_Act: TFloatField;
    tActAC_Date: TDateField;
    tActAC_W_Code: TIntegerField;
    tActAC_Plan: TBooleanField;
    tActAC_Proba: TBooleanField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    F1, F2 : Double;
    { Public declarations }
  end;

var
  fPeriodAct: TfPeriodAct;

implementation

{$R *.dfm}

procedure TfPeriodAct.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; SpeedButton1Click(nil);  end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

procedure TfPeriodAct.SpeedButton1Click(Sender: TObject);
begin
  try
    F1 := StrToFloat(BeginAct.Text);
    F2 := StrToFloat(EndAct.Text);
    if F1 > F2 then
      ShowMessage('Начальный акт должен быть меньше конечного')
    else
      ModalResult := mrOk;
  except
    ShowMessage('Введены ошибочные данные');
  end;
end;

end.
