unit uPrintYear;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, OleServer, Excel97, Excel2000;

type
  TfPrintYear = class(TForm)
    Label1: TLabel;
    tTemp: TTable;
    tIngreds: TTable;
    tIngredsI_Code: TAutoIncField;
    tIngredsI_Name: TStringField;
    tIngredsI_Sorted: TIntegerField;
    tNorms: TTable;
    tActs: TTable;
    tNormsN_Code: TAutoIncField;
    tNormsN_W_Code: TIntegerField;
    tNormsN_I_Code: TIntegerField;
    tNormsN_Date: TDateField;
    tNormsN_Value: TFloatField;
    tNormsN_Output: TBooleanField;
    tActsAC_Code: TAutoIncField;
    tActsAC_Act: TFloatField;
    tActsAC_Date: TDateField;
    tActsAC_W_Code: TIntegerField;
    tActsAC_Plan: TBooleanField;
    tActsAC_Proba: TBooleanField;
    tValues: TTable;
    tValuesV_Code: TAutoIncField;
    tValuesV_AC_Code: TIntegerField;
    tValuesV_I_Code: TIntegerField;
    tValuesV_Value: TFloatField;
    tWorks: TTable;
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
    tIngreds2: TTable;
    tIngreds2I_Code: TAutoIncField;
    tIngreds2I_Name: TStringField;
    tIngreds2I_Sorted: TIntegerField;
    MyExcel: TExcelApplication;
    tFormats: TTable;
    tFormatsF_Code: TAutoIncField;
    tFormatsF_I_Code: TIntegerField;
    tFormatsF_Header: TStringField;
    tFormatsF_All: TIntegerField;
    tFormatsF_Posle: TIntegerField;
    tTemp2: TTable;
    tActs2: TTable;
    tActs2AC_Act: TFloatField;
    tActs2AC_Proba: TBooleanField;
  private
    { Private declarations }
    MyBook : ExcelWorkBook;
    MySheet : ExcelWorkSheet;
    CurrentRow : Integer;
    I : Integer;
    MyFormat, MyString : String;
    MyValue : Double;

    procedure CreateTempTable;
    procedure FillTable(Code : Integer);
    procedure DoExcel;
    procedure MyFinally;
  public
    { Public declarations }
    MyGroup : String;
    procedure DoPrint(Code : Integer);
    procedure BeginWork;
    procedure EndWork;
  end;

implementation

uses uVars;

{$R *.DFM}

{ TfPrintSostav }

const
  BeginRow = 3;

procedure TfPrintYear.CreateTempTable;
begin
  tTemp.DatabaseName := ExtractFilePath(ParamStr(0));
// Создаем поля
//  tTemp.FieldDefs.Clear;
  tTemp.FieldDefs.Add('TS_Code', ftAutoInc, 0, True);
  tTemp.FieldDefs.Add('TS_Type', ftInteger, 0, False);
  tTemp.FieldDefs.Add('TS_Date', ftDate, 0, False);
  tTemp.FieldDefs.Add('TS_Act', ftFloat, 0, False);
  tTemp.FieldDefs.Add('TS_Plan', ftString, 3, False);
  tIngreds.First;
  while not tIngreds.Eof do
  begin
    tTemp.FieldDefs.Add('TS_'+IntToStr(tIngredsI_Sorted.Value), ftFloat, 0, False);
    tIngreds.Next;
  end;
// Создаем индексы
  tTemp.iNdexDefs.Add('', 'TS_Code', [ixPrimary, ixUnique]);
  tTemp.iNdexDefs.Add('iDate', 'TS_Type;TS_Date;TS_Act', [ixCaseInsensitive]);
  tTemp.CreateTable;
end;

procedure TfPrintYear.DoPrint(Code : Integer);
begin
  tWorks.FindKey([Code]);
  tTemp.IndexFieldNames := 'TS_Type;TS_Date;TS_Act';
  tTemp.Open;

  FillTable(Code);

  tTemp2.DatabaseName := tTemp.DatabaseName;
  tTemp2.IndexFieldNames := 'TS_Type;TS_Date;TS_Act';
  tTemp2.Open;

  DoExcel;
  tTemp.Close;
end;

procedure TfPrintYear.FillTable(Code : Integer);
var
  MyDate : TDate;
  Min, Max, Srednee : Double;
  Cnt : Integer;
