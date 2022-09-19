unit uDoLetter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, DB,
  DBTables, Menus, DBClient, OleServer, ExcelXP;

type
  TfDoLetter = class(TForm)
    ToolBar1: TToolBar;
    btnOk: TToolButton;
    ToolButton2: TToolButton;
    btnLetter1: TToolButton;
    btnLetter2: TToolButton;
    pName: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    grWorks: TDBGrid;
    grActs: TDBGrid;
    tMega: TTable;
    tMegaMW_Code: TAutoIncField;
    tMegaMW_Name: TStringField;
    tMegaMW_Address: TStringField;
    tWorks: TTable;
    dsWorks: TDataSource;
    tWorksW_Code: TAutoIncField;
    tWorksW_A_Code: TIntegerField;
    tWorksW_ShortName: TStringField;
    tWorksW_Otbor: TStringField;
    tWorksW_Address: TStringField;
    tWorksW_FullName: TStringField;
    tWorksW_Label: TBooleanField;
    tWorksW_Side: TIntegerField;
    tWorksW_K_Code: TIntegerField;
    tWorksW_MW_Code: TIntegerField;
    tWorksW_Filial: TStringField;
    dsMega: TDataSource;
    dsActs: TDataSource;
    tActs: TTable;
    tActsAC_Code: TAutoIncField;
    tActsAC_Act: TFloatField;
    tActsAC_Date: TDateField;
    tActsAC_W_Code: TIntegerField;
    tActsAC_Plan: TBooleanField;
    tActsAC_Proba: TBooleanField;
    PopupMenu: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    cdsActs: TClientDataSet;
    cdsActsAct: TFloatField;
    ds_cdsActs: TDataSource;
    gr_cdsActs: TDBGrid;
    ExcelLetter1: TExcelApplication;
    cdsActsAct_Date: TDateField;
    tIngreds: TTable;
    tIngredsI_Code: TAutoIncField;
    tIngredsI_Name: TStringField;
    tIngredsI_Sorted: TIntegerField;
    tWorkActs: TTable;
    tWorkActsAC_Code: TAutoIncField;
    tWorkActsAC_Act: TFloatField;
    tWorkActsAC_Date: TDateField;
    tWorkActsAC_W_Code: TIntegerField;
    cdsLetter1: TClientDataSet;
    tValues: TTable;
    tValuesV_Code: TAutoIncField;
    tValuesV_AC_Code: TIntegerField;
    tValuesV_I_Code: TIntegerField;
    tValuesV_Value: TFloatField;
    tFormats: TTable;
    tFormatsF_I_Code: TIntegerField;
    tFormatsF_All: TIntegerField;
    tFormatsF_Posle: TIntegerField;
    tIngredsI_IsPH: TBooleanField;
    tIngredsI_HowOutput: TStringField;
    tIngredsI_HowOutput2: TStringField;
    tIngredsI_HowRegistr: TBooleanField;
    tIngredsI_EdIzm: TStringField;
    tIngredsI_EdIzm2: TStringField;
    tIngredsI_EdRegistr: TBooleanField;
    btnParams: TToolButton;
    tWorksWorks: TTable;
    tWorksWorksW_Otbor: TStringField;
    tWorksWorksW_Filial: TStringField;
    tWorksWorksW_Code: TAutoIncField;
    tNorms: TTable;
    tNormsN_Code: TAutoIncField;
    tNormsN_W_Code: TIntegerField;
    tNormsN_I_Code: TIntegerField;
    tNormsN_Date: TDateField;
    tNormsN_Value: TFloatField;
    tNormsN_Output: TBooleanField;
    qNorms: TQuery;
    qNormsN_Date: TDateField;
    MenuPrint: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    tIngredsDocument: TStringField;
    tIngredsStarlet: TBooleanField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLetter1Click(Sender: TObject);
    procedure btnLetter2Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grActsDblClick(Sender: TObject);
    procedure gr_cdsActsDblClick(Sender: TObject);
    procedure btnParamsClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    MyBook  : ExcelWorkBook;
    MySheet : ExcelWorkSheet;
  public
    { Public declarations }
    MegaWorkCode : Integer;
    procedure Prepare;
  end;

implementation

uses uDm, uVars, uLetter1Params;

{$R *.dfm}

procedure TfDoLetter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; ModalResult := mrOk;  end;
      VK_F2     : begin Key := 0; btnLetter1Click(nil); end;  // Письмо 1
      VK_F4     : begin Key := 0; btnLetter2Click(nil); end;  // Письмо 2
      VK_F8     : begin Key := 0; btnParamsClick(nil);  end;
      VK_TAB :
        begin
          Key := 0;
          if grWorks.Focused then grActs.SetFocus
          else if grActs.Focused then gr_cdsActs.SetFocus
          else if gr_cdsActs.Focused then grWorks.SetFocus;
        end;
      VK_SPACE :
        begin
          if      grActs.Focused     then grActsDblClick(nil)
          else if gr_cdsActs.Focused then gr_cdsActsDblClick(nil);
        end;
    end;
end;

procedure TfDoLetter.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfDoLetter.Prepare;
begin
  tMega.FindKey([MegaWorkCode]);
  pName.Caption := tMegaMW_Name.Value;
end;

procedure TfDoLetter.FormCreate(Sender: TObject);
begin
  cdsActs.CreateDataSet;
end;

procedure TfDoLetter.grActsDblClick(Sender: TObject);
begin
  if not cdsActs.FindKey([tActsAC_Act.Value]) then
  begin
    cdsActs.Insert;
    cdsActsAct_Date.Value := tActsAC_Date.Value;
    cdsActsAct.Value := tActsAC_Act.Value;
    cdsActs.Post;
  end;
end;

procedure TfDoLetter.gr_cdsActsDblClick(Sender: TObject);
begin
  if cdsActs.RecordCount > 0 then cdsActs.Delete;
end;

procedure TfDoLetter.btnLetter1Click(Sender: TObject);
var
  MyCursor : TCursor;
  CurrentRow, BeginRow : Integer;
  Counter, I : Integer;
  MyFieldName : String;
  cdsLetter1 : TClientDataSet;
  Metka : Integer;
  TempString : String;
  MyDate : TDate;
begin
  if cdsActs.RecordCount = 0 then Exit;
  MyCursor := Screen.Cursor;
  cdsLetter1 := TClientDataSet.Create(nil);
  try
// Подготавливаем временную таблицу
    cdsLetter1.FieldDefs.Add('Ingred', ftString, 50, True);
    cdsLetter1.FieldDefs.Add('CodeIngred', ftInteger, 0, True);
    cdsLetter1.FieldDefs.Add('Metka', ftBoolean, 0, False);
    cdsLetter1.FieldDefs.Add('Sorted', ftInteger, 0, False);
    cdsActs.First;
    while not cdsActs.Eof do
    begin
      cdsLetter1.FieldDefs.Add(FloatToStr(cdsActsAct.Value), ftFloat, 0, False);
      cdsActs.Next;
    end;
    cdsLetter1.CreateDataSet;
    cdsLetter1.AddIndex('I_Sorted', 'Sorted', []);
    cdsLetter1.IndexFieldNames := 'Sorted';
