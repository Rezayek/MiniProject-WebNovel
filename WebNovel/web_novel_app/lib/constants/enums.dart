enum DrawerRoutes{
  acountManage,
  bookMarked,
  becomeAuthor,
  author,
  contests,
  settings,
  logOut,
}

enum FilterMenu{
  genre,
  origine,
  age,
  status

}

enum Genre{
  actions,
  scifi,
  horror,
  rommance,
  drama,
  adventure,
  dark,
  evil,
  villain
}

enum Origine{
  chinese,
  japanese,
  korean,
  arabic,
  english
}

enum Age{
  r18,
  r17,
  r15,
  r12,
  r10,
}

enum Status{
  stopped,
  ongoing,
  completed,
}

enum MakeModification{
  coins,
  gifts,
  
}

enum ReactState{
  none,
  like,
  dislike,
}

enum ControllerState{
  loading,
  exception,
  loaded
}
