unit uMegaWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, ComCtrls,
  ToolWin, DB, DBTables, Menus;

type
  TfMegaWork = class(TForm)
    ToolBar1: TToolBar;
    btnClose: TToolButton;
    ToolButton2: TToolButton;
    btnInsert: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    grMega: TDBGrid;
    grWorks: TDBGrid;
    grVipusks: TDBGrid;
    Panel3: TPanel;
    DBEdit1: TDBEdit;
    Panel4: TPanel;
    tMega: TTable;
    tWorks: TTable;
    tVipusks: TTable;
    dsMega: TDataSource;
    dsWorks: TDataSource;
    dsVipusks: TDataSource;
    tMegaMW_Code: TAutoIncField;
    tMegaMW_Name: TStringField;
    tMegaMW_Address: TStringField;
    tVipusksW_Code: TAutoIncField;
    tVipusksW_A_Code: TIntegerField;
    tVipusksW_ShortName: TStringField;
    tVipusksW_Otbor: TStringField;
    tVipusksW_Address: TStringField;
    tVipusksW_FullName: TStringField;
    tVipusksW_Label: TBooleanField;
    tVipusksW_Side: TIntegerField;
    tVipusksW_K_Code: TIntegerField;
    tVipusksW_OldCode: TFloatField;
    tVipusksW_Filial: TStringField;
    tVipusksW_MW_Code: TIntegerField;
    tWorksW_Code: TAutoIncField;
    tWorksW_A_Code: TIntegerField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    tWorksW_Address: TStringField;
    tWorksW_FullName: TStringField;
    tWorksW_Label: TBooleanField;
    tWorksW_Side: TIntegerField;
    tWorksW_K_Code: TIntegerField;
    tWorksW_OldCode: TFloatField;
    tWorksW_Filial: TStringField;
    tWorksW_MW_Code: TIntegerField;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    eAddress: TDBEdit;
    eFilial: TDBEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    eSrchMega: TEdit;
    eSrchWorks: TEdit;
    tMegaSearch: TTable;
    tMegaSearchMW_Code: TAutoIncField;
    tMegaSearchMW_Name: TStringField;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ToolButton1: TToolButton;
    btnLetter: TToolButton;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure tWorksFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure eSrchWorksChange(Sender: TObject);
    procedure tMegaFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure eSrchMegaChange(Sender: TObject);
    procedure btnLetterClick(Sender: TObject);
    procedure grWorksDblClick(Sender: TObject);
    procedure grVipusksDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uStrings, uDm, uNewMega, uDoLetter;

{$R *.dfm}

procedure TfMegaWork.FormCreate(Sender: TObject);
begin
  Caption := sMegaCaption;
end;

procedure TfMegaWork.btnCloseClick(Sender: TObject);
begin
  if tWorks.State = dsEdit then tWorks.Post;
  ModalResult := mrOk;
end;

procedure TfMegaWork.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_F2 : begin Key := 0; btnLetterClick(nil); end;
      VK_ESCAPE :
        begin
          Key := 0;
          if tWorks.State = dsEdit then tWorks.Post;
          ModalResult := mrOk;
        end;
      VK_INSERT :
        begin
          if grMega.Focused then
          begin
            Key := 0;
            btnInsertClick(nil);
          end;
        end;
      VK_DELETE :
        begin
          if grMega.Focused then
          begin
            Key := 0;
            btnDeleteClick(nil);
          end;
        end;
      VK_RETURN : begin Key := 0; btnEditClick(nil);   end;
      VK_TAB    :
        begin
          Key := 0;
          if not eFilial.Focused and (tWorks.State = dsEdit) then
            tWorks.Post;
          if GrMega.Focused then grWorks.SetFocus
          else if grWorks.Focused then grVipusks.SetFocus
          else grMega.SetFocus;
        end;
      VK_SPACE :
        begin
          if grWorks.Focused then
          begin
            Key := 0;
            grWorksDblClick(nil);
          end;
          if grVipusks.Focused then
          begin
            Key := 0;
            grVipusksDblClick(nil);
          end;
        end;
    end;
