unit uEditArea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, Mask, DBCtrls, Db, DBTables, uVars;

type
  TfEditArea = class(TForm)
    eName: TDBEdit;
    tAreas: TTable;
    tAreasA_Name: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function NotArea : Boolean;
  public
    { Public declarations }
    WhatDo : TWhatDo;
    PrevArea : String;
  end;

implementation

uses uAreas, uStrings;

{$R *.DFM}

procedure TfEditArea.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN :
        begin
          Key := 0;
          if Length(eName.Text) = 0 then ShowMessage(erLengthArea)
          else if not NotArea       then ShowMessage(erArea2)
          else                           ModalResult := mrOk;
        end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

function TfEditArea.NotArea : Boolean;
begin
  if WhatDo = wdInsert then
    Result := not tAreas.FindKey([eName.Text])
  else if eName.Text = PrevArea then
    Result := True
  else
    Result := not tAreas.FindKey([eName.Text]);
end;

end.