// Заполняем таблицу
    tIngreds.First;
    while not tIngreds.Eof do
    begin
      if not tIngredsI_IsPH.Value then
      begin
        cdsLetter1.Insert;
        cdsLetter1.FieldByName('Ingred').AsString := tIngredsI_Name.Value;
        cdsLetter1.FieldByName('CodeIngred').AsInteger := tIngredsI_Code.Value;
        cdsLetter1.FieldByName('Sorted').AsInteger := tIngredsI_Sorted.Value;
      end;
      tIngreds.Next;
    end;
//  Цикл по количесву актов в cdsActs
//  Заполняем значения отборов
    cdsActs.First;
    while not cdsActs.Eof do
    begin
      tWorkActs.FindKey([cdsActsAct.Value]);
      cdsLetter1.First;
      while not cdsLetter1.Eof do
      begin
        if tValues.FindKey([tWorkActsAC_Code.Value, cdsLetter1.FieldByName('CodeIngred').Value]) then
        begin
          cdsLetter1.Edit;
          if not tValuesV_Value.IsNull then
            cdsLetter1.FieldByName(FloatToStr(cdsActsAct.Value)).Value := tValuesV_Value.Value;
          cdsLetter1.Post;
        end;
        cdsLetter1.Next;
      end;
      cdsActs.Next;
    end;
// Помечаем "пустые" записи
    cdsLetter1.First;
    while not cdsLetter1.Eof do
    begin
      Metka := 0;
      for I := 4 to cdsLetter1.FieldDefs.Count - 1 do
      begin
        MyFieldName := cdsLetter1.Fields[I].FieldName;
        if not cdsLetter1.FieldByName(MyFieldName).IsNull then
          Inc(Metka);
      end;
      cdsLetter1.Edit;
      if Metka > 0 then cdsLetter1.FieldByName('Metka').AsBoolean := True
      else              cdsLetter1.FieldByName('Metka').AsBoolean := False;
      cdsLetter1.Post;
      cdsLetter1.Next;
    end;
//  Подготовка Excel-а к работе
    Screen.Cursor := crHourGlass;
    ExcelLetter1.Disconnect;
    ExcelLetter1.Connect;
    MyBook  := ExcelLetter1.Workbooks.Add(xlWBATWorkSheet, LOCALE_USER_DEFAULT);
    MySheet := MyBook.WorkSheets.Item[1] as ExcelWorkSheet;
    MySheet.PageSetup.Orientation := xlPortrait;
    BeginRow := 16;
    CurrentRow := BeginRow;

    MySheet.Cells.Item[2, cdsLetter1.FieldDefs.Count-2] := tMegaMW_Name.Value;
    MySheet.Cells.Item[4, cdsLetter1.FieldDefs.Count-2] := 'Руководителю предприятия';
    MySheet.Cells.Item[5, cdsLetter1.FieldDefs.Count-2] := 'г.Красноярск';
    MySheet.Cells.Item[6, cdsLetter1.FieldDefs.Count-2] := tMegaMW_Address.Value;

    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Select;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlEdgeTop].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlEdgeTop].Weight := xlThin;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlInsideHorizontal].Weight := xlThin;

    I := GetNumberLetter;
    MySheet.Cells.Item[8, 1] := '№ '+IntToStr(I);
    SetNumberLetter(I+1);
    MySheet.Cells.Item[9, 1] := 'от '+DateToStr(Date())+' г.';
    MySheet.Range['A8', 'A9'].Select;
    MySheet.Range['A8', 'A9'].HorizontalAlignment := xlCenter;
    MySheet.Range['A8', 'A9'].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['A8', 'A9'].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range['A8', 'A9'].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range['A8', 'A9'].Borders[xlInsideHorizontal].Weight := xlThin;

    MySheet.Cells.Item[BeginRow-5, 1] := GetTextLetter1;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].Select;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].Merge(0);
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].WrapText := True;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].HorizontalAlignment := xlJustify;

    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].Select;
    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].Merge(0);
    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].WrapText := True;
    TempString := '      Отбор проб произведен ';
    cdsActs.First;
    MyDate := cdsActsAct_Date.Value;
    TempString := TempString + DateToStr(MyDate) + 'г. (акт № ';
    while not cdsActs.Eof do
    begin
      if cdsActsAct_Date.Value <> MyDate then
      begin
        MyDate := cdsActsAct_Date.Value;
        TempString := TempString + '), ' + DateToStr(MyDate) + 'г. (акт № ' + FloatToStr(cdsActsAct.Value);
      end
      else
      begin
        TempString := TempString + ', ' + FloatToStr(cdsActsAct.Value);
      end;
      cdsActs.Next;
    end;
    TempString := TempString + ')';
    MySheet.Cells.Item[BeginRow-4, 1] := TempString;
    MySheet.Cells.Item[BeginRow-4, 1].Characters(28, Length(TempString)-27).Font.Underline := True;


    MySheet.Cells.Item[CurrentRow-1, 1] := '№ п/п';
    MySheet.Range['A'+IntToStr(CurrentRow-2), 'A'+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow-2), 'A'+IntToStr(CurrentRow)].Merge(0);

    MySheet.Cells.Item[CurrentRow-1, 2] := 'Наименование';
    MySheet.Range['B'+IntToStr(CurrentRow-2), 'B'+IntToStr(CurrentRow)].Select;
    MySheet.Range['B'+IntToStr(CurrentRow-2), 'B'+IntToStr(CurrentRow)].Merge(0);
    for I := 4 to cdsLetter1.FieldDefs.Count - 1 do
    begin
      tWorkActs.FindKey([cdsLetter1.Fields[I].FieldName]);
      tWorksWorks.FindKey([tWorkActsAC_W_Code.Value]);
      if not tWorksWorksW_Filial.IsNull then
      MySheet.Cells.Item[CurrentRow-2, I-1] := tWorksWorksW_Filial.Value;
      MySheet.Cells.Item[CurrentRow-1, I-1] := tWorksWorksW_Otbor.Value;
      MySheet.Cells.Item[CurrentRow, I-1] := 'Акт № '+cdsLetter1.Fields[I].FieldName;
    end;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Font.Bold := True;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].VerticalAlignment := xlCenter;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
