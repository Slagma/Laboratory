unit uGoNextYear;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables;

type
  TfGoNextYear = class(TForm)
    tNorms: TTable;
    tNormsN_Date: TDateField;
    tActs: TTable;
    tValues: TTable;
    tWorks: TTable;
    tWorksW_Code: TAutoIncField;
    qNorms: TQuery;
    tNormsN_W_Code: TIntegerField;
    tNormsN_Code: TAutoIncField;
    tNormsN_I_Code: TIntegerField;
    tNormsN_Value: TFloatField;
    tNormsN_Output: TBooleanField;
    qNormsN_Date: TDateField;
  private
    { Private declarations }
    function GetAliasDirectory(Alias : String) : String;
  public
    { Public declarations }
    procedure DoWork;
  end;

implementation

uses uStrings, DateUtils, ShellAPI, uWait, uVars;

{$R *.dfm}

{ TfGoNextYear }

procedure TfGoNextYear.DoWork;
var
  ArhivYear, MyDir : String;
  Wait : TfWait;
  MyCursor : TCursor;
  MyDate : TDate;
begin
  if Application.MessageBox(sGoNextYear, sGoNextYearHdr, MB_YESNO+MB_ICONQUESTION) = ID_YES then
  begin
    MyCursor := Screen.Cursor;
    try
      Wait := TfWait.Create(nil);
      try
        Wait.Show;
        Wait.Update;
        Screen.Cursor := crHourGlass;
        // Сохраняем текущую БД в каталоге ./YYYY
        tNorms.Open;
        ArhivYear := IntToStr(YearOf(tNormsN_Date.Value));
        tNorms.Close;
        MyDir := ExtractFilePath(Application.ExeName)+ArhivYear;
        if DirectoryExists(MyDir) then
          ShowMessage(Format(sDirExist, [MyDir]))
        else
        begin
          Wait.WaitLabel.Caption := 'Создаем копию БД';
          Wait.Update;
          Application.ProcessMessages;
          ForceDirectories(MyDir);
          CopyDirectory(GetAliasDirectory('Labor_WIN32'), ExtractFilePath(Application.ExeName)+ArhivYear+'\');
          // Подготовливаем "новую" БД
          if FileExists(GetAliasDirectory('Labor_WIN32')+'\paradox.lck') then
            DeleteFile(GetAliasDirectory('Labor_WIN32')+'\paradox.lck');
          if FileExists(GetAliasDirectory('Labor_WIN32')+'\pdoxusrs.lck') then
            DeleteFile(GetAliasDirectory('Labor_WIN32')+'\pdoxusrs.lck');

          Wait.WaitLabel.Caption := 'Переносим данные...';
          Wait.Update;
          Application.ProcessMessages;

          tActs.EmptyTable;
          tValues.EmptyTable;
          tNorms.Open;
          tWorks.Open;
          MyDate := StrToDate('01.01.'+IntToStr(StrToInt(ArhivYear)+1));
          while not tWorks.Eof do
          begin
            qNorms.Close;
            qNorms.ParamByName('MyCode').Value := tWorksW_Code.Value;
            qNorms.Open;
            qNorms.Last;
            tNorms.SetRange([tWorksW_Code.Value, qNormsN_Date.Value], [tWorksW_Code.Value, qNormsN_Date.Value]);
            while not tNorms.Eof do
            begin
              tNorms.Edit;
              tNormsN_Date.Value := MyDate;
              tNorms.Post;
              Application.ProcessMessages;
            end;
            tNorms.CancelRange;
            tWorks.Next;
          end;
          qNorms.Close;
          // Удаляем все лишние записи
          tNorms.First;
          while not tNorms.Eof do
          begin
            if tNormsN_Date.Value < MyDate then
              tNorms.Delete
            else
              tNorms.Next;
            Application.ProcessMessages;
          end;
          ShowMessage(Format(sGoNextMess, [StrToInt(ArhivYear)+1]));
        end;
      finally
        Wait.Free;
      end;
    finally
      Screen.Cursor := MyCursor;
    end;
  end;
end;

function TfGoNextYear.GetAliasDirectory(Alias: String): String;
var
  MyList : TStringList;
  I, J   : Integer;
  MyTemp : String;
begin
  Result := '';
  MyList := TStringList.Create;
  try
    Session.GetAliasParams('Labor_WIN32', MyList);
    for I := 0 to MyList.Count-1 do
    begin
      MyTemp := MyList[I];
      if (MyTemp[1] = 'P') and (MyTemp[2] = 'A') and
         (MyTemp[3] = 'T') and (MyTemp[4] = 'H') then
      begin
        for J := 6 to Length(MyTemp) do
          Result := Result + MyTemp[J];
        break;
      end;
    end;
  finally
    MyList.Free;
  end;
end;

end.
