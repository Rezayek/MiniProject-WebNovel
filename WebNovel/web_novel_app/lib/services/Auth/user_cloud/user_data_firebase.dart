import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_novel_app/services/Auth/user_cloud/user_cloud_exception.dart';


import 'user_data.dart';


class UserDataFirebase {
  final users = FirebaseFirestore.instance.collection('Users');

  //signleton-------------------------------------------

  static final _shared = UserDataFirebase._sharedInstance();
  UserDataFirebase._sharedInstance();
  factory UserDataFirebase() => _shared;
  //----------------------------------------------------

  Future<void> creatNewUserData({
    required String userId,
    required String name,
    required String email,
  }) async {
    await users.add({
      'user_id': userId,
      'name': name,
      'email': email,
      'isAuthor': false,
      'crystals': 2,
      'gifts': [],
      'coins': 0,
      'level': 0,
      'exp': 0,
      'image_url': '',
    });
  }

  Future<List<UserData>> getUserData({required String userAcountId}) async {
    try {
      
      final usersData = await users
          .where(
            'user_id',
            isEqualTo: userAcountId,
          )
          .get()
          .then(
            (value) =>
                value.docs.map((doc) => UserData.fromSnapshot(doc)).toList(),
          );
      return usersData ;
    } catch (e) {
      throw CouldNotFoundUserDataException();
    }
  }
}