// Печатаем
    Counter := 0;
    tIngreds.IndexFieldNames := 'I_Code';
    cdsLetter1.First;
    while not cdsLetter1.Eof do
    begin
      if cdsLetter1.FieldByName('Metka').AsBoolean then
      begin
        Inc(CurrentRow);
        Inc(Counter);
        MySheet.Cells.Item[CurrentRow, 1] := Counter;

        tIngreds.FindKey([cdsLetter1.FieldByName('CodeIngred').Value]);
        if not tIngredsI_HowOutput.IsNull then TempString := tIngredsI_HowOutput.Value
        else                                   TempString := tIngredsI_Name.Value;
        if not tIngredsI_HowOutput2.IsNull then TempString := TempString + tIngredsI_HowOutput2.Value;

        if not tIngredsI_EdIzm.IsNull then TempString := TempString + ', '+ tIngredsI_EdIzm.Value;
        if not tIngredsI_EdIzm2.IsNull then TempString := TempString + tIngredsI_EdIzm2.Value;

        MySheet.Cells.Item[CurrentRow, 2] := TempString;
        if not tIngredsI_HowOutput2.IsNull then
        begin
          if tIngredsI_HowRegistr.Value then  // Верхний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(tIngredsI_HowOutput.Value)+1, Length(tIngredsI_HowOutput2.Value)).Font.Superscript := True
          else                                // Нижний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(tIngredsI_HowOutput.Value)+1, Length(tIngredsI_HowOutput2.Value)).Font.Subscript := True;
        end;

        if not tIngredsI_EdIzm2.IsNull then
        begin
          if tIngredsI_EdRegistr.Value then   // Верхний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(TempString)-Length(tIngredsI_EdIzm2.Value)+1, Length(tIngredsI_EdIzm2.Value)).Font.Superscript := True
          else                                // Нижний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(TempString)-Length(tIngredsI_EdIzm2.Value)+1, Length(tIngredsI_EdIzm2.Value)).Font.Subscript := True;
        end;
        for I := 4 to cdsLetter1.FieldDefs.Count - 1 do
        begin
          MyFieldName := cdsLetter1.Fields[I].FieldName;
          if not cdsLetter1.FieldByName(MyFieldName).IsNull then
          begin
            if cdsLetter1.FieldByName(MyFieldName).AsFloat = 0 then
            begin
              MySheet.Cells.Item[CurrentRow, I-1].HorizontalAlignment := xlRight;
              MySheet.Cells.Item[CurrentRow, I-1] := 'н. обн.';
            end
            else
              begin
                if tFormats.FindKey([cdsLetter1.FieldByName('CodeIngred').AsInteger]) then
                begin
                  TempString := Format('%%%d.%df', [tFormatsF_All.Value, tFormatsF_Posle.Value]);
                  MySheet.Cells.Item[CurrentRow, I-1].NumberFormat := Format(TempString, [0.0]);
                  MySheet.Cells.Item[CurrentRow, I-1] := cdsLetter1.FieldByName(MyFieldName).AsFloat;
                end;
              end;
          end;
        end;
      end;
      cdsLetter1.Next;
    end;

    MySheet.Cells.Item[CurrentRow+2, 1] := GetDolgnostLetter;
    MySheet.Cells.Item[CurrentRow+2, 3] := GetBossLetter;
    MySheet.Cells.Item[CurrentRow+4, 1] := GetPhoneLetter;
    MySheet.Cells.Item[CurrentRow+5, 1] := GetAddressLetter;

    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeLeft].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeTop].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeRight].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlInsideVertical].LineStyle := xlContinuous;

    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeLeft].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeTop].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeRight].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlInsideHorizontal].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlInsideVertical].Weight := xlThin;

    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Select;
    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlEdgeLeft].LineStyle := xlContinuous;
    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlEdgeTop].LineStyle := xlContinuous;
    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlEdgeRight].LineStyle := xlContinuous;
    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlInsideHorizontal].LineStyle := xlNone;
//    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlInsideVertical].LineStyle := xlContinuous;

    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlEdgeLeft].Weight := xlThin;
    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlEdgeTop].Weight := xlThin;
    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range['C'+IntToStr(BeginRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow)].Borders[xlEdgeRight].Weight := xlThin;

    MySheet.Columns.AutoFit;

  finally
    cdsLetter1.Free;
    tIngreds.IndexFieldNames := 'I_Sorted';
    ExcelLetter1.Visible[LOCALE_USER_DEFAULT] := True;
    MySheet := nil;
    MyBook  := nil;
    ExcelLetter1.Disconnect;
    Screen.Cursor := MyCursor;
  end;
end;

procedure TfDoLetter.btnLetter2Click(Sender: TObject);
begin
  btnLetter2.CheckMenuDropdown;
end;

procedure TfDoLetter.btnParamsClick(Sender: TObject);
var
  LetterParams : TfLetter1Params;
begin
  LetterParams := TfLetter1Params.Create(nil);
  try
    LetterParams.ShowModal;
  finally
    LetterParams.Free;
  end;
end;

// Печать письма с нормами по превышениям
procedure TfDoLetter.N3Click(Sender: TObject);
var
  MyCursor : TCursor;
  CurrentRow, BeginRow : Integer;
  Counter, I : Integer;
  MyFieldName : String;
  cdsLetter1 : TClientDataSet;
  Metka : Integer;
  TempString : String;
  MyDate : TDate;
  Founded : Boolean;
begin
  if cdsActs.RecordCount = 0 then Exit;
  MyCursor := Screen.Cursor;
  cdsLetter1 := TClientDataSet.Create(nil);
  try
// Подготавливаем временную таблицу
    cdsLetter1.FieldDefs.Add('Ingred', ftString, 50, True);
    cdsLetter1.FieldDefs.Add('CodeIngred', ftInteger, 0, True);
    cdsLetter1.FieldDefs.Add('Metka', ftBoolean, 0, False);
    cdsLetter1.FieldDefs.Add('Sorted', ftInteger, 0, False);
    cdsActs.First;
    while not cdsActs.Eof do
    begin
      cdsLetter1.FieldDefs.Add(FloatToStr(cdsActsAct.Value), ftFloat, 0, False);
      cdsLetter1.FieldDefs.Add('N'+FloatToStr(cdsActsAct.Value), ftFloat, 0, False);
      cdsActs.Next;
    end;
    cdsLetter1.CreateDataSet;
    cdsLetter1.AddIndex('I_Sorted', 'Sorted', []);
    cdsLetter1.IndexFieldNames := 'Sorted';
// Заполняем таблицу
    tIngreds.First;
    while not tIngreds.Eof do
    begin
      if not tIngredsI_IsPH.Value then
      begin
        cdsLetter1.Insert;
        cdsLetter1.FieldByName('Ingred').AsString := tIngredsI_Name.Value;
        cdsLetter1.FieldByName('CodeIngred').AsInteger := tIngredsI_Code.Value;
        cdsLetter1.FieldByName('Sorted').AsInteger := tIngredsI_Sorted.Value;
      end;
      tIngreds.Next;
    end;
//  Цикл по количеству актов в cdsActs
//  Заполняем значения отборов
    cdsActs.First;
    while not cdsActs.Eof do
    begin
      tWorkActs.FindKey([cdsActsAct.Value]);

      tWorksWorks.FindKey([tWorkActsAC_W_Code.Value]);

      qNorms.Close;
      qNorms.ParamByName('MyCode').Value := tWorkActsAC_W_Code.Value;
      qNorms.ParamByName('MyDate').Value := tWorkActsAC_Date.Value;
      qNorms.Open;
      qNorms.Last;

      cdsLetter1.First;
      while not cdsLetter1.Eof do
      begin
        if tValues.FindKey([tWorkActsAC_Code.Value, cdsLetter1.FieldByName('CodeIngred').Value]) then
        begin
          if qNorms.RecordCount > 0 then
          begin
