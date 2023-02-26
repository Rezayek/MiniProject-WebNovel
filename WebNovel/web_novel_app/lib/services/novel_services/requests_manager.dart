
import 'dart:async';
import 'dart:math';

import 'package:web_novel_app/services/novel_services/models/chapter_model.dart';
import 'package:web_novel_app/services/novel_services/models/gifts_model.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';
import 'package:web_novel_app/services/novel_services/models/power_model.dart';

import 'package:web_novel_app/services/novel_services/models/user_gift_model.dart';
import 'package:web_novel_app/services/novel_services/novel_provider.dart';
import 'package:web_novel_app/utilities/singletons/chapters_singleton.dart';
import 'package:web_novel_app/utilities/singletons/filter_list_singleton.dart';

import '../../constants/novel_power.dart';
import '../../utilities/singletons/gifts_holder_singleton.dart';
import '../../utilities/singletons/user_singleton.dart';
import 'novels_exceptions.dart';


class RequestsManager implements NovelProvider {

  static final _shared = RequestsManager._sharedInstance();
  RequestsManager._sharedInstance();
  factory RequestsManager() => _shared;

  @override
  Future<List<NovelModel>> getNovels() async {
    try {
      // ignore: unused_local_variable
      final list = FilterListSingleton();
      Map<String, dynamic> novel = {
        'id': "1",
        'url': "",
        'name': "Reverend Insanity",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.5,
        'onGoing': "Completed",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Action", "fanatsy", "Dark", "R-18"],
        'rank': 1
      };

      Map<String, dynamic> novel1 = {
        'id': "1",
        'url': "https://picsum.photos/200/300",
        'name': "Empror palace",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.0,
        'onGoing': "Ongoing",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Romance", "Moderne", "Drama", "Japanese"],
        'rank': 2
      };

      List<NovelModel> novels =
          List.generate(10, (index) => NovelModel.fromRequest(novel));
      novels = novels +
          List.generate(10, (index) => NovelModel.fromRequest(novel1)) +
          novels;

      await Future.delayed(const Duration(seconds: 4));
      if (novels.isNotEmpty) {
        return novels;
      } else {
        throw NovelExceptionCantGetNovels;
      }
    } on Exception {
      throw NovelExceptionGeneric;
    }
  }

  @override
  Future<List<NovelModel>> getCarouselNovel() async {
    try {
      Map<String, dynamic> novel = {
        'id': "1",
        'url': "",
        'name': "Reverend Insanity",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.5,
        'onGoing': "Ongoing",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Action", "fanatsy", "Dark", "R-18"],
        'rank': 1
      };

      List<NovelModel> novels =
          List.generate(3, (index) => NovelModel.fromRequest(novel));
      //wait to test the animation
      await Future.delayed(const Duration(seconds: 10));

      if (novels.isNotEmpty) {
        return novels;
      } else {
        throw NovelExceptionCantGetNovels;
      }
    } on Exception {
      throw NovelExceptionGeneric;
    }
  }

  @override
  Future<List<NovelModel>> getNewNovels() async {
    try {
      Map<String, dynamic> novel = {
        'id': "1",
        'url': "",
        'name': "Reverend Insanity",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.5,
        'onGoing': "Ongoing",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Action", "fanatsy", "Dark", "R-18"],
        'rank': 1
      };

      Map<String, dynamic> novel2 = {
        'id': "1",
        'url': "",
        'name': "Reverend Insanity",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.0,
        'onGoing': "Ongoing",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Action", "fanatsy", "Dark", "R-18", "Romance", "Drama"],
        'rank': 1
      };

      List<NovelModel> novels =
          List.generate(5, (index) => NovelModel.fromRequest(novel)) +
              List.generate(5, (index) => NovelModel.fromRequest(novel2));

      //wait to test the animation
      await Future.delayed(const Duration(seconds: 10));

      if (novels.isNotEmpty) {
        return novels;
      } else {
        throw NovelExceptionCantGetNovels;
      }
    } on Exception {
      throw NovelExceptionGeneric;
    }
  }

  @override
  Future<List<NovelModel>> getPowerNovels() async {
    try {
      Map<String, dynamic> novel = {
        'id': "1",
        'url': "",
        'name': "Reverend Insanity",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.5,
        'onGoing': "Ongoing",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Action", "fanatsy", "Dark", "R-18"],
        'rank': 1
      };

      List<NovelModel> novels =
          List.generate(10, (index) => NovelModel.fromRequest(novel));

      //wait to test the animation
      await Future.delayed(const Duration(seconds: 10));

      if (novels.isNotEmpty) {
        return novels;
      } else {
        throw NovelExceptionCantGetNovels;
      }
    } on Exception {
      throw NovelExceptionGeneric;
    }
  }

