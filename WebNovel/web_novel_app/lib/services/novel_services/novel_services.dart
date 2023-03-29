import 'package:web_novel_app/services/novel_services/models/chapter_general_model.dart';
import 'package:web_novel_app/services/novel_services/models/chapter_model.dart';
import 'package:web_novel_app/services/novel_services/models/comment_model.dart';
import 'package:web_novel_app/services/novel_services/models/gifts_model.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';
import 'package:web_novel_app/services/novel_services/models/user_gift_model.dart';
import 'package:web_novel_app/services/novel_services/novel_provider.dart';
import 'package:web_novel_app/services/novel_services/requests_manager.dart';

class NovelServices implements NovelProvider {
  final NovelProvider provider;

  static final _shared = NovelServices._sharedInstance(RequestsManager());
  NovelServices._sharedInstance(this.provider);
  factory NovelServices() => _shared;


  //factory NovelServices.firebase() => NovelServices(RequestsManager());
  @override
  Future<List<NovelModel>> getNovels() => provider.getNovels();

  @override
  Future<List<NovelModel>> getCarouselNovel() => provider.getCarouselNovel();

  @override
  Future<List<NovelModel>> getNewNovels() => provider.getNewNovels();

  @override
  Future<List<NovelModel>> getPowerNovels() => provider.getPowerNovels();

  @override
  Future<List<NovelModel>> getReadersNovels() => provider.getReadersNovels();

  @override
  Future<Map<String, List<NovelModel>>> getRecomendedNovels() => provider.getRecomendedNovels();

  @override
  Future<List<NovelModel>> getWeeklyNovels() => provider.getWeeklyNovels();

  @override
  Future<List<NovelModel>> getSearchNovels(String option) => provider.getSearchNovels(option);

  @override
  Future<List<GiftsModel>> getNovelGifts(String novelId) => provider.getNovelGifts(novelId);

  @override
  Future<List<UserGiftModel>> getUserGifts() => provider.getUserGifts();
  @override
  Future<List<UserGiftModel>> sendUserGifts(String novelId) => provider.sendUserGifts(novelId);
  
  @override
  Future<Map<String, dynamic>> getPowers(String novelId) => provider.getPowers(novelId);
  
  @override
  Future<Map<String, dynamic>> sendPower(String novelId) => provider.sendPower(novelId);

  @override
  Future<List<ChapterModel>> getChapters(String novelId) => provider.getChapters(novelId);

  @override
  Future<void> unLockChapter(String novelId, int chapterId, int chapterIndex) => provider.unLockChapter(novelId, chapterId, chapterIndex);

  @override
  Future<ChapterGeneralModel> getChapterContent(int chapterId) => provider.getChapterContent(chapterId);

  @override
  Future<void> addChapterComments(int chapterId, String content) => provider.addChapterComments(chapterId, content);

  @override
  Future<void> addTextComments(int textId, String content) => provider.addTextComments(textId, content);

  @override
  Future<List<CommentModel>> getChapterComments(int chapterId) => provider.getChapterComments(chapterId);

  @override
  Future<List<CommentModel>> getTextComments(int textId) => provider.getTextComments(textId);
}