begin
// Ищем и заносим нормы
  while tTemp.RecordCount > 0 do
    tTemp.Delete;
  tNorms.SetRange([Code], [Code]);
  if tNorms.RecordCount = 0 then Exit;
  MyDate := StrToDate('01.01.1899');
  while not tNorms.Eof do
  begin
    if tNormsN_Date.Value <> MyDate then
    begin
      if tTemp.State = dsInsert then
        tTemp.Post;
      tTemp.Insert;
      MyDate := tNormsN_Date.Value;
      tTemp.FieldByName('TS_Type').Value := 0;
      tTemp.FieldByName('TS_Date').Value := MyDate;
      tTemp.FieldByName('TS_Act').Value := -1.0;
      tTemp.FieldByName('TS_Plan').Value := '';
    end;
    if tIngreds2.FindKey([tNormsN_I_Code.Value]) then
      if not tNormsN_Value.IsNull then
        tTemp.FieldByName('TS_'+IntToStr(tIngreds2I_Sorted.Value)).Value := tNormsN_Value.Value;
    tNorms.Next;
  end;
  if tTemp.State = dsInsert then tTemp.Post;
// Ищем и заносим значения отборов
  tActs.SetRange([tWorksW_Code.Value], [tWorksW_Code.Value]);
  tActs.First;
  while not tActs.Eof do
  begin
    tTemp.Insert;
    // Заголовок записи
    tTemp.FieldByName('TS_Type').Value := 0;
    tTemp.FieldByName('TS_Date').Value := tActsAC_Date.Value;
    tTemp.FieldByName('TS_Act').Value := tActsAC_Act.Value;
    if tActsAC_Plan.Value then tTemp.FieldByName('TS_Plan').Value := 'Да'
    else                        tTemp.FieldByName('TS_Plan').Value := 'Нет';
    // Значения отборов
    tIngreds.First;
    while not tIngreds.Eof do
    begin
      if tValues.FindKey([tActsAC_Code.Value, tIngredsI_Code.Value]) then
        if not tValuesV_Value.IsNull then
          tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value := tValuesV_Value.Value;
      tIngreds.Next;
    end;
    tTemp.Post;
    tActs.Next;
  end;
// Считаем значения мин., макс. и среднего
  tTemp.Insert;
  tTemp.FieldByName('TS_Type').Value := 1;
  tTemp.Post;
  tTemp.Insert;
  tTemp.FieldByName('TS_Type').Value := 2;
  tTemp.Post;
  tTemp.Insert;
  tTemp.FieldByName('TS_Type').Value := 3;
  tTemp.Post;
  tIngreds.First;
  while not tIngreds.Eof do
  begin
    Min := -1000.0; Max := 0.0; Srednee := 0.0;
    Cnt := 0;
    tTemp.SetRange([0], [0]);
    tTemp.First;
    while not tTemp.Eof do
    begin
      if tTemp.FieldByName('TS_Act').Value > 0 then
        if not tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).IsNull then
        begin
          Inc(Cnt);
          if Min = -1000.0 then
          begin
            Min     := tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value;
            Max     := tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value;
            Srednee := tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value;
          end
          else
          begin
            if tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value > Max then
              Max := tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value;
            if tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value < Min then
              Min := tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value;
            Srednee := Srednee + tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value;
          end;
        end;
      tTemp.Next;
    end;
    tTemp.CancelRange;
    if Cnt > 0 then
    begin
      tTemp.FindKey([1]);
      tTemp.Edit;
      tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value := Min;
      tTemp.Post;
      tTemp.FindKey([2]);
      tTemp.Edit;
      tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value := Max;
      tTemp.Post;
      tTemp.FindKey([3]);
      tTemp.Edit;
      tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value := Srednee / Cnt;
      tTemp.Post;
    end;
    tIngreds.Next;
  end;
end;

procedure TfPrintYear.DoExcel;
begin
    tTemp.First;
//    Inc(CurrentRow);
    MySheet.Range['A'+IntToStr(CurrentRow), GetAlpha(tIngreds.RecordCount+2)+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow), GetAlpha(tIngreds.RecordCount+2)+IntToStr(CurrentRow)].Merge(0);
    MySheet.Range['A'+IntToStr(CurrentRow), GetAlpha(tIngreds.RecordCount+2)+IntToStr(CurrentRow)].Font.Bold := True;