//            Founded := False;
//            if tWorkActsAC_Date.Value >= qNormsN_Date.Value then
//           begin
//              qNorms.First;
//              while not qNorms.Eof do
//              begin
//                if tWorkActsAC_Date.Value >= qNormsN_Date.Value then
//                begin
//                  Founded := True;
//                  break;
//                end;
//                qNorms.Next;
//              end;
//            end;
Founded := true;
            if Founded then
            begin
              if tNorms.FindKey([tWorkActsAC_W_Code.Value,
                                 qNormsN_Date.Value,
                                 cdsLetter1.FieldByName('CodeIngred').Value]) then
              begin
                if tNormsN_Output.Value and (not tNormsN_Value.IsNull) then
                begin
                  cdsLetter1.Edit;
                    cdsLetter1.FieldByName('N'+FloatToStr(cdsActsAct.Value)).Value := tNormsN_Value.Value;
                  cdsLetter1.Post;
                end;
              end;
            end;
          end;
          cdsLetter1.Edit;
          if not tValuesV_Value.IsNull then
            cdsLetter1.FieldByName(FloatToStr(cdsActsAct.Value)).Value := tValuesV_Value.Value;
          cdsLetter1.Post;
        end;
        cdsLetter1.Next;
      end;
      cdsActs.Next;
    end;
// Помечаем "пустые" записи
    cdsLetter1.First;
    while not cdsLetter1.Eof do
    begin
      Metka := 0;
      for I := 4 to cdsLetter1.FieldDefs.Count - 1 do
      begin
        if (I mod 2) <> 0 then
        begin
          MyFieldName := cdsLetter1.Fields[I].FieldName;
          if not cdsLetter1.FieldByName(MyFieldName).IsNull then
            if cdsLetter1.Fields[I].Value < cdsLetter1.Fields[I-1].Value then
              Inc(Metka);
        end;
      end;
      cdsLetter1.Edit;
      if Metka > 0 then cdsLetter1.FieldByName('Metka').AsBoolean := True
      else              cdsLetter1.FieldByName('Metka').AsBoolean := False;
      cdsLetter1.Post;
      cdsLetter1.Next;
    end;
//  Подготовка Excel-а к работе
    Screen.Cursor := crHourGlass;
    ExcelLetter1.Disconnect;
    ExcelLetter1.Connect;
    MyBook  := ExcelLetter1.Workbooks.Add(xlWBATWorkSheet, LOCALE_USER_DEFAULT);
    MySheet := MyBook.WorkSheets.Item[1] as ExcelWorkSheet;
    MySheet.PageSetup.Orientation := xlPortrait;
    BeginRow := 16;
    CurrentRow := BeginRow;

    MySheet.Cells.Item[2, cdsLetter1.FieldDefs.Count-2] := tMegaMW_Name.Value;
    MySheet.Cells.Item[4, cdsLetter1.FieldDefs.Count-2] := 'Руководителю предприятия';
    MySheet.Cells.Item[5, cdsLetter1.FieldDefs.Count-2] := 'г.Красноярск';
    MySheet.Cells.Item[6, cdsLetter1.FieldDefs.Count-2] := tMegaMW_Address.Value;

    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Select;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlEdgeTop].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlEdgeTop].Weight := xlThin;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'2', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'7'].Borders[xlInsideHorizontal].Weight := xlThin;

    I := GetNumberLetter;
    MySheet.Cells.Item[8, 1] := '№ '+IntToStr(I);
    SetNumberLetter(I+1);
    MySheet.Cells.Item[9, 1] := 'от '+DateToStr(Date())+' г.';
    MySheet.Range['A8', 'A9'].Select;
    MySheet.Range['A8', 'A9'].HorizontalAlignment := xlCenter;
    MySheet.Range['A8', 'A9'].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['A8', 'A9'].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range['A8', 'A9'].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range['A8', 'A9'].Borders[xlInsideHorizontal].Weight := xlThin;

    MySheet.Cells.Item[BeginRow-4, 1] := GetTextLetter2_2;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].Select;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].Merge(0);
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].WrapText := True;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].HorizontalAlignment := xlJustify;

    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].Select;
    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].Merge(0);
    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].WrapText := True;

    TempString := GetTextLetter2_1+' ';
    cdsActs.First;
    MyDate := cdsActsAct_Date.Value;
    TempString := TempString + DateToStr(MyDate) + 'г. (акт № ';
    while not cdsActs.Eof do
    begin
      if cdsActsAct_Date.Value <> MyDate then
      begin
        MyDate := cdsActsAct_Date.Value;
        TempString := TempString + '), ' + DateToStr(MyDate) + 'г. (акт № ' + FloatToStr(cdsActsAct.Value);
      end
      else
      begin
        TempString := TempString + ', ' + FloatToStr(cdsActsAct.Value);
      end;
      cdsActs.Next;
    end;
    TempString := TempString + ')';
    MySheet.Cells.Item[BeginRow-5, 1] := TempString;
    MySheet.Cells.Item[BeginRow-5, 1].Characters(Length(GetTextLetter2_1)+2, Length(TempString)-Length(GetTextLetter2_1)-1).Font.Underline := True;


//    MySheet.Cells.Item[CurrentRow-1, 1] := '№ п/п';
//    MySheet.Range['A'+IntToStr(CurrentRow-2), 'A'+IntToStr(CurrentRow)].Select;
//    MySheet.Range['A'+IntToStr(CurrentRow-2), 'A'+IntToStr(CurrentRow)].Merge(0);

//    MySheet.Cells.Item[CurrentRow-1, 2] := 'Наименование';
//    MySheet.Range['B'+IntToStr(CurrentRow-2), 'B'+IntToStr(CurrentRow)].Select;
//    MySheet.Range['B'+IntToStr(CurrentRow-2), 'B'+IntToStr(CurrentRow)].Merge(0);
    for I := 4 to cdsLetter1.FieldDefs.Count - 1 do
    begin
      if (I mod 2) = 0 then
//      begin
//        tWorkActs.FindKey([cdsLetter1.Fields[I].FieldName]);
//        tWorksWorks.FindKey([tWorkActsAC_W_Code.Value]);
//        if not tWorksWorksW_Filial.IsNull then
//          MySheet.Cells.Item[CurrentRow-2, I-1] := tWorksWorksW_Filial.Value;
//        MySheet.Cells.Item[CurrentRow-1, I-1] := tWorksWorksW_Otbor.Value;
        MySheet.Cells.Item[CurrentRow-1, I-1] := 'Факт'
//        MySheet.Cells.Item[CurrentRow, I-1] := 'Акт № '+cdsLetter1.Fields[I].FieldName;
//      end
      else
