unit uAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfAbout = class(TForm)
    Panel: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Bevel: TBevel;
    Info: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uStrings;

{$R *.DFM}

procedure TfAbout.FormCreate(Sender: TObject);
var
  MS : TMemoryStatus;
begin
  MS.dwLength := SizeOf(MS);
  GlobalMemoryStatus(MS);
  with Info.Lines do
  begin
    Add(Format(sFreeMemory100,     [100 - MS.dwMemoryLoad]));
    Add(Format(sAllMemory,         [(MS.dwTotalPhys /1024.0) /1024.0]));
    Add(Format(sFreeMemory,        [(MS.dwAvailPhys / 1024.0) / 1024]));
    Add(Format(sAllSweepMemory,    [(MS.dwTotalPageFile / 1024.0) / 1024]));
    Add(Format(sFreeSweepMemory,   [(MS.dwAvailPageFile / 1024.0) / 1024]));
    Add(Format(sAllVirtualMemory,  [(MS.dwTotalVirtual / 1024.0) / 1024]));
    Add(Format(sFreeVirtualMemory, [(MS.dwAvailVirtual / 1024.0) / 1024]));
  end;
end;

procedure TfAbout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_RETURN, VK_ESCAPE : begin Key := 0; Close; end;
    end;
end;

end.