//    MySheet.Range['A1', GetAlpha(tIngreds.RecordCount+3)+'1'].Font.Underline := True;
    MySheet.Range['A'+IntToStr(CurrentRow), GetAlpha(tIngreds.RecordCount+2)+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
    MySheet.Cells.Item[CurrentRow,1] := FieldToVariant(tWorksW_FullName)+', '+FieldToVariant(tWorksW_Otbor);
    Inc(CurrentRow);
    while not tTemp.Eof do
    begin
      try
        case tTemp.FieldByName('TS_Type').Value of
          0 :                                                   // Нормы или измерения
            if tTemp.FieldByName('TS_Act').Value = -1.0 then  // Это нормы
            begin
              MySheet.Cells.Item[CurrentRow, 1] := 'Норма';
              MySheet.Cells.Item[CurrentRow, 2] := DateToStr(tTemp.FieldByName('TS_Date').Value);
              MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].Select;
//              MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].Font.Bold := True;
              MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].Font.Italic := True;
//              MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].Font.Color := clGreen;
            end
            else
              begin
                tTemp.Next;
                Continue;
              end;
          1 :
            begin
              MySheet.Cells.Item[CurrentRow, 1] := 'MIN';
              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].Select;
//              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].Merge(0);
              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
            end;
          2 :
            begin
              MySheet.Cells.Item[CurrentRow, 1] := 'MAX';
              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].Select;
//              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].Merge(0);
              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
            end;
          3 :
            begin
              MySheet.Cells.Item[CurrentRow, 1] := 'СРЕДНЕЕ';
              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].Select;
//              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].Merge(0);
              MySheet.Range['A'+IntToStr(CurrentRow), 'B'+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
            end;
        end;
//        MySheet.Cells.Item[CurrentRow, 3] := FieldToVariant(tTemp.FieldByName('TS_Plan'));

//        if tActs2.FindKey([tTemp.FieldByName('TS_Act').Value]) and (not tActs2AC_Proba.Value) then
//        begin
//          MySheet.Range['D'+IntToStr(CurrentRow), GetAlpha(tIngreds.RecordCount+3)+IntToStr(CurrentRow)].Select;
//          MySheet.Range['D'+IntToStr(CurrentRow), GetAlpha(tIngreds.RecordCount+3)+IntToStr(CurrentRow)].Merge(0);
//          MySheet.Range['D'+IntToStr(CurrentRow), GetAlpha(tIngreds.RecordCount+3)+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
//          MySheet.Cells.Item[CurrentRow, 4] := 'П Р О Б А   Н Е   О Т О Б Р А Н А';
//          tTemp.Next;
//          Continue;
//        end;
        I := 3;
        tIngreds.First;
        while not tIngreds.Eof do
        begin

          if not tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).IsNull then
          begin
            MySheet.Cells.Item[CurrentRow, I] := FieldToVariant(tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)));
            tFormats.FindKey([tIngredsI_Code.Value]);
            MyFormat := Format('%%%d.%df', [tFormatsF_All.Value, tFormatsF_Posle.Value]);
            MyString := GetAlpha(I)+IntToStr(CurrentRow);
            MySheet.Range[MyString, MyString].Select;
            MySheet.Range[MyString, MyString].NumberFormat  := Format(MyFormat, [0.0]);

            if (tTemp.FieldByName('TS_Type').Value = 0) and (not tTemp.FieldByName('TS_Act').IsNull) and (tTemp.FieldByName('TS_Act').Value <> -1.0) then
            begin
              MyValue := tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value;
              tTemp2.FindKey([tTemp.FieldByName('TS_Type').Value, tTemp.FieldByName('TS_Date').Value, tTemp.FieldByName('TS_Act').Value]);
              while not tTemp2.Bof do
              begin
                if (tTemp2.FieldByName('TS_Act').Value = -1) and (not tTemp2.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).IsNull) then
                begin
                  if MyValue > tTemp2.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value then
                  begin
                    MySheet.Range[MyString, MyString].Font.Color := clRed;
                    MySheet.Range[MyString, MyString].Font.Bold := True;
                    MySheet.Range[MyString, MyString].Font.Underline := True;
                  end
                  else
                  begin
                    MySheet.Range[MyString, MyString].Font.Color := clBlack;
                    MySheet.Range[MyString, MyString].Font.Bold := False;
                    MySheet.Range[MyString, MyString].Font.Underline := False;
                  end;
                  break;
                end;
                tTemp2.Prior;
              end;
            end;
            if tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)).Value < 0.0 then
              MySheet.Cells.Item[CurrentRow, I] := -1.0 * FieldToVariant(tTemp.FieldByName('TS_'+IntToStr(tIngredsI_Sorted.Value)));
          end;
          Inc(I);
          tIngreds.Next;
        end;
        Application.ProcessMessages;
      except
        ShowMessage('Ошибка. '+MyString);
        Break;
      end;
      tTemp.Next;
      Inc(CurrentRow);
    end;