end;

procedure TfMegaWork.btnInsertClick(Sender: TObject);
var
  NewMega : TfNewMega;
begin
  NewMega := TfNewMega.Create(nil);
  try
    NewMega.Caption := sNewMega;
    tMega.Insert;
    tMegaMW_Name.Value := tWorksW_ShortName.Value;
    tMegaMW_Address.Value := tWorksW_Address.Value;
    if NewMega.ShowModal = mrOk then tMega.Post
    else                             tMega.Cancel;
  finally
    NewMega.Free;
  end;
end;

procedure TfMegaWork.btnEditClick(Sender: TObject);
var
  EditMega : TfNewMega;
begin
  if tMega.RecordCount = 0 then Exit;
  EditMega := TfNewMega.Create(nil);
  try
    EditMega.Caption := sEditMega;
    tMega.Edit;
    if EditMega.ShowModal = mrOk then tMega.Post
    else                              tMega.Cancel;
  finally
    EditMega.Free;
  end;
end;

procedure TfMegaWork.btnDeleteClick(Sender: TObject);
begin
  if tMega.RecordCount = 0 then Exit;
  if (Application.MessageBox(PChar('Удалить "мегапредприятие" ('+tMegaMW_Name.Value+')?'), 'Удаление "мегапредприятия"', MB_YESNO+MB_ICONQUESTION) = ID_YES) then
  begin
    tVipusks.First;
    while not tVipusks.Eof do
    begin
      tVipusks.Edit;
      tVipusksW_MW_Code.Clear;
      tVipusks.Post;
    end;
    tMega.Delete;
    tWorks.Refresh;
  end;
end;

procedure TfMegaWork.tWorksFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := Pos(AnsiUpperCase(eSrchWorks.Text), AnsiUpperCase(tWorksW_ShortName.Value)) > 0;
end;

procedure TfMegaWork.eSrchWorksChange(Sender: TObject);
begin
  tWorks.Filtered := False;
  if Length(eSrchWorks.Text) > 0 then
    tWorks.Filtered := True;
end;

procedure TfMegaWork.tMegaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := Pos(AnsiUpperCase(eSrchMega.Text), AnsiUpperCase(tMegaMW_Name.Value)) > 0;
end;

procedure TfMegaWork.eSrchMegaChange(Sender: TObject);
begin
  tMega.Filtered := False;
  if Length(eSrchMega.Text) > 0 then
    tMega.Filtered := True;
end;

procedure TfMegaWork.btnLetterClick(Sender: TObject);
var
  Letter : TfDoLetter;
begin
  if tMega.RecordCount = 0 then
    Exit;
  Letter := TfDoLetter.Create(nil);
  try
    Letter.MegaWorkCode := tMegaMW_Code.Value;
    Letter.Prepare;
    Letter.ShowModal;
  finally
    Letter.Free;
  end;
end;

procedure TfMegaWork.grWorksDblClick(Sender: TObject);
begin
  if tMega.RecordCount > 0 then
  begin
    if tWorksW_MW_Code.IsNull then
    begin
      tWorks.Edit;
      tWorksW_MW_Code.Value := tMegaMW_Code.Value;
      tWorks.Post;
      tVipusks.Refresh;
    end
    else
    begin
      if tMegaMW_Code.Value <> tWorksW_MW_Code.Value then
      begin
        tMegaSearch.Open;
        tMegaSearch.FindKey([tWorksW_MW_Code.Value]);
        ShowMessage('Это предприятие уже принадлежит другому "мегапредприятию": ('+tMegaSearchMW_Name.Value+')');
        tMegaSearch.Close;
      end;
    end;
  end;
end;

procedure TfMegaWork.grVipusksDblClick(Sender: TObject);
begin
  if tVipusks.RecordCount > 0 then
  begin
    tVipusks.Edit;
    tVipusksW_MW_Code.Clear;
    tVipusks.Post;
    tWorks.Refresh;
  end;
end;

end.
