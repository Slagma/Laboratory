unit uWorks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Db, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls,
  Mask, DBCtrls, Menus, Buttons;

type
  TEnOrder = (eoArea, eoSide, eoKNS, eoSideKNS);

  TfWorks = class(TForm)
    ToolBar1: TToolBar;
    btnClose: TToolButton;
    tWorks: TTable;
    dsWorks: TDataSource;
    tWorksW_Code: TAutoIncField;
    tWorksW_A_Code: TIntegerField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    tWorksW_Address: TStringField;
    tWorksW_FullName: TStringField;
    grWorks: TDBGrid;
    Panel1: TPanel;
    tAreas: TTable;
    Panel2: TPanel;
    lbl1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    tAreasA_Code: TAutoIncField;
    tAreasA_Name: TStringField;
    ToolButton1: TToolButton;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    ToolButton5: TToolButton;
    btnSearch: TToolButton;
    btnLabel: TToolButton;
    ToolButton2: TToolButton;
    btnSostav: TToolButton;
    btnPrintLabel: TToolButton;
    btnPrintMonth: TToolButton;
    tWorksW_Label: TBooleanField;
    Menu: TPopupMenu;
    iAdd: TMenuItem;
    iEdit: TMenuItem;
    iDel: TMenuItem;
    iLabel: TMenuItem;
    iSostav: TMenuItem;
    N6: TMenuItem;
    iSearch: TMenuItem;
    N8: TMenuItem;
    iPrintLabel: TMenuItem;
    iPrintMonth: TMenuItem;
    N11: TMenuItem;
    iClose: TMenuItem;
    N13: TMenuItem;
    Edit1: TEdit;
    btnChoice1: TSpeedButton;
    tWorksW_Side: TIntegerField;
    tWorksW_K_Code: TIntegerField;
    btnOrder: TToolButton;
    ToolButton4: TToolButton;
    PopupMenu: TPopupMenu;
    iArea: TMenuItem;
    iSide: TMenuItem;
    iKNS: TMenuItem;
    iSideKNS: TMenuItem;
    lbl2: TLabel;
    Edit2: TEdit;
    btnKNS: TSpeedButton;
    tKNS: TTable;
    tKNSK_Code: TAutoIncField;
    tKNSK_Name: TStringField;
    tWorksArea: TStringField;
    tWorksKNS: TStringField;
    PrintMenu: TPopupMenu;
    F41: TMenuItem;
    N1: TMenuItem;
    ToolButton3: TToolButton;
    btnMega: TToolButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnLabelClick(Sender: TObject);
    procedure grWorksDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSostavClick(Sender: TObject);
    procedure btnPrintLabelClick(Sender: TObject);
    procedure btnPrintMonthClick(Sender: TObject);
    procedure btnChoice1Click(Sender: TObject);
    procedure iSideClick(Sender: TObject);
    procedure iAreaClick(Sender: TObject);
    procedure iKNSClick(Sender: TObject);
    procedure iSideKNSClick(Sender: TObject);
    procedure btnOrderClick(Sender: TObject);
    procedure btnKNSClick(Sender: TObject);
    procedure F41Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnMegaClick(Sender: TObject);
  private
    { Private declarations }
    CurAreaCode : Integer;
    fOrder : TEnOrder;
    procedure SetOrder(const Value : TEnOrder);
    procedure ChangeArea;
    procedure ChangeSide;
    procedure ChangeKNS;
    procedure ChangeSideKNS;
  public
    { Public declarations }
    property Order : TEnOrder read fOrder write SetOrder;
  end;

implementation

uses uDm, uEditWork, uVars, uStrings, uSearchWork, uChoiceArea, uChoiceKNS,
  uPrintSostav, uPrintYear, uPrintMonth, uPeriods, uWait, uPrintAct,
  uPeriodAct, uMegaWork;

{$R *.DFM}

