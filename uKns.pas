unit uKns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Db, DBTables, Grids, DBGrids, Menus;

type
  TfKns = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    ToolButton2: TToolButton;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    DBGrid: TDBGrid;
    tKNS: TTable;
    dsKNS: TDataSource;
    tKNSK_Code: TAutoIncField;
    tKNSK_Name: TStringField;
    Popup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    tWorks: TTable;
    tWorksW_K_Code: TIntegerField;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDm, uEditKNS, uStrings;

{$R *.DFM}

procedure TfKns.btnOkClick(Sender: TObject);
begin
  Close
end;

procedure TfKns.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close;               end;
      VK_RETURN : begin Key := 0; btnEditClick(nil);   end;
      VK_INSERT : begin Key := 0; btnAddClick(nil);    end;
      VK_DELETE : begin Key := 0; btnDeleteClick(nil); end;
    end;
end;

procedure TfKns.btnAddClick(Sender: TObject);
var
  Add : TfEditKNS;
begin
  Add := TfEditKNS.Create(nil);
  try
    tKNS.Insert;
    if Add.ShowModal = mrOk then tKNS.Post
    else                         tKNS.Cancel;
  finally
    Add.Free;
  end;
end;

procedure TfKns.btnEditClick(Sender: TObject);
var
  Edit : TfEditKNS;
begin
  if tKNS.RecordCount = 0 then Exit;
  if tKNSK_Name.Value = '--- НЕ ЗАДАНО ---' then
  begin
    ShowMessage('Эта КНС не редактируется');
    Exit;
  end;
  Edit := TfEditKNS.Create(nil);
  try
    tKNS.Edit;
    if Edit.ShowModal = mrOk then tKNS.Post
    else                          tKNS.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfKns.btnDeleteClick(Sender: TObject);
begin
  if tKNS.RecordCount = 0 then Exit;
  if tKNSK_Name.Value = '--- НЕ ЗАДАНО ---' then
  begin
    ShowMessage('Эту КНС нельзя удалить');
    Exit;
  end;
  if Application.MessageBox(PChar(Format(sDelKNS, [tKNSK_Name.Value])), sDelKNSHdr, MB_YESNO+MB_ICONQUESTION) = ID_YES then
  begin
    tWorks.Open;
    try
      while not tWorks.Eof do
      begin
        if tWorksW_K_Code.Value = tKNSK_Code.Value then
          tWorksW_K_Code.Clear;
        tWorks.Next;
      end;
      tKNS.Delete;
    finally
      tWorks.Close;
    end;
  end;
end;

end.
