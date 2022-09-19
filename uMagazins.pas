unit uMagazins;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, Db, DBTables, Menus;

type
  TfMagazins = class(TForm)
    ToolBar1: TToolBar;
    btnClose: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    btnAddMag: TToolButton;
    btnEditMag: TToolButton;
    btnDelMag: TToolButton;
    btnAddIngr: TToolButton;
    btnDelIngr: TToolButton;
    grMags: TDBGrid;
    grIngrs: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    tMags: TTable;
    dsMags: TDataSource;
    MenuMag: TPopupMenu;
    MenuIngr: TPopupMenu;
    iAddMag: TMenuItem;
    iEditMag: TMenuItem;
    iDelMag: TMenuItem;
    N4: TMenuItem;
    iCloseMag: TMenuItem;
    iAddIngr: TMenuItem;
    iDelIngr: TMenuItem;
    N3: TMenuItem;
    iCloseIngr: TMenuItem;
    tMagsM_Code: TAutoIncField;
    tMagsM_Name: TStringField;
    tIngrs: TQuery;
    dsIngrs: TDataSource;
    tIngrsI_code: TIntegerField;
    tIngrsi_name: TStringField;
    tMI: TTable;
    tMIMI_M_Code: TIntegerField;
    tMIMI_I_Code: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddMagClick(Sender: TObject);
    procedure btnEditMagClick(Sender: TObject);
    procedure btnDelMagClick(Sender: TObject);
    procedure btnAddIngrClick(Sender: TObject);
    procedure btnDelIngrClick(Sender: TObject);
    procedure grMagsCellClick(Column: TColumn);
    procedure grMagsEnter(Sender: TObject);
    procedure grMagsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ReopenIngr;
  public
    { Public declarations }
  end;

implementation

uses uDm, uAddMag, uStrings, uAddIngr;

{$R *.DFM}

procedure TfMagazins.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close; end;
      VK_INSERT : begin Key := 0; if grMags.Focused then btnAddMagClick(nil) else btnAddIngrClick(nil); end;
      VK_RETURN : begin Key := 0; if grMags.Focused then btnEditMagClick(nil); end;
      VK_DELETE : begin Key := 0; if grMags.Focused then btnDelMagClick(nil) else btnDelIngrClick(nil); end;
      VK_TAB    : begin Key := 0; if grMags.Focused then grIngrs.SetFocus else grMags.SetFocus; end;
    end;
end;

procedure TfMagazins.btnCloseClick(Sender: TObject);
begin
  Close
end;

procedure TfMagazins.btnAddMagClick(Sender: TObject);
var
  Add : TfAddMag;
begin
  Add := TfAddMag.create(nil);
  try
    tMags.Insert;
    tMagsM_Name.Value := Format(sNewMag, [tMags.RecordCount+1]); 
    if Add.ShowModal = mrOk then tMags.Post
    else                         tMags.Cancel;
  finally
    Add.Free;
  end;
end;

procedure TfMagazins.btnEditMagClick(Sender: TObject);
var
  Edit : TfAddMag;
begin
  Edit := TfAddMag.Create(nil);
  try
    tMags.Edit;
    Edit.Caption := sEditMag;
    if Edit.ShowModal = mrOk then tMags.Post
    else                          tMags.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfMagazins.btnDelMagClick(Sender: TObject);
begin
  if tMags.RecordCount = 0 then Exit;
  if (Application.MessageBox(PChar(Format(sDelMag, [tMagsM_Name.Value])), sDelMagCap, MB_YESNO+MB_ICONQUESTION) = ID_YES) then
  begin
    tMi.Open;
    tMI.SetRange([tMagsM_Code.Value], [tMagsM_Code.Value]);
    while tMI.RecordCount > 0 do
      tMI.Delete;
    tMags.Delete;
    tMI.CancelRange;
    tMI.Close;
    ReopenIngr;
  end;
end;

procedure TfMagazins.btnAddIngrClick(Sender: TObject);
var
  Add : TfAddIngr;
begin
  if tMags.RecordCount = 0 then Exit;
  Add := TfAddIngr.Create(nil);
  try
    Add.Caption := Format(sAddIngrInMag, [tMagsM_Name.Value]);
    if (Add.ShowModal = mrOk) and (Add.tIngrs.RecordCount > 0) then
    begin
      tMI.Open;
      tMI.Insert;
      tMIMI_M_Code.Value := tMagsM_Code.Value;
      tMIMI_I_Code.Value := Add.tIngrsI_Code.Value;
      tMI.Post;
      tMI.Close;
      ReopenIngr;
    end;
  finally
    Add.Free;
  end;
end;

procedure TfMagazins.btnDelIngrClick(Sender: TObject);
begin
  if (tIngrs.Active) and (tIngrs.RecordCount = 0) then Exit;
  if (Application.MessageBox(PChar(Format(sDelIngr, [tIngrsI_Name.Value, tMagsM_Name.Value])), sDelIngrCap, MB_YESNO+MB_ICONQUESTION) = ID_YES) then
  begin
    tMI.Open;
    if tMI.FindKey([tMagsM_Code.Value, tIngrsI_Code.Value]) then
      tMI.Delete;
    tMI.Close;
    ReopenIngr;
  end;
end;

procedure TfMagazins.grMagsCellClick(Column: TColumn);
begin
  ReopenIngr;
end;

procedure TfMagazins.ReopenIngr;
begin
  if tMags.RecordCount = 0 then Exit;
  tIngrs.Close;
  tIngrs.ParamByName('MyMag').Value := tMagsM_Code.Value;
  tIngrs.Open;
end;

procedure TfMagazins.grMagsEnter(Sender: TObject);
begin
  ReopenIngr;
end;

procedure TfMagazins.grMagsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ReopenIngr;
end;

end.