procedure TfWorks.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close;                   end;
      VK_INSERT : begin Key := 0; btnAddClick(nil);        end;
      VK_RETURN : begin Key := 0; btnEditClick(nil);       end;
      VK_DELETE : begin Key := 0; btnDeleteClick(nil);     end;
      VK_SPACE  : begin Key := 0; btnLabelClick(nil);      end;
      VK_F4     : begin Key := 0; btnPrintMonthClick(nil); end;
      VK_F5     : begin Key := 0; btnSostavClick(nil);     end;
      VK_F7     : begin Key := 0; btnSearchClick(nil);     end;
      VK_F8     : begin Key := 0; btnChoice1Click(nil);    end;
      VK_F9     : begin Key := 0; btnOrderClick(nil);      end;
      VK_F10    : begin Key := 0; btnMegaClick(nil);       end;
    end;
end;

procedure TfWorks.btnCloseClick(Sender: TObject);
begin
  Close
end;

procedure TfWorks.FormCreate(Sender: TObject);
var
  MyCursor : TCursor;
begin
  MyCursor := Screen.Cursor;
  try
    fOrder := eoArea;
    Screen.Cursor := crHourGlass;
    tWorks.First;
    while not tWorks.Eof do
    begin
      if tWorksW_Label.Value then
      begin
        tWorks.Edit;
        tWorksW_Label.Value := False;
        tWorks.Post;
      end;
      tWorks.Next;
    end;
    tAreas.First;
    Edit1.Text := tAreasA_Name.Value;
    ChangeArea;
   finally
    Screen.Cursor := MyCursor;
  end;
end;

procedure TfWorks.btnAddClick(Sender: TObject);
var
  Add : TfEditWork;
begin
  Add := TfEditWork.Create(nil);
  try
//    Add.Height := 191;
//    Add.WhatDo := wdInsert;
    tWorks.Insert;
    tWorksW_A_Code.Value := tAreasA_Code.Value;
    tWorksW_K_Code.Value := tKNSK_Code.Value;
    tWorksW_Side.Value := 1;
    Add.eArea.Text := tWorksArea.Value;
    Add.eKNS.Text := tWorksKNS.Value;
    if Add.ShowModal = mrOk then
    begin
      tWorksW_A_Code.Value := Add.tAreasA_Code.Value;
      tWorksW_K_Code.Value := Add.tKNSK_Code.Value;
      tWorks.Post;
    end
    else
      tWorks.Cancel;
  finally
    Add.Free;
  end;
end;

procedure TfWorks.btnEditClick(Sender: TObject);
var
  Edit : TfEditWork;
begin
  if tWorks.RecordCount = 0 then Exit;
  Edit := TfEditWork.Create(nil);
  try
    Edit.Caption := sEditWork;
    Edit.eArea.Text := tWorksArea.Value;
    Edit.eKNS.Text := tWorksKNS.Value;
    Edit.WhatDo := wdEdit;
    tWorks.Edit;
    if Edit.ShowModal = mrOk then
    begin
      tWorksW_A_Code.Value := Edit.tAreasA_Code.Value;
      tWorksW_K_Code.Value := Edit.tKNSK_Code.Value;
      tWorks.Post;
    end
    else
      tWorks.Cancel;
  finally
    Edit.Free;
  end;
end;

procedure TfWorks.btnDeleteClick(Sender: TObject);
begin
  if tWorks.RecordCount = 0 then Exit;
  if Application.MessageBox(sDelWork, sDelWorkCap, MB_YESNO+MB_ICONQUESTION) = ID_YES then
    tWorks.Delete;
end;

procedure TfWorks.btnLabelClick(Sender: TObject);
begin
  if tWorks.RecordCount = 0 then Exit;
  tWorks.Edit;
  tWorksW_Label.Value := not tWorksW_Label.Value;
  tWorks.Post;
end;

procedure TfWorks.grWorksDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with grWorks.Canvas do
  begin
    if tWorksW_Label.Value then
    begin
      Brush.Color := clRed; Font.Style := [fsBold];
    end;
    FillRect(Rect);
    TextOut(Rect.Left+2, Rect.Top, Column.Field.Text);
  end;
end;

procedure TfWorks.btnSearchClick(Sender: TObject);
var
  Search : TfSearchWork;
