unit uEditAct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Db,
  DBTables, uVars;

type
  TfEditAct = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    eAct: TDBEdit;
    eDate: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnChoiceDate: TSpeedButton;
    ToolButton1: TToolButton;
    btnWork: TToolButton;
    eArea: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    tAct: TTable;
    tActAC_Act: TFloatField;
    tActAC_Code: TAutoIncField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnWorkClick(Sender: TObject);
    procedure btnChoiceDateClick(Sender: TObject);
  private
    { Private declarations }
    function CheckAct : Boolean;
  public
    { Public declarations }
    WhatDo : TWhatDo;
    ActCode : Integer;
  end;

implementation

uses uDm, uActs, uStrings, uChoiceDate, uSearchWork, uSearchAct;

{$R *.DFM}

procedure TfEditAct.btnOkClick(Sender: TObject);
begin
  if Length(eAct.Text) = 0 then
  begin
    ShowMessage(erLengthAct);
    Exit;
  end;
  if not CheckAct then
  begin
    ShowMessage(erIsAct);
    Exit;
  end;
  if Length(eArea.Text) = 0 then
  begin
    ShowMessage(erLengthWork);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfEditAct.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfEditAct.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; btnOkClick(nil); end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
      VK_SPACE  : begin Key := 0; if eDate.Focused then btnChoiceDateClick(nil); end;
      VK_F7     : begin Key := 0; btnChoiceDateClick(nil); end;
      VK_F8     : begin Key := 0; btnWorkClick(nil); end;
    end;
end;

procedure TfEditAct.btnWorkClick(Sender: TObject);
var
  Choice : TfSearchWork;
begin
  Choice := TfSearchWork.Create(nil);
  try
    if Choice.ShowModal = mrOk then eAct.DataSource.DataSet.FieldByName('AC_W_Code').Value := Choice.tWorksW_Code.Value;
  finally
    Choice.Free;
  end;
end;

procedure TfEditAct.btnChoiceDateClick(Sender: TObject);
var
  Choice : TfChoiceDate;
begin
  Choice := TfChoiceDate.Create(nil);
  try
    Choice.Calendar.Date := StrToDate(eDate.Text);
    if Choice.ShowModal = mrOk then eDate.Text := DateToStr(Choice.Calendar.Date);
  finally
    Choice.Free;
  end;
end;

function TfEditAct.CheckAct: Boolean;
begin
  Result := False;
  case WhatDo of
    wdInsert : Result := not tAct.FindKey([StrToFloat(eAct.Text)]);
    wdEdit :
      begin
        if not tAct.FindKey([StrToFloat(eAct.Text)]) then
          Result := True
        else if tActAC_Code.Value = ActCode then
          Result := True
        else
          Result := False;
      end;
  end;
end;

end.
