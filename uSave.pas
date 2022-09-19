unit uSave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables;

type
  TfSave = class(TForm)
    Label1: TLabel;
    ePath: TEdit;
    btnDo: TSpeedButton;
    Table1: TTable;
    ePathRar: TEdit;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetPathToRar : String;
    procedure SetPathToRar(Path : String);
    function GetPathSaveRestore : String;
    procedure SetPathSaveRestore(Path : String);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IniFiles;

procedure TfSave.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close;           end;
      VK_F2     : begin Key := 0; btnDoClick(nil); end;
    end;
end;

procedure TfSave.btnDoClick(Sender: TObject);
var
  MyList : TStringList;
  I, J : Integer;
  MyTemp, MyPath, MyCurDir : String;
  CommandString : String;
begin
  MyList := TStringList.Create;
  try
    Session.GetAliasParams('Labor_WIN32', MyList);
    for I := 0 to MyList.Count-1 do
    begin
      MyTemp := MyList[I];
      if (MyTemp[1] = 'P') and (MyTemp[2] = 'A') and
         (MyTemp[3] = 'T') and (MyTemp[4] = 'H') then
      begin
        MyPath := '';
        for J := 6 to Length(MyTemp) do
          MyPath := MyPath + MyTemp[J];
        MyCurDir := GetCurrentDir;

        ChDir(MyPath);
        if FileExists(ePath.Text) then
          DeleteFile(ePath.Text);
        CommandString := '"'+ePathRar.Text+'"'+' a "'+ePath.Text+'" *.*';
        WinExec(PChar(CommandString), SW_RESTORE);
        ChDir(MyCurDir);
        break;
      end;
    end;
  finally
    MyList.Free;
  end;
end;

function TfSave.GetPathSaveRestore : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Laboratory.ini');
  try
    Result := MyIni.ReadString('Params', 'PathToSaveAndRestore', 'a:\lab.rar');
  finally
    MyIni.Free;
  end;
end;

function TfSave.GetPathToRar : String;
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Laboratory.ini');
  try
    Result := MyIni.ReadString('Params', 'PathToRar', 'c:\Rar.exe');
  finally
    MyIni.Free;
  end;
end;

procedure TfSave.SetPathSaveRestore(Path: String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Laboratory.ini');
  try
    MyIni.WriteString('Params', 'PathToSaveAndRestore', Path);
  finally
    MyIni.Free;
  end;
end;

procedure TfSave.SetPathToRar(Path: String);
var
  MyIni : TIniFile;
begin
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Laboratory.ini');
  try
    MyIni.WriteString('Params', 'PathToRar', Path);
  finally
    MyIni.Free;
  end;
end;

procedure TfSave.FormCreate(Sender: TObject);
begin
  ePath.Text := GetPathSaveRestore;
  ePathRar.Text := GetPathToRar;
end;

procedure TfSave.FormDestroy(Sender: TObject);
begin
  SetPathSaveRestore(ePath.Text);
  SetPathToRar(ePathRar.Text);
end;

end.