begin
  Search := TfSearchWork.Create(nil);
  try
    if Search.ShowModal = mrOk then
    begin
      tWorks.CancelRange;
      case Order of
        eoArea :
          begin
            tWorks.IndexFieldNames := 'W_A_Code;W_ShortName;W_Otbor';
            tAreas.FindKey([Search.tWorksArea.Value]);
            Edit1.Text := tAreasA_Name.Value;
            ChangeArea;
            tWorks.FindKey([Search.tWorksW_A_Code.Value, Search.tWorksW_ShortName.Value, Search.tWorksW_Otbor.Value]);
            tAreas.FindKey([tWorksArea.Value]);
          end;
        eoSide    :
          begin
            tWorks.IndexFieldNames := 'W_Side;W_ShortName;W_Otbor';
            if Search.tWorksW_Side.Value = 1 then Edit1.Text := 'Правый'
            else                                  Edit1.Text := 'Левый';
            ChangeSide;
            tWorks.FindKey([Search.tWorksW_Side.Value, Search.tWorksW_ShortName.Value, Search.tWorksW_Otbor.Value]);
            tAreas.FindKey([tWorksArea.Value]);
          end;
        eoKNS     :
          begin
            tWorks.IndexFieldNames := 'W_K_Code;W_ShortName;W_Otbor';
            tKNS.FindKey([Search.tWorksKNS.Value]);
            Edit1.Text := tKNSK_Name.Value;
            ChangeKNS;
            tWorks.FindKey([Search.tWorksW_K_Code.Value, Search.tWorksW_ShortName.Value, Search.tWorksW_Otbor.Value]);
            tAreas.FindKey([tWorksArea.Value]);
          end;
        eoSideKNS :
          begin
            tWorks.IndexFieldNames := 'W_Side;W_K_Code;W_ShortName;W_Otbor';
            tKNS.FindKey([Search.tWorksKNS.Value]);
            Edit2.Text := tKNSK_Name.Value;
            if Search.tWorksW_Side.Value = 1 then Edit1.Text := 'Правый'
            else                                  Edit1.Text := 'Левый';
            ChangeSideKNS;
            tWorks.FindKey([Search.tWorksW_Side.Value, Search.tWorksW_K_Code.Value, Search.tWorksW_ShortName.Value, Search.tWorksW_Otbor.Value]);
            tAreas.FindKey([tWorksArea.Value]);
          end;
      end;
    end;
  finally
    Search.Free;
  end;
end;

procedure TfWorks.btnSostavClick(Sender: TObject);
var
  Print : TfPrintSostav;
begin
  if tWorks.RecordCount = 0 then Exit;
  Print := TfPrintSostav.Create(nil);
  try
    Print.DoPrint(tWorksW_Code.Value);
  finally
    Print.Free;
  end;
end;

procedure TfWorks.btnPrintLabelClick(Sender: TObject);
var
  Print : TfPrintYear;
  MyCursor : TCursor;
begin
  if tWorks.RecordCount = 0 then Exit;
  Print := TfPrintYear.Create(nil);
  MyCursor := Screen.Cursor;
  if iArea.Checked then
    Print.MyGroup := 'Район : '+Edit1.Text
  else if iSide.Checked then
    Print.MyGroup := 'Берег : '+Edit1.Text
  else if iKNS.Checked then
    Print.MyGroup := 'КНС : '+Edit1.Text
  else  // iSideKNS
    Print.MyGroup := 'Берег : '+Edit1.Text+'; КНС : '+Edit2.Text;
  try
    Screen.Cursor := crSQLWait;
    Print.BeginWork;
    tWorks.First;
    while not tWorks.Eof do
    begin
      if (not tWorksW_Label.IsNull) and tWorksW_Label.Value then
        Print.DoPrint(tWorksW_Code.Value);
      tWorks.Next;
    end;
    Print.EndWork;
  finally
    Print.Free;
    Screen.Cursor := MyCursor;
  end;
end;

procedure TfWorks.btnPrintMonthClick(Sender: TObject);
begin
  btnPrintMonth.CheckMenuDropdown
end;

procedure TfWorks.btnChoice1Click(Sender: TObject);
var
  Choice : TfChoiceArea;
  KNS : TfChoiceKNS;
