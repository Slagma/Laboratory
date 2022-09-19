unit uChoiceAct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, DB, DBTables;

type
  TfChoiceAct = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    dsWorks: TDataSource;
    dsActs: TDataSource;
    tWorks: TTable;
    tActs: TTable;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    tActsAC_Code: TAutoIncField;
    tActsAC_Act: TFloatField;
    tActsAC_Date: TDateField;
    tActsAC_W_Code: TIntegerField;
    tActsAC_Plan: TBooleanField;
    tActsAC_Proba: TBooleanField;
    tWorksW_Code: TAutoIncField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm;

{$R *.dfm}

procedure TfChoiceAct.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfChoiceAct.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfChoiceAct.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk;     end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
    end;
end;

end.
