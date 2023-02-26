import 'package:web_novel_app/services/novel_services/models/chapter_model.dart';
import 'package:web_novel_app/services/novel_services/models/gifts_model.dart';
import 'package:web_novel_app/services/novel_services/models/user_gift_model.dart';

import 'models/novel_model.dart';

abstract class NovelProvider {
  Future<List<NovelModel>> getNovels();
  Future<List<NovelModel>> getCarouselNovel();
  Future<List<NovelModel>> getWeeklyNovels();
  Future<List<NovelModel>> getNewNovels();
  Future<List<NovelModel>> getPowerNovels();
  Future<List<NovelModel>> getReadersNovels();
  Future<Map<String, List<NovelModel>>> getRecomendedNovels();
  Future<List<NovelModel>> getSearchNovels(String option);
  Future<List<GiftsModel>> getNovelGifts(String novelId);
  Future<List<UserGiftModel>> getUserGifts();
  Future<List<UserGiftModel>> sendUserGifts(String novelId);
  Future<Map<String, dynamic>> getPowers(String novelId);
  Future<Map<String, dynamic>> sendPower(String novelId);
  Future<List<ChapterModel>> getChapters(String novelId);
  Future<void> unLockChapter(String novelId, String chapterId, int chapterIndex);

  
}