begin
  case Order of
    eoArea :
      begin
        Choice := TfChoiceArea.Create(nil);
        try
          Choice.tAreas.FindKey([Edit1.Text]);
          if Choice.ShowModal = mrOk then
          begin
            Edit1.Text := Choice.tAreasA_Name.Value;
            ChangeArea;
          end;
        finally
          Choice.Free;
        end;
      end;
    eoSide :
      begin
        if Edit1.Text = 'Правый' then Edit1.Text := 'Левый'
        else                          Edit1.Text := 'Правый';
        ChangeSide;
      end;
    eoKNS :
      begin
        KNS := TfChoiceKNS.Create(nil);
        try
          KNS.tKNS.FindKey([tKnsK_Name.Value]);
          if KNS.ShowModal = mrOK then
          begin
            tKNS.FindKey([KNS.tKNSK_Name.Value]);
            Edit1.Text := KNS.tKNSK_Name.Value;
            ChangeKNS;
          end;
        finally
          KNS.Free;
        end;
      end;
    eoSideKNS :
      begin
        if Edit1.Text = 'Правый' then Edit1.Text := 'Левый'
        else                          Edit1.Text := 'Правый';
        ChangeSideKNS;
      end;
  end;
end;

procedure TfWorks.iSideClick(Sender: TObject);
begin
  iSide.Checked := True;
  Order := eoSide;
end;

procedure TfWorks.iAreaClick(Sender: TObject);
begin
  iArea.Checked := True;
  Order := eoArea;
end;

procedure TfWorks.iKNSClick(Sender: TObject);
begin
  iKNS.Checked := True;
  Order := eoKNS;
end;

procedure TfWorks.iSideKNSClick(Sender: TObject);
begin
  iSideKNS.Checked := True;
  Order := eoSideKNS;
end;

procedure TfWorks.SetOrder(const Value: TEnOrder);
begin
  fOrder := Value;
  case Value of
    eoArea :
      begin
        lbl2.Visible := False;
        Edit2.Visible := False;
        btnKNS.Visible := False;
        lbl1.Caption := 'Район:';
        btnChoice1.Hint := 'Выбрать район (F8)';
        tWorks.IndexFieldNames := 'W_A_Code;W_ShortName;W_Otbor';
        Edit1.Text := tAreasA_Name.Value;
        ChangeArea;
      end;
    eoSide :
      begin
        lbl2.Visible := False;
        Edit2.Visible := False;
        btnKNS.Visible := False;
        lbl1.Caption := 'Берег:';
        Edit1.Text := 'Правый';
        btnChoice1.Hint := 'Выбрать берег (F8)';
        tWorks.IndexFieldNames := 'W_Side;W_ShortName;W_Otbor';
        ChangeSide;
      end;
    eoKNS :
      begin
        lbl2.Visible := False;
        Edit2.Visible := False;
        btnKNS.Visible := False;
        lbl1.Caption := 'КНС:';
        btnChoice1.Hint := 'Выбрать КНС (F8)';
        tWorks.IndexFieldNames := 'W_K_Code;W_ShortName;W_Otbor';
        Edit1.Text := tKNSK_Name.Value;
        ChangeKNS;
      end;
    eoSideKns :
      begin
        lbl2.Visible := False;
        Edit2.Visible := False;
        btnKNS.Visible := True;
        lbl1.Caption := 'Берег:';
        lbl2.Visible := True;
        Edit2.Visible := True;
        btnChoice1.Hint := 'Выбрать берег (F8)';
        Edit1.Text := 'Правый';
        Edit2.Text := tKNSK_Name.Value;
        tWorks.IndexFieldNames := 'W_Side;W_K_Code;W_ShortName;W_Otbor';
        ChangeSideKNS;
      end;
  end;
end;

procedure TfWorks.btnOrderClick(Sender: TObject);
begin
  btnOrder.CheckMenuDropdown
end;

procedure TfWorks.ChangeSide;
begin
  tWorks.CancelRange;
  if Edit1.Text = 'Правый' then tWorks.SetRange([1], [1])
  else                          tWorks.SetRange([0], [0]);
end;

procedure TfWorks.ChangeArea;
begin
  tWorks.CancelRange;
  tAreas.FindKey([Edit1.Text]);
  tWorks.SetRange([tAreasA_Code.Value], [tAreasA_Code.Value]);
  CurAreaCode := tAreasA_Code.Value;
end;

procedure TfWorks.ChangeKNS;
begin
  tWorks.CancelRange;
  tKNS.FindKey([Edit1.Text]);
  tWorks.SetRange([tKNSK_Code.Value], [tKNSK_Code.Value]);
