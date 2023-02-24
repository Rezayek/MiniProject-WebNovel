import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class UserData {
  final String userDataId;
  final String userId;
  final String name;
  final String email;
  final bool isAuthor;
  final int crystals;
  final List<dynamic> gifts;
  final int coins;
  final int level;
  final int exp;
  final String imageUrl;

  const UserData({
    required this.userDataId,
    required this.userId,
    required this.name,
    required this.email,
    required this.isAuthor,
    required this.crystals,
    required this.gifts,
    required this.coins,
    required this.level,
    required this.exp,
    required this.imageUrl,
  });

  UserData.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : userDataId = snapshot.id,
        userId = snapshot.data()['user_id'],
        name = snapshot.data()['name'],
        email = snapshot.data()['email'],
        isAuthor = snapshot.data()['isAuthor'],
        crystals = snapshot.data()['crystals'],
        gifts = snapshot.data()['gifts'],
        coins = snapshot.data()['coins'],
        level = snapshot.data()['level'],
        exp = snapshot.data()['exp'],
        imageUrl = snapshot.data()['image_url'];
}
