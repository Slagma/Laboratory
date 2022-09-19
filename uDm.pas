unit uDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, XPMan;

type
  TfDm = class(TDataModule)
    Images: TImageList;
    HotImages: TImageList;
    XPManifest1: TXPManifest;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDm: TfDm;

implementation

{$R *.DFM}

end.
