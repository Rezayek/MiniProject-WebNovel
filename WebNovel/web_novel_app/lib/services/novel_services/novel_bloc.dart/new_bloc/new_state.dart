import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

@immutable
abstract class NewState {
  const NewState();
}

class NewStateInit implements NewState {}


class NovelStateGetNewNovels implements NewState {
  final List<NovelModel> novels;
  final Exception? exception;
  NovelStateGetNewNovels({required this.novels, required this.exception});
}