end;

procedure TfWorks.ChangeSideKNS;
begin
  tWorks.CancelRange;
  tKNS.FindKey([Edit1.Text]);
  if Edit1.Text = 'Правый' then tWorks.SetRange([1, tKNSK_Code.Value], [1, tKNSK_Code.Value])
  else                          tWorks.SetRange([0, tKNSK_Code.Value], [0, tKNSK_Code.Value]);

end;

procedure TfWorks.btnKNSClick(Sender: TObject);
var
  KNS : TfChoiceKNS;
begin
  KNS := TfChoiceKNS.Create(nil);
  try
    KNS.tKNS.FindKey([tKnsK_Name.Value]);
    if KNS.ShowModal = mrOK then
    begin
      tKNS.FindKey([KNS.tKNSK_Name.Value]);
      Edit2.Text := KNS.tKNSK_Name.Value;
      ChangeSideKNS;
    end;
  finally
    KNS.Free;
  end;
end;

procedure TfWorks.F41Click(Sender: TObject);
var
  Print : TfPrintMonth;
  Period : TfPeriods;
  MyCursor : TCursor;
  MyWait : TfWait;
begin
  Period := TfPeriods.Create(nil);
  try
    if Period.ShowModal = mrOk then
    begin
      Print := TfPrintMonth.Create(nil);
      MyWait := TfWait.Create(nil);
      MyCursor := Screen.Cursor;
      try
        Screen.Cursor := crSQLWait;
        MyWait.Show;
        Print.BeginWork;
        Period.tActs.SetRange([Period.Date1.Date], [Period.Date2.Date]);
        Print.D1 := Period.Date1.Date;
        Print.D2 := Period.Date2.Date;
        Period.tActs.First;
        while not Period.tActs.Eof do
        begin
          MyWait.WaitLabel.Caption := 'Акт № '+FloatToStr(Period.tActsAC_Act.Value)+' за '+DateToStr(Period.tActsAC_Date.Value);
          MyWait.Refresh;
          Print.ActDate := Period.tActsAC_Date.Value;
          Print.DoPrint(Period.tActsAC_W_Code.Value);
          Period.tActs.Next;
          Application.ProcessMessages;
        end;
        Period.tActs.CancelRange;
        Print.EndWork;
      finally
        Print.Free;
        MyWait.Free;
        Screen.Cursor := MyCursor;
      end;
    end;
  finally
    Period.Free;
  end;
end;

procedure TfWorks.N1Click(Sender: TObject);
var
  Print : TfPrintAct;
  Period : TfPeriodAct;
  MyCursor : TCursor;
  MyWait : TfWait;
begin
  Period := TfPeriodAct.Create(nil);
  try
    if Period.ShowModal = mrOk then
    begin
      Print := TfPrintAct.Create(nil);
      MyWait := TfWait.Create(nil);
      MyCursor := Screen.Cursor;
      try
        Screen.Cursor := crSQLWait;
        MyWait.Show;
        MyWait.Refresh;
        Print.BeginWork;
        Period.tAct.SetRange([Period.F1], [Period.F2]);
        Print.F1 := Period.F1;
        Print.F2 := Period.F2;
        Period.tAct.First;
        while not Period.tAct.Eof do
        begin
          MyWait.WaitLabel.Caption := 'Акт № '+FloatToStr(Period.tActAC_Act.Value)+' за '+DateToStr(Period.tActAC_Date.Value);
          MyWait.Refresh;
          Print.ActNumber := Period.tActAC_Act.Value;
          Print.DoPrint(Period.tActAC_W_Code.Value);
          Period.tAct.Next;
          Application.ProcessMessages;
        end;
        Period.tAct.CancelRange;
        Print.EndWork;
      finally
        Print.Free;
        MyWait.Free;
        Screen.Cursor := MyCursor;
      end;
    end;
  finally
    Period.Free;
  end;
end;

procedure TfWorks.btnMegaClick(Sender: TObject);
var
  Mega : TfMegaWork;
begin
  Mega := TfMegaWork.Create(nil);
  try
    Mega.ShowModal;
    tWorks.Refresh;
  finally
    Mega.Free;
  end;
end;

end.
