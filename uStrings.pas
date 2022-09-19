unit uStrings;

interface

const
  sAppClose = 'Выйти из программы?';
  sAppCloseH = 'Выход из программы';

  sDelArea = 'Удалить район "%s"?';
  sDelAreaCap = 'Удаление района';

  sDelIngred    = 'Удалить ингредиент "%s"?';
  sDelIngredCap = 'Удаление ингредиента';

  sEditArea = 'Редактирование района';
  sEditIngred = 'Редактирование ингредиента';

  sNewMag = 'ЖУРНАЛ № %d';
  sEditMag = 'Редактирование журнала';

  sDelMag = 'Удалить журнал "%s"?';
  sDelMagCap = 'Удаление журнала';
  sDelIngr = 'Удалить ингредиент "%s" из журнала "%s"?';
  sDelIngrCap = 'Удаление ингредиента из журнала';

  sAddIngrInMag = 'Добавить ингредиент в журнал %s';

  sEditWork = 'Редактированиие предприятия';

  sDelWork = 'Удалить предприятие?';
  sDelWorkCap = 'Удаление предприятия';

  sDelAct = 'Удалить акт № %g?';
  sDelActCap = 'Удаление акта';

  sIngred = 'Список ингредиентов';
  sMovedIngred = 'Режим переноса ингредиента';
  sEndMoved = 'Вначале завершите режим переноса ингредиента';

  sDelKNS = 'Удалить КНС "%s"?';
  sDelKNSHdr = 'Удаление КНС';

  sDelNorms = 'Удалить нормы за %s?';
  sDelNormsHdr = 'Удаление норм';

  sDelIngrNorms = 'Удалить ингредиент "%s"?';
  sDelIngrNormsHdr = 'Удаление ингредиента';

  sGoNextYear = 'Вы действительно хотите перейти на следующий год?';
  sGoNextYearHdr = 'Переход на следующий год';
  sGoNextMess = 'Переход на %d год завершен';
  sDirExist = 'Каталог "%s" уже существует (переход уже осуществлялся)';
  
// Для формы "О программе..."
  sFreeMemory100     = 'Свободно памяти в процентах %d%%';
  sAllMemory         = 'Всего физической памяти %.2f Mb';
  sFreeMemory        = 'Свободно физической памяти %.2f Mb';
  sAllSweepMemory    = 'Общий размер файлов подкачки %.2f Mb';
  sFreeSweepMemory   = 'Доступно в файлах подкачки %.2f Mb';
  sAllVirtualMemory  = 'Общий размер виртуальной памяти %.2f Mb';
  sFreeVirtualMemory = 'Доступно виртуальной памяти %.2f Mb';

// Сообщения об ошибках
  erLengthArea = 'Название района должно быть введено';
  erArea2 = 'Такой район уже есть';
    
  erLengthIngred = 'Название района должно быть введено';
  erIngred2 = 'Такой район уже есть';

  erShortLength = 'Короткое название предприятия должно быть введено';
  erOtborLength = 'Место оттбора должно быть ввведено';

  erLengthAct = 'Надо ввести номер акта';
  erIsAct = 'Такой акт уже есть';

  erLengthWork = 'Надо выбрать предприятие';

  erNotValue = 'Номер акта должен быть числом';

  erNormDate = 'Нормы с такими датами уже есть';

  sMegaCaption = 'Список "мегапредприятий"';
  sNewMega = 'Новое "мегапредприятиие"';
  sEditMega = 'Редактирование "ммегапредприятия"';
implementation

end.
