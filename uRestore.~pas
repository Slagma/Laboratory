unit uRestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables;

type
  TfRestore = class(TForm)
    Label1: TLabel;
    ePath: TEdit;
    btnDo: TSpeedButton;
    Table1: TTable;
    Label2: TLabel;
    ePathRar: TEdit;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  
procedure TfRestore.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE : begin Key := 0; Close;           end;
      VK_F2     : begin Key := 0; btnDoClick(nil); end;
    end;
end;

procedure TfRestore.btnDoClick(Sender: TObject);
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
        CommandString := '"'+ePathRar.Text+'"'+' x -y "'+ePath.Text+'" *.*';
        WinExec(PChar(CommandString), SW_RESTORE);
//        WinExec(PChar('c:\arj32.exe x -y "'+ePath.Text+'" *.*'), SW_RESTORE);
        ChDir(MyCurDir);
        break;
      end;
    end;
  finally
    MyList.Free;
  end;
end;

function TfRestore.GetPathSaveRestore : String;
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

function TfRestore.GetPathToRar : String;
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

procedure TfRestore.SetPathSaveRestore(Path: String);
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

procedure TfRestore.SetPathToRar(Path: String);
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

procedure TfRestore.FormCreate(Sender: TObject);
begin
  ePath.Text := GetPathSaveRestore;
  ePathRar.Text := GetPathToRar;
end;

procedure TfRestore.FormDestroy(Sender: TObject);
begin
  SetPathSaveRestore(ePath.Text);
  SetPathToRar(ePathRar.Text);
end;

procedure TfRestore.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    ePath.Text := OpenDialog1.FileName;
end;

end.