  @override
  Future<List<NovelModel>> getReadersNovels() async {
    try {
      Map<String, dynamic> novel = {
        'id': "1",
        'url': "",
        'name': "Reverend Insanity",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.5,
        'onGoing': "Ongoing",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Action", "fanatsy", "Dark", "R-18"],
        'rank': 1
      };

      List<NovelModel> novels =
          List.generate(10, (index) => NovelModel.fromRequest(novel));

      //wait to test the animation
      await Future.delayed(const Duration(seconds: 10));

      if (novels.isNotEmpty) {
        return novels;
      } else {
        throw NovelExceptionCantGetNovels;
      }
    } on Exception {
      throw NovelExceptionGeneric;
    }
  }

  @override
  Future<Map<String, List<NovelModel>>> getRecomendedNovels() async {
    try {
      Map<String, dynamic> novel = {
        'id': "1",
        'url': "",
        'name': "Reverend Insanity",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.5,
        'onGoing': "Ongoing",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Action", "fanatsy", "Dark", "R-18"],
        'rank': 1
      };

      List<NovelModel> novels =
          List.generate(10, (index) => NovelModel.fromRequest(novel));
      final data = {
        "Action": novels,
        "Drama": novels,
        "Sci-fi": novels,
        "Horror": novels
      };

      //wait to test the animation
      await Future.delayed(const Duration(seconds: 10));

      if (novels.isNotEmpty) {
        return data;
      } else {
        throw NovelExceptionCantGetNovels;
      }
    } on Exception {
      throw NovelExceptionGeneric;
    }
  }

  @override
  Future<List<NovelModel>> getWeeklyNovels() async {
    try {
      Map<String, dynamic> novel = {
        'id': "1",
        'url': "",
        'name': "Reverend Insanity",
        'author': ["Black Wolf", "123"],
        'translator': ["Black Wolf", "123"],
        'rating': 4.5,
        'onGoing': "Ongoing",
        'releaseDate': "20/10/2018",
        'coins': 750,
        'description':
            "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
        'tags': ["Action", "fanatsy", "Dark", "R-18"],
        'rank': 1
      };

      List<NovelModel> novels =
          List.generate(10, (index) => NovelModel.fromRequest(novel));

      //wait to test the animation
      await Future.delayed(const Duration(seconds: 10));

      if (novels.isNotEmpty) {
        return novels;
      } else {
        throw NovelExceptionCantGetNovels;
      }
    } on Exception {
      throw NovelExceptionGeneric;
    }
  }

  @override
  Future<List<NovelModel>> getSearchNovels(String option) async {
    Map<String, dynamic> novel = {
      'id': "1",
      'url': "",
      'name': "Reverend Insanity",
      'author': ["Black Wolf", "123"],
      'translator': ["Black Wolf", "123"],
      'rating': 4.5,
      'onGoing': "Ongoing",
      'releaseDate': "20/10/2018",
      'coins': 750,
      'description':
          "dkjsgn  lsdfsl  gsjl dgj ksdg lsgjo sdj dg lsdkgj  sldkgj sldjg sld kgjsdlg jgods jsodfgj sl g,sdldg kjsdgj slg jso gjqeknskbnishgo o jsoeejg os osd glos .",
      'tags': ["Action", "fanatsy", "Dark", "R-18"],
      'rank': 1
    };
    List<NovelModel> novels =
        List.generate(10, (index) => NovelModel.fromRequest(novel));

    //wait to test the animation
    await Future.delayed(const Duration(seconds: 10));
    if (novels.isNotEmpty) {
      return novels;
    } else {
      throw NovelExceptionCantGetNovels;
    }
  }

  @override
  Future<List<GiftsModel>> getNovelGifts(String novelId) async {
    Map<String, dynamic> gift = {
      "userName": "Adem",
      "userImg": "",
      "giftImg": "",
      "giftName": "Pizza",
    };
    List<GiftsModel> gifts =
        List.generate(10, (index) => GiftsModel.fromSnapshot(gift));
    //wait to test the animation
    await Future.delayed(const Duration(seconds: 5));
    if (gifts.isNotEmpty) {
      return gifts;
    } else {
      throw NovelExceptionCantGetGifts;
    }
  }

