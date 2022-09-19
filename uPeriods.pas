unit uPeriods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, DBTables;

type
  TfPeriods = class(TForm)
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    tActs: TTable;
    tActsAC_Code: TAutoIncField;
    tActsAC_Act: TFloatField;
    tActsAC_Date: TDateField;
    tActsAC_W_Code: TIntegerField;
    tActsAC_Plan: TBooleanField;
    tActsAC_Proba: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPeriods: TfPeriods;

implementation

{$R *.dfm}

procedure TfPeriods.FormCreate(Sender: TObject);
begin
  Date1.Date := Date;
  Date2.Date := Date;
end;

procedure TfPeriods.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfPeriods.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk;     end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

end.
