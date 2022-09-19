unit uEditWork;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, uVars, Db,
  DBTables;

type
  TfEditWork = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eShortName: TDBEdit;
    eOtbor: TDBEdit;
    eFullName: TDBEdit;
    eAddress: TDBEdit;
    Label5: TLabel;
    eArea: TEdit;
    btnChangeArea: TSpeedButton;
    tAreas: TTable;
    tAreasA_Code: TAutoIncField;
    tAreasA_Name: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    KNS: TLabel;
    eKNS: TEdit;
    btnChangeKNS: TSpeedButton;
    tKNS: TTable;
    tKNSK_Code: TAutoIncField;
    tKNSK_Name: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnChangeAreaClick(Sender: TObject);
    procedure btnChangeKNSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WhatDo : TWhatDo;
  end;

implementation

uses uDm, uWorks, uStrings, uChoiceArea, uChoiceKNS;

{$R *.DFM}

procedure TfEditWork.btnOkClick(Sender: TObject);
begin
  if Length(eShortName.Text) = 0 then
  begin
    ShowMessage(erShortLength);
    Exit;
  end;
  if Length(eOtbor.Text) = 0 then
  begin
    ShowMessage(erOtborLength);
    Exit;
  end;
  tAreas.FindKey([eArea.Text]);
  tKNS.FindKey([eKNS.Text]);
  ModalResult := mrOk;
end;

procedure TfEditWork.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfEditWork.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; btnOkClick(nil); end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
      VK_F8 : begin Key := 0; if WhatDo = wdEdit then btnChangeAreaClick(nil); end;
      VK_F9 : begin Key := 0; if WhatDo = wdEdit then btnChangeKNSClick(nil);  end;
    end;
end;

procedure TfEditWork.btnChangeAreaClick(Sender: TObject);
var
  Choice : TfChoiceArea;
begin
  Choice := TfChoiceArea.Create(nil);
  try
    if Choice.ShowModal = mrOk then
      eArea.Text := Choice.tAreasA_Name.Value;
  finally
    Choice.Free;
  end;
end;

procedure TfEditWork.btnChangeKNSClick(Sender: TObject);
var
  KNS : TfChoiceKNS;
begin
  KNS := TfChoiceKNS.Create(nil);
  try
    if KNS.ShowModal = mrOk then
      eKNS.Text := KNS.tKNSK_Name.Value;
  finally
    KNS.Free;
  end;
end;

end.
