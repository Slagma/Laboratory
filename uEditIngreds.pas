unit uEditIngreds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, uVars, ExtCtrls, ComCtrls, ToolWin;

type
  TfEditIngreds = class(TForm)
    eName: TDBEdit;
    tIngreds: TTable;
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    function NotIngred : Boolean;
  public
    { Public declarations }
    WhatDo : TWhatDo;
    PrevIngred : String;
  end;

implementation

uses uIngreds, uStrings, uDm;

{$R *.DFM}

procedure TfEditIngreds.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; btnOkClick(nil);         end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

function TfEditIngreds.NotIngred: Boolean;
begin
  if WhatDo = wdInsert then
    Result := not tIngreds.FindKey([eName.Text])
  else if eName.Text = PrevIngred then
    Result := True
  else
    Result := not tIngreds.FindKey([eName.Text]);
end;

procedure TfEditIngreds.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfEditIngreds.btnOkClick(Sender: TObject);
begin
  if Length(eName.Text) = 0 then ShowMessage(erLengthIngred)
  else if not NotIngred     then ShowMessage(erIngred2)
  else                           ModalResult := mrOk;
end;

end.
