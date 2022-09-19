program Laboratory;

uses
  Forms,
  uMain in 'uMain.pas' {fMain},
  uStrings in 'uStrings.pas',
  uDm in 'uDm.pas' {fDm: TDataModule},
  uAbout in 'uAbout.pas' {fAbout},
  uAreas in 'uAreas.pas' {fAreas},
  uEditArea in 'uEditArea.pas' {fEditArea},
  uIngreds in 'uIngreds.pas' {fIngreds},
  uEditIngreds in 'uEditIngreds.pas' {fEditIngreds},
  uVars in 'uVars.pas',
  uMagazins in 'uMagazins.pas' {fMagazins},
  uAddMag in 'uAddMag.pas' {fAddMag},
  uAddIngr in 'uAddIngr.pas' {fAddIngr},
  uWorks in 'uWorks.pas' {fWorks},
  uEditWork in 'uEditWork.pas' {fEditWork},
  uChoiceArea in 'uChoiceArea.pas' {fChoiceArea},
  uSearchWork in 'uSearchWork.pas' {fSearchWork},
  uActs in 'uActs.pas' {fActs},
  uEditAct in 'uEditAct.pas' {fEditAct},
  uChoiceDate in 'uChoiceDate.pas' {fChoiceDate},
  uSearchAct in 'uSearchAct.pas' {fSearchAct},
  uSearchDate in 'uSearchDate.pas' {fSearchDate},
  uNorms in 'uNorms.pas' {fNorms},
  uKns in 'uKns.pas' {fKns},
  uEditKNS in 'uEditKNS.pas' {fEditKNS},
  uChoiceKNS in 'uChoiceKNS.pas' {fChoiceKNS},
  uPrintSostav in 'uPrintSostav.pas' {fPrintSostav},
  uPrintYear in 'uPrintYear.pas' {fPrintYear},
  uPrintMonth in 'uPrintMonth.pas' {fPrintMonth},
  uPeriods in 'uPeriods.pas' {fPeriods},
  uWait in 'uWait.pas' {fWait},
  uPrintAct in 'uPrintAct.pas' {fPrintAct},
  uPeriodAct in 'uPeriodAct.pas' {fPeriodAct},
  uEditNorm in 'uEditNorm.pas' {fEditNorm},
  uEditOutput in 'uEditOutput.pas' {fEditOutput},
  uChoiceIngr in 'uChoiceIngr.pas' {fChoiceIngr},
  uValues in 'uValues.pas' {fValues},
  uValuesMags in 'uValuesMags.pas' {fValuesMags},
  uEditValueMag in 'uEditValueMag.pas' {fEditValueMag},
  uChoiceMag in 'uChoiceMag.pas' {fChoiceMag},
  uChoiceAct in 'uChoiceAct.pas' {fChoiceAct},
  uSave in 'uSave.pas' {fSave},
  uRestore in 'uRestore.pas' {fRestore},
  uGoNextYear in 'uGoNextYear.pas' {fGoNextYear},
  uFormats in 'uFormats.pas' {fFormats},
  uEditFormat in 'uEditFormat.pas' {fEditFormat},
  uMegaWork in 'uMegaWork.pas' {fMegaWork},
  uNewMega in 'uNewMega.pas' {fNewMega},
  uCurrentYear in 'uCurrentYear.pas' {fCurrentYear},
  uDoLetter in 'uDoLetter.pas' {fDoLetter},
  uLetter1Params in 'uLetter1Params.pas' {fLetter1Params},
  uSootnoshenie in 'uSootnoshenie.pas' {fSootnoshenie};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Лаборатория сточных вод v2.0';
  Application.CreateForm(TfDm, fDm);
  Application.CreateForm(TfMain, fMain);
//  Application.CreateForm(TfSootnoshenie, fSootnoshenie);
  Application.Run;
end.
