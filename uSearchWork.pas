unit uSearchWork;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Db, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TfSearchWork = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    Panel1: TPanel;
    grWorks: TDBGrid;
    tWorks: TTable;
    dsWorks: TDataSource;
    tWorksW_Code: TAutoIncField;
    tWorksW_A_Code: TIntegerField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    tArea: TTable;
    tAreaA_Code: TAutoIncField;
    tAreaA_Name: TStringField;
    tWorksArea: TStringField;
    Label1: TLabel;
    eWork: TEdit;
    tWorksW_Side: TIntegerField;
    tWorksW_K_Code: TIntegerField;
    tKNS: TTable;
    tWorksKNS: TStringField;
    tKNSK_Code: TAutoIncField;
    tKNSK_Name: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eWorkChange(Sender: TObject);
    procedure tWorksFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm;

{$R *.DFM}

procedure TfSearchWork.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfSearchWork.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfSearchWork.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN : begin Key := 0; ModalResult := mrOk;     end;
      VK_ESCAPE : begin Key := 0; ModalResult := mrCancel; end;
      VK_TAB    : begin Key := 0; if eWork.Focused then grWorks.SetFocus else eWork.SetFocus; end;
    end;
end;

procedure TfSearchWork.eWorkChange(Sender: TObject);
begin
  tWorks.Filtered := False;
  if Length(eWork.Text) > 0 then
    tWorks.Filtered := True;
end;

procedure TfSearchWork.tWorksFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := Pos(AnsiUpperCase(eWork.Text), AnsiUpperCase(tWorksW_ShortName.Value)) > 0;
end;

end.