//      begin
        MySheet.Cells.Item[CurrentRow-1, I-1] := 'Норма';
//      end;
    end;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Font.Bold := True;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].VerticalAlignment := xlCenter;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
// Печатаем
//    Inc(CurrentRow);
    Counter := 0;
    tIngreds.IndexFieldNames := 'I_Code';
    cdsLetter1.First;
    while not cdsLetter1.Eof do
    begin
      if cdsLetter1.FieldByName('Metka').AsBoolean then
      begin
        Inc(CurrentRow);
        Inc(Counter);
        MySheet.Cells.Item[CurrentRow, 1] := Counter;

        tIngreds.FindKey([cdsLetter1.FieldByName('CodeIngred').Value]);
        if not tIngredsI_HowOutput.IsNull then TempString := tIngredsI_HowOutput.Value
        else                                   TempString := tIngredsI_Name.Value;
        if not tIngredsI_HowOutput2.IsNull then TempString := TempString + tIngredsI_HowOutput2.Value;

        if not tIngredsI_EdIzm.IsNull then TempString := TempString + ', '+ tIngredsI_EdIzm.Value;
        if not tIngredsI_EdIzm2.IsNull then TempString := TempString + tIngredsI_EdIzm2.Value;

        MySheet.Cells.Item[CurrentRow, 2] := TempString;
        if not tIngredsI_HowOutput2.IsNull then
        begin
          if tIngredsI_HowRegistr.Value then  // Верхний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(tIngredsI_HowOutput.Value)+1, Length(tIngredsI_HowOutput2.Value)).Font.Superscript := True
          else                                // Нижний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(tIngredsI_HowOutput.Value)+1, Length(tIngredsI_HowOutput2.Value)).Font.Subscript := True;
        end;

        if not tIngredsI_EdIzm2.IsNull then
        begin
          if tIngredsI_EdRegistr.Value then   // Верхний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(TempString)-Length(tIngredsI_EdIzm2.Value)+1, Length(tIngredsI_EdIzm2.Value)).Font.Superscript := True
          else                                // Нижний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(TempString)-Length(tIngredsI_EdIzm2.Value)+1, Length(tIngredsI_EdIzm2.Value)).Font.Subscript := True;
        end;
        for I := 4 to cdsLetter1.FieldDefs.Count - 1 do
        begin
          MyFieldName := cdsLetter1.Fields[I].FieldName;
          if not cdsLetter1.FieldByName(MyFieldName).IsNull then
          begin
            if (cdsLetter1.FieldByName(MyFieldName).AsFloat = 0) and ((I mod 2) = 0) then
            begin
              MySheet.Cells.Item[CurrentRow, I-1].HorizontalAlignment := xlRight;
              MySheet.Cells.Item[CurrentRow, I-1] := 'н. обн.';
            end
            else begin
              if tFormats.FindKey([cdsLetter1.FieldByName('CodeIngred').AsInteger]) then
              begin
                TempString := Format('%%%d.%df', [tFormatsF_All.Value, tFormatsF_Posle.Value]);
                MySheet.Cells.Item[CurrentRow, I-1].NumberFormat := Format(TempString, [0.0]);
                MySheet.Cells.Item[CurrentRow, I-1] := cdsLetter1.FieldByName(MyFieldName).AsFloat;
              end;
            end;
          end;
        end;
      end;
      cdsLetter1.Next;
    end;

    if CurrentRow - BeginRow < 15 then
      CurrentRow := BeginRow+15;
    MySheet.Range['A'+IntToStr(CurrentRow+2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+2)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow+2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+2)].Merge(0);
    MySheet.Range['A'+IntToStr(CurrentRow+2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+2)].WrapText := True;
    MySheet.Range['A'+IntToStr(CurrentRow+2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+2)].HorizontalAlignment := xlJustify;
    MySheet.Cells.Item[CurrentRow+2, 1] := 'Примечание:    Нормативы утверждены Постановлением администрации';

    MySheet.Range['A'+IntToStr(CurrentRow+3), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow+3), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Merge(0);
    MySheet.Range['A'+IntToStr(CurrentRow+3), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].WrapText := True;
    MySheet.Range['A'+IntToStr(CurrentRow+3), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].HorizontalAlignment := xlJustify;
    MySheet.Cells.Item[CurrentRow+3, 1] := 'г.Красноярска '+GetPost;

    MySheet.Range['A'+IntToStr(CurrentRow+5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+5)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow+5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+5)].Merge(0);
    MySheet.Range['A'+IntToStr(CurrentRow+5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+5)].WrapText := True;
    MySheet.Range['A'+IntToStr(CurrentRow+5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+5)].HorizontalAlignment := xlJustify;
    MySheet.Cells.Item[CurrentRow+5, 1] := '   Просим принять соответствующие меры по снижению химзагрязнений в сточных водах Вашего предприятия';

    MySheet.Cells.Item[CurrentRow+7,  1] := GetDolgnostLetter;
    MySheet.Cells.Item[CurrentRow+7,  3] := GetBossLetter;
    MySheet.Cells.Item[CurrentRow+9,  1] := GetPhoneLetter;
    MySheet.Cells.Item[CurrentRow+10, 1] := GetAddressLetter;

    MySheet.Range['A'+IntToStr(BeginRow+1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Select;
    MySheet.Range['A'+IntToStr(BeginRow+1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Borders[xlEdgeTop].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow+1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow+1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Borders[xlInsideHorizontal].LineStyle := xlContinuous;

    MySheet.Range['A'+IntToStr(BeginRow+1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Borders[xlEdgeTop].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow+1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow+1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Borders[xlInsideHorizontal].Weight := xlThin;

    MySheet.Columns.AutoFit;

  finally
    cdsLetter1.Free;
    tIngreds.IndexFieldNames := 'I_Sorted';
    ExcelLetter1.Visible[LOCALE_USER_DEFAULT] := True;
    MySheet := nil;
    MyBook  := nil;
    ExcelLetter1.Disconnect;
    Screen.Cursor := MyCursor;
  end;
end;

// Печать письма с нормами
procedure TfDoLetter.N4Click(Sender: TObject);
var
  MyCursor : TCursor;
  CurrentRow, BeginRow : Integer;
  Counter, I, J : Integer;
  MyFieldName : String;
  cdsLetter1 : TClientDataSet;
  Metka : Integer;
  TempString : String;
  MyDate : TDate;
  Founded : Boolean;
  MyPhMin, MyPhMax : String;
  StringPrim1_1, StringPrim1_2 : String;
begin
  if cdsActs.RecordCount = 0 then Exit;
  MyCursor := Screen.Cursor;
  cdsLetter1 := TClientDataSet.Create(nil);
  try
// Подготавливаем временную таблицу
    cdsLetter1.FieldDefs.Add('Ingred', ftString, 50, True);
    cdsLetter1.FieldDefs.Add('CodeIngred', ftInteger, 0, True);
    cdsLetter1.FieldDefs.Add('Document', ftString, 35, False);
    cdsLetter1.FieldDefs.Add('Metka', ftBoolean, 0, False);
    cdsLetter1.FieldDefs.Add('Sorted', ftInteger, 0, False);
// Добавляем поля "Факт" и "Норма" для каждого акта
    cdsActs.First;
    while not cdsActs.Eof do
    begin
      cdsLetter1.FieldDefs.Add(FloatToStr(cdsActsAct.Value),     ftFloat, 0, False);
      cdsLetter1.FieldDefs.Add('N'+FloatToStr(cdsActsAct.Value), ftFloat, 0, False);
      cdsActs.Next;
    end;
    cdsLetter1.CreateDataSet;
    cdsLetter1.AddIndex('I_Sorted', 'Sorted', []);
    cdsLetter1.IndexFieldNames := 'Sorted';
// Заполняем таблицу
    tIngreds.First;
    while not tIngreds.Eof do
    begin
//      if not tIngredsI_IsPH.Value then
      if not tIngredsI_IsPH.Value and not (tIngredsI_Name.Value = 'ХПК') then
      begin
        cdsLetter1.Insert;
        cdsLetter1.FieldByName('Ingred').AsString      := tIngredsI_Name.Value;
        cdsLetter1.FieldByName('CodeIngred').AsInteger := tIngredsI_Code.Value;
        cdsLetter1.FieldByName('Document').AsString    := tIngredsDocument.Value;
        cdsLetter1.FieldByName('Sorted').AsInteger     := tIngredsI_Sorted.Value;
      end;
      tIngreds.Next;
    end;
//  Цикл по количеству актов в cdsActs
//  Заполняем значения отборов
    MyPhMin := '';
    MyPhMax := '';
    cdsActs.First;
    while not cdsActs.Eof do
    begin
      tWorkActs.FindKey([cdsActsAct.Value]);

      tWorksWorks.FindKey([tWorkActsAC_W_Code.Value]);

      qNorms.Close;
      qNorms.ParamByName('MyCode').Value := tWorkActsAC_W_Code.Value;
      qNorms.ParamByName('MyDate').Value := tWorkActsAC_Date.Value;
      qNorms.Open;
      qNorms.Last;

      cdsLetter1.First;
      while not cdsLetter1.Eof do
      begin
        if tValues.FindKey([tWorkActsAC_Code.Value, cdsLetter1.FieldByName('CodeIngred').Value]) then
        begin
          if qNorms.RecordCount > 0 then
          begin
            Founded := True;
            if Founded then
            begin
              if tNorms.FindKey([tWorkActsAC_W_Code.Value,
                                 qNormsN_Date.Value,
                                 cdsLetter1.FieldByName('CodeIngred').Value]) then
              begin
                if tNormsN_Output.Value and (not tNormsN_Value.IsNull) then
                begin
                  cdsLetter1.Edit;
                  cdsLetter1.FieldByName('N'+FloatToStr(cdsActsAct.Value)).Value := tNormsN_Value.Value;
                  cdsLetter1.Post;
// ========================
                  if cdsLetter1.FieldByName('CodeIngred').AsInteger = 125 then
                  begin
                    MyPhMax := FloatToStr(tNormsN_Value.AsFloat);
                    if tNorms.FindKey([tWorkActsAC_W_Code.Value, qNormsN_Date.Value, 126]) then
                      MyPhMin := FloatToStr(tNormsN_Value.AsFloat * -1);
                  end;
// ========================
                end;
              end;
            end;
          end;
          cdsLetter1.Edit;
          if not tValuesV_Value.IsNull then
            cdsLetter1.FieldByName(FloatToStr(cdsActsAct.Value)).Value := tValuesV_Value.Value;
          cdsLetter1.Post;
        end;
        cdsLetter1.Next;
      end;
      cdsActs.Next;
    end;
// Помечаем "пустые" записи
    cdsLetter1.First;
    while not cdsLetter1.Eof do
    begin
      Metka := 0;
      for I := 5 to cdsLetter1.FieldDefs.Count - 1 do
      begin
          MyFieldName := cdsLetter1.Fields[I].FieldName;
          if not cdsLetter1.FieldByName(MyFieldName).IsNull then
              Inc(Metka);
      end;
      cdsLetter1.Edit;
      if Metka > 0 then cdsLetter1.FieldByName('Metka').AsBoolean := True
      else              cdsLetter1.FieldByName('Metka').AsBoolean := False;
      cdsLetter1.Post;
      cdsLetter1.Next;
    end;

    cdsLetter1.SaveToFile('MyLetters');
//  Подготовка Excel-а к работе
    Screen.Cursor := crHourGlass;
    ExcelLetter1.Disconnect;
    ExcelLetter1.Connect;
    MyBook  := ExcelLetter1.Workbooks.Add(xlWBATWorkSheet, LOCALE_USER_DEFAULT);
    MySheet := MyBook.WorkSheets.Item[1] as ExcelWorkSheet;
    MySheet.PageSetup.Orientation := xlPortrait;
    BeginRow := 21;
    CurrentRow := BeginRow;

    MySheet.Cells.Item[1, 1] := 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ';
    MySheet.Range['A1', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '1'].Select;
    MySheet.Range['A1', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '1'].Merge(0);
//    MySheet.Range['A1', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '1'].Font.Bold := True;
    MySheet.Range['A1', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '1'].HorizontalAlignment := xlCenter;
    MySheet.Range['A1', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '1'].Font.Size := 10;
    MySheet.Range['A1', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '1'].Font.Name := 'Britannic Bold';

    MySheet.Cells.Item[2, 1] := '"Красноярский жилищно-коммунальный комплекс"';
    MySheet.Range['A2', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '2'].Select;
    MySheet.Range['A2', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '2'].Merge(0);
    MySheet.Range['A2', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '2'].Font.Bold := True;
    MySheet.Range['A2', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '2'].Font.Italic := True;
    MySheet.Range['A2', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '2'].HorizontalAlignment := xlCenter;
    MySheet.Range['A2', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '2'].Font.Size := 18;
    MySheet.Range['A2', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '2'].Font.Name := 'Times New Roman';

    MySheet.Cells.Item[3, 1] := 'Центр контроля качества воды';
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].Select;
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].Merge(0);
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].Font.Bold := True;
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].Font.Italic := True;
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].Font.Name := 'Times New Roman';
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].HorizontalAlignment := xlCenter;
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].Font.Size := 14;
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['A3', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '3'].Borders[xlEdgeBottom].Weight := xlThick;

    MySheet.Cells.Item[5, 1] := 'Ул.Крупской, 32а, г.Красноярск, Красноярский край, Россия, 660062, тел. 2477633';
    MySheet.Range['A5', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '5'].Select;
    MySheet.Range['A5', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '5'].Merge(0);
    MySheet.Range['A5', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '5'].Font.Italic := True;
    MySheet.Range['A5', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '5'].HorizontalAlignment := xlCenter;
    MySheet.Range['A5', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '5'].Font.Name := 'Times New Roman';

    MySheet.Cells.Item[6, 1] := 'Аттестат аккредитации № РОСС RU.0001.510471';
    MySheet.Range['A6', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '6'].Select;
    MySheet.Range['A6', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '6'].Merge(0);
    MySheet.Range['A6', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '6'].Font.Italic := True;
    MySheet.Range['A6', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '6'].HorizontalAlignment := xlCenter;
    MySheet.Range['A6', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '6'].Font.Name := 'Times New Roman';

    MySheet.Cells.Item[7, 1] := 'Дата аккредитации 03.08.2011 г., срок действия до 03.08.2016 г.';
    MySheet.Range['A7', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '7'].Select;
    MySheet.Range['A7', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '7'].Merge(0);
    MySheet.Range['A7', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '7'].Font.Italic := True;
    MySheet.Range['A7', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '7'].HorizontalAlignment := xlCenter;
    MySheet.Range['A7', GetAlpha(cdsLetter1.FieldDefs.Count-2) + '7'].Font.Name := 'Times New Roman';


    MySheet.Cells.Item[9,  cdsLetter1.FieldDefs.Count-2] := tMegaMW_Name.Value;
    MySheet.Cells.Item[11, cdsLetter1.FieldDefs.Count-2] := 'Руководителю предприятия';
    MySheet.Cells.Item[12, cdsLetter1.FieldDefs.Count-2] := 'г.Красноярск';
    MySheet.Cells.Item[13, cdsLetter1.FieldDefs.Count-2] := tMegaMW_Address.Value;

    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'9', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'13'].Select;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'9', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'13'].Borders[xlEdgeTop].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'9', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'13'].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'9', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'13'].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'9', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'13'].Borders[xlEdgeTop].Weight := xlThin;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'9', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'13'].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range[GetAlpha(cdsLetter1.FieldDefs.Count-2)+'9', GetAlpha(cdsLetter1.FieldDefs.Count-2)+'13'].Borders[xlInsideHorizontal].Weight := xlThin;

    I := GetNumberLetter;
    MySheet.Cells.Item[12, 1] := '№ '+IntToStr(I);
    SetNumberLetter(I+1);
    MySheet.Cells.Item[13, 1] := 'от '+DateToStr(GetDateLetter)+' г.';
    MySheet.Range['A12', 'A13'].Select;