  @override
  Future<List<UserGiftModel>> getUserGifts() async {
    // ignore: unused_local_variable
    final userId = UserSingleton().currentUser.userId;

    List<UserGiftModel> gifts = List.generate(
        Random().nextInt(10),
        (index) => UserGiftModel.fromSnapshot({
              "giftId": "dfs5${Random().nextInt(10)}",
              "giftName": "Cake ${Random().nextInt(10)}",
              "giftUrl": "",
            }));
    //wait to test the animation
    await Future.delayed(const Duration(seconds: 5));
    if (gifts.isNotEmpty) {
      return gifts;
    } else {
      throw NovelExceptionCantGetGifts;
    }
  }

  @override
  Future<List<UserGiftModel>> sendUserGifts(String novelId) async {
    // ignore: unused_local_variable
    final userId = UserSingleton().currentUser.userId;
    // ignore: unused_local_variable
    final giftsId = GiftsHolderSingleton().gifts;

    List<UserGiftModel> gifts = List.generate(
        Random().nextInt(10),
        (index) => UserGiftModel.fromSnapshot({
              "giftId": "dfs5${Random().nextInt(10)}",
              "giftName": "Cake ${Random().nextInt(10)}",
              "giftUrl": "",
            }));
    //wait to test the animation
    await Future.delayed(const Duration(seconds: 5));

    GiftsHolderSingleton().resetGifts();

    if (gifts.isNotEmpty) {
      return gifts;
    } else {
      throw NovelExceptionCantGetGifts;
    }
  }

  @override
  Future<Map<String, dynamic>> getPowers(String novelId) async {
    // ignore: unused_local_variable
    final userId = UserSingleton().currentUser.userId;

    List<PowerModel> powers = List.generate(
        Random().nextInt(10),
        (index) => PowerModel.fromSnapshot({
              "userId": "dfs5${Random().nextInt(10)}",
              "userName": "Adem ${Random().nextInt(10)}",
              "userImg": "",
              "givenPower": 100,
            }));
    final novelPower = {
      userPower: 150,
      novelPowers: 1500,
      novelGivenPowers: powers,
      novelPowerRank: 2
    };
    //wait to test the animation
    await Future.delayed(const Duration(seconds: 5));

    if (novelPower.isNotEmpty) {
      return novelPower;
    } else {
      throw NovelExceptionCantGetGifts;
    }
  }

  @override
  Future<Map<String, dynamic>> sendPower(String novelId) async {
    // ignore: unused_local_variable
    final userId = UserSingleton().currentUser.userId;

    List<PowerModel> powers = List.generate(
        Random().nextInt(10),
        (index) => PowerModel.fromSnapshot({
              "userId": "dfs5${Random().nextInt(10)}",
              "userName": "dem ${Random().nextInt(10)}",
              "userImg": "",
              "givenPower": 100,
            }));
    final novelPower = {
      userPower: 150,
      novelPowers: 1500,
      novelGivenPowers: powers,
      novelPowerRank: 2
    };
    //wait to test the animation
    await Future.delayed(const Duration(seconds: 5));

    if (novelPower.isNotEmpty) {
      return novelPower;
    } else {
      throw NovelExceptionCantGetGifts;
    }
  }

  @override
  Future<List<ChapterModel>> getChapters(String novelId) async {
    // ignore: unused_local_variable
    final userId = UserSingleton().currentUser.userId;
    List<ChapterModel> chapters = List.generate(
        200,
        (index) => ChapterModel.fromSnapshot({
              "chapterId": Random().nextInt(200).toString(),
              "chapterTitle":
                  "The heart of a demon never has regret enven in death ",
              "chapterRelease": "july 7-2020",
              "isLocked": true,
            }));

    //wait to test the animation
    await Future.delayed(const Duration(seconds: 5));

    if (chapters.isNotEmpty) {
      return chapters;
    } else {
      throw NovelExceptionCantGetChapters;
    }
  }

  @override
  Future<void> unLockChapter(
      String novelId, String chapterId, int chapterIndex) async {
    // ignore: unused_local_variable
    final userId = UserSingleton().currentUser.userId;

    ChaptersSingleton().unLockChapter(chapterIndex);

    //wait to test the animation
    await Future.delayed(const Duration(seconds: 5));
  }

  
}
