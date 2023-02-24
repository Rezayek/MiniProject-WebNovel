import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

@immutable
abstract class FilterState {
  const FilterState();
}

class FilterStateInit implements FilterState {}

class FilterStateGetNovels implements FilterState {
  final List<NovelModel> novels;
  final Exception? exception;
  FilterStateGetNovels({required this.novels, required this.exception});
}

class FilterWaiting implements FilterState {}

class FilterStateGetFilteredNovels implements FilterState {
  final List<NovelModel> novels;
  final Exception? exception;
  FilterStateGetFilteredNovels({required this.novels, required this.exception});
}


