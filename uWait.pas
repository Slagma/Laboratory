unit uWait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfWait = class(TForm)
    WaitLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fWait: TfWait;

implementation

{$R *.dfm}

end.