//    MySheet.Range['A12', 'A13'].HorizontalAlignment := xlCenter;
    MySheet.Range['A12', 'A13'].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['A12', 'A13'].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range['A12', 'A13'].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range['A12', 'A13'].Borders[xlInsideHorizontal].Weight := xlThin;

    MySheet.Cells.Item[BeginRow-5, 1] := GetTextLetter1;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].Select;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].Merge(0);
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].WrapText := True;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].HorizontalAlignment := xlJustify;
    MySheet.Range['A'+IntToStr(BeginRow-5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-5)].RowHeight := 26;

    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].Select;
    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].Merge(0);
    MySheet.Range['A'+IntToStr(BeginRow-4), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(BeginRow-4)].WrapText := True;

    TempString := '      Отбор проб произведен ';
    cdsActs.First;
    MyDate := cdsActsAct_Date.Value;
    TempString := TempString + DateToStr(MyDate) + 'г. (акт № ';
    J := 0;
    while not cdsActs.Eof do
    begin
      if cdsActsAct_Date.Value <> MyDate then
      begin
        MyDate := cdsActsAct_Date.Value;
        TempString := TempString + '), ' + DateToStr(MyDate) + 'г. (акт № ' + FloatToStr(cdsActsAct.Value) + '-СВ';
      end
      else
      begin
        if J = 0 then
          TempString := TempString + ' ' + FloatToStr(cdsActsAct.Value) + '-СВ'
        else
          TempString := TempString + ', ' + FloatToStr(cdsActsAct.Value) + '-СВ';
      end;
      Inc(J);
      cdsActs.Next;
    end;
    TempString := TempString + ')';
    MySheet.Cells.Item[BeginRow-4, 1] := TempString;
    MySheet.Cells.Item[BeginRow-4, 1].Characters(28, Length(TempString)-27).Font.Underline := True;

    MySheet.Cells.Item[CurrentRow-1, 1] := '№ пп';
    MySheet.Cells.Item[CurrentRow-1, 2] := 'Наименование';
    MySheet.Cells.Item[CurrentRow-1, 3] := 'НД на метод анализа';
    for I := 5 to cdsLetter1.FieldDefs.Count - 1 do
    begin
      if (I mod 2) <> 0 then
        MySheet.Cells.Item[CurrentRow-1, I-1] := 'Факт'
      else
        MySheet.Cells.Item[CurrentRow-1, I-1] := 'Норма';
    end;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Font.Bold           := True;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].VerticalAlignment   := xlCenter;
    MySheet.Range['A'+IntToStr(CurrentRow-2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
// Печатаем
    Counter := 0;
    tIngreds.IndexFieldNames := 'I_Code';

    cdsLetter1.First;
    while not cdsLetter1.Eof do
    begin
      if cdsLetter1.FieldByName('Metka').AsBoolean then
      begin
        Inc(CurrentRow);
        Inc(Counter);
        MySheet.Cells.Item[CurrentRow, 1] := Counter;

        tIngreds.FindKey([cdsLetter1.FieldByName('CodeIngred').Value]);
        if not tIngredsI_HowOutput.IsNull then TempString := tIngredsI_HowOutput.Value
        else                                   TempString := tIngredsI_Name.Value;
        if not tIngredsI_HowOutput2.IsNull then TempString := TempString + tIngredsI_HowOutput2.Value;

        if (not tIngredsStarlet.IsNull) and tIngredsStarlet.Value then TempString := TempString + '*';

        if not tIngredsI_EdIzm.IsNull then TempString := TempString + ', '+ tIngredsI_EdIzm.Value;
        if not tIngredsI_EdIzm2.IsNull then TempString := TempString + tIngredsI_EdIzm2.Value;


        MySheet.Cells.Item[CurrentRow, 2] := TempString;
        if not tIngredsI_HowOutput2.IsNull then
        begin
          if tIngredsI_HowRegistr.Value then  // Верхний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(tIngredsI_HowOutput.Value)+1, Length(tIngredsI_HowOutput2.Value)).Font.Superscript := True
          else                                // Нижний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(tIngredsI_HowOutput.Value)+1, Length(tIngredsI_HowOutput2.Value)).Font.Subscript := True;
        end;

        if not tIngredsI_EdIzm2.IsNull then
        begin
          if tIngredsI_EdRegistr.Value then   // Верхний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(TempString)-Length(tIngredsI_EdIzm2.Value)+1, Length(tIngredsI_EdIzm2.Value)).Font.Superscript := True
          else                                // Нижний регистр
            MySheet.Cells.Item[CurrentRow, 2].Characters(Length(TempString)-Length(tIngredsI_EdIzm2.Value)+1, Length(tIngredsI_EdIzm2.Value)).Font.Subscript := True;
        end;

        MySheet.Cells.Item[CurrentRow, 3] := tIngredsDocument.AsString;

        for I := 5 to cdsLetter1.FieldDefs.Count - 1 do
        begin
          MyFieldName := cdsLetter1.Fields[I].FieldName;
          if not cdsLetter1.FieldByName(MyFieldName).IsNull then
          begin
            if (cdsLetter1.FieldByName(MyFieldName).AsFloat = 0) then
            begin
              MySheet.Cells.Item[CurrentRow, I-1].HorizontalAlignment := xlRight;
              if (I mod 2) = 0 then
              begin
                if cdsLetter1.FieldByName('CodeIngred').AsInteger = 146 then
                  MySheet.Cells.Item[CurrentRow, I-1] := 'отсутств.'
                else
                  MySheet.Cells.Item[CurrentRow, I-1] := 'отсутств.';
                end
              else

                MySheet.Cells.Item[CurrentRow, I-1] := 'н. обн.';
            end

            else begin
              if tFormats.FindKey([cdsLetter1.FieldByName('CodeIngred').AsInteger]) then
              begin
                TempString := Format('%%%d.%df', [tFormatsF_All.Value, tFormatsF_Posle.Value]);
                MySheet.Cells.Item[CurrentRow, I-1].NumberFormat := Format(TempString, [0.0]);
                MySheet.Cells.Item[CurrentRow, I-1] := cdsLetter1.FieldByName(MyFieldName).AsFloat;
//===================
                if ((I mod 2) = 0) and (tIngredsI_Code.AsInteger = 125) then
                begin
                  MySheet.Cells.Item[CurrentRow, I-1] := MyPhMin + ' - ' + MyPhMax;
                  MySheet.Range[GetAlpha(I-1)+IntToStr(CurrentRow), GetAlpha(I-1)+IntToStr(CurrentRow)].HorizontalAlignment := xlRight;
                end;
//===================
              end;
            end;
          end;
        end;
      end;
      cdsLetter1.Next;
    end;

    if CurrentRow - BeginRow < 15 then
      CurrentRow := BeginRow+15;
    MySheet.Range['A'+IntToStr(CurrentRow+2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+2)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow+2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+2)].Merge(0);
    MySheet.Range['A'+IntToStr(CurrentRow+2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+2)].WrapText := True;
    MySheet.Range['A'+IntToStr(CurrentRow+2), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+2)].HorizontalAlignment := xlJustify;

    MySheet.Range['A'+IntToStr(CurrentRow+3), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow+3), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].Merge(0);
    MySheet.Range['A'+IntToStr(CurrentRow+3), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].WrapText := True;
    MySheet.Range['A'+IntToStr(CurrentRow+3), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+3)].HorizontalAlignment := xlJustify;

    MySheet.Range['A'+IntToStr(CurrentRow+5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+5)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow+5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+5)].Merge(0);
    MySheet.Range['A'+IntToStr(CurrentRow+5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+5)].WrapText := True;
    MySheet.Range['A'+IntToStr(CurrentRow+5), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow+5)].HorizontalAlignment := xlJustify;

    StringPrim1_1 := 'Примечание: 1. Нормативы утверждены Постановлением администрации г. Красноярска № 310 от 04.08.09 г. с изменениями и дополнениями от 18.11.2009 г. (распоряжение № 21-гх),';
    StringPrim1_2 := ' от 02.06.2011 г. (распоряжение № 39-гх), от 28.12.2011 г. (распоряжение № 95-гх) и от 20.11.12 г. (распоряжение № 95-гх)';
    MySheet.Cells.Item[CurrentRow + 2, 1] := StringPrim1_1 + StringPrim1_2;
    MySheet.Range['A' + IntToStr(CurrentRow + 2), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 2)].Select;
    MySheet.Range['A' + IntToStr(CurrentRow + 2), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 2)].Merge(0);
    MySheet.Range['A' + IntToStr(CurrentRow + 2), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 2)].WrapText := True;

    MySheet.Cells.Item[CurrentRow + 3, 1] := '2. Выполнение анализов по определению загрязняющих веществ в отобранной пробе сточных вод проведено в сроки, установленные ГОСТ Р 51592-2000 и НД на метод выполнения анализа.';
    MySheet.Range['A' + IntToStr(CurrentRow + 3), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 3)].Select;
    MySheet.Range['A' + IntToStr(CurrentRow + 3), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 3)].Merge(0);
    MySheet.Range['A' + IntToStr(CurrentRow + 3), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 3)].WrapText := True;
    MySheet.Range['A' + IntToStr(CurrentRow + 3), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 3)].RowHeight := 26;

    MySheet.Cells.Item[CurrentRow + 4, 1] := '3. Результаты измерений подтверждены внутренней системой обеспечения качества в соответствии с п. 4.2 ГОСТ  ИСО/ МЭК 17025-2009. Межгосударственный стандарт. "Общие требования к компетентности испытательных и калибровочных лабораторий"';
    MySheet.Range['A' + IntToStr(CurrentRow + 4), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 4)].Select;
    MySheet.Range['A' + IntToStr(CurrentRow + 4), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 4)].Merge(0);
    MySheet.Range['A' + IntToStr(CurrentRow + 4), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 4)].WrapText := True;
    MySheet.Range['A' + IntToStr(CurrentRow + 4), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 4)].RowHeight := 26;

    MySheet.Cells.Item[CurrentRow + 5, 1] := '4. *Содержание элемента рассчитано в соответствии с химической формулой.';
    MySheet.Range['A' + IntToStr(CurrentRow + 5), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 5)].Select;
    MySheet.Range['A' + IntToStr(CurrentRow + 5), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 5)].Merge(0);
    MySheet.Range['A' + IntToStr(CurrentRow + 5), GetAlpha(cdsLetter1.FieldDefs.Count-2) + IntToStr(CurrentRow + 5)].WrapText := True;

    MySheet.Cells.Item[CurrentRow+7,  1] := GetDolgnostLetter;
    MySheet.Cells.Item[CurrentRow+7,  3] := GetBossLetter;
    MySheet.Cells.Item[CurrentRow+9,  1] := GetPhoneLetter;
    MySheet.Cells.Item[CurrentRow+10, 1] := GetAddressLetter;

    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeLeft].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeRight].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeTop].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlInsideVertical].LineStyle := xlContinuous;

    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeTop].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow - 1), GetAlpha(cdsLetter1.FieldDefs.Count-2)+IntToStr(CurrentRow)].Borders[xlInsideHorizontal].Weight := xlThin;

    MySheet.Columns.AutoFit;

  finally
    cdsLetter1.Free;
    tIngreds.IndexFieldNames := 'I_Sorted';
    ExcelLetter1.Visible[LOCALE_USER_DEFAULT] := True;
    MySheet := nil;
    MyBook  := nil;
    ExcelLetter1.Disconnect;
    Screen.Cursor := MyCursor;
  end;
end;

end.

