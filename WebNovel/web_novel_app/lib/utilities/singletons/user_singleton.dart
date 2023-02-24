

import '../../constants/enums.dart';
import '../../services/Auth/user_cloud/user_data.dart';
import 'dart:developer' as debug;

class UserSingleton {
  late UserData currentUser;
  static final _shared = UserSingleton._sharedInstance();
  UserSingleton._sharedInstance();
  factory UserSingleton() => _shared;

  void setUser(UserData user) {
    currentUser = user;
  }

  UserData getUser() {
    return currentUser;
  }

  void makeMofications(MakeModification modification, dynamic value) {
    switch (modification) {
      case MakeModification.coins:
        currentUser = UserData(
            userDataId: currentUser.userDataId,
            userId: currentUser.userId,
            name: currentUser.name,
            email: currentUser.email,
            isAuthor: currentUser.isAuthor,
            crystals: currentUser.crystals,
            gifts: currentUser.gifts,
            coins: currentUser.coins - value as int,
            level: currentUser.level,
            exp: currentUser.exp,
            imageUrl: currentUser.imageUrl);
        break;
      case MakeModification.gifts:
        // TODO: Handle this case.
        break;
    }
  }



  void reserUser() {
    currentUser = const UserData(
        userDataId: "none",
        userId: "",
        name: "",
        email: "",
        isAuthor: false,
        crystals: 0,
        gifts: [],
        coins: 0,
        level: 0,
        exp: 0,
        imageUrl: "");
  }
}