end;

procedure TfPrintYear.BeginWork;
begin
  try
    CreateTempTable;
    CurrentRow := BeginRow;
    MyExcel.Disconnect;
    MyExcel.Connect;
    MyBook := MyExcel.Workbooks.Add(xlWBATWorkSheet, LOCALE_USER_DEFAULT);
    MySheet := MyBook.WorkSheets.Item[1] as ExcelWorkSheet;
    MySheet.PageSetup.Orientation := xlLandscape;
    MySheet.Cells.Item[CurrentRow, 1] := '';
    MySheet.Cells.Item[CurrentRow, 2] := 'Дата';
//    MySheet.Cells.Item[CurrentRow, 3] := 'План';
// Начало вывода шапки отчета
    MySheet.Range['A1', GetAlpha(tIngreds.RecordCount+2)+'1'].Select;
    MySheet.Range['A1', GetAlpha(tIngreds.RecordCount+2)+'1'].Merge(0);
    MySheet.Range['A1', GetAlpha(tIngreds.RecordCount+2)+'1'].Font.Bold := True;
    MySheet.Range['A1', GetAlpha(tIngreds.RecordCount+2)+'1'].Font.Underline := True;
    MySheet.Range['A1', GetAlpha(tIngreds.RecordCount+2)+'1'].HorizontalAlignment := xlCenter;
    MySheet.Cells.Item[1,1] := 'СВЕДЕНИЯ О СОСТАВЕ СТОЧНЫХ ВОД, СБРАСЫВАЕМЫХ ПРЕДПРИЯТИЯМИ г.КРАСНОЯРСКА В КАНАЛИЗАЦИОННЫЕ СЕТИ '+GetWorkName+' ЗА '+IntToStr(GetCurrentYear)+' г.        '+MyGroup;
// Конец вывода шапки отчета
    I := 3;
    tIngreds.First;
    MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].Font.Bold := True;
    MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].WrapText := True;
    MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].VerticalAlignment := xlCenter;
    MySheet.Range['A'+IntToStr(CurrentRow),'BZ'+IntToStr(CurrentRow)].HorizontalAlignment := xlCenter;
    while not tIngreds.Eof do
    begin
      tFormats.FindKey([tIngredsI_Code.Value]);
      MySheet.Cells.Item[CurrentRow, I] := tFormatsF_Header.Value;
      Inc(I);
      tIngreds.Next;
    end;
  except
    ShowMessage('Ошибка формирования файла EXCEL');
  end;
  CurrentRow := 4;
end;

procedure TfPrintYear.EndWork;
begin
  try
    Dec(I);
    Dec(CurrentRow);
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Select;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlEdgeLeft].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlEdgeTop].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlEdgeRight].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlInsideVertical].LineStyle := xlContinuous;

    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlEdgeLeft].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlEdgeTop].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlEdgeBottom].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlEdgeRight].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlInsideHorizontal].Weight := xlThin;
    MySheet.Range['A'+IntToStr(BeginRow), GetAlpha(I)+IntToStr(CurrentRow)].Borders[xlInsideVertical].Weight := xlThin;

    MySheet.Columns.AutoFit;

  except
  end;
  MyFinally;
end;

procedure TfPrintYear.MyFinally;
begin
  MyExcel.Visible[LOCALE_USER_DEFAULT] := True;
  MySheet    := nil;
  MyBook     := nil;
  MyExcel.Disconnect;
end;

end.
