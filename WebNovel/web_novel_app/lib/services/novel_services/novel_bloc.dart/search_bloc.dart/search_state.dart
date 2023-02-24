import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class NovelStateSearchInit implements SearchState {}

class NovelStateSearchWaiting implements SearchState {}

class NovelStateGetSearchHistory implements SearchState {
  final List<String> options;
  final Exception? exception;
  NovelStateGetSearchHistory({required this.options, required this.exception});
}

class NovelStateGetSearchResult implements SearchState {
  final String option;
  final List<NovelModel> novels;
  final Exception? exception;

  NovelStateGetSearchResult({
    required this.option,
    required this.novels,
    required this.exception,
  });
}
