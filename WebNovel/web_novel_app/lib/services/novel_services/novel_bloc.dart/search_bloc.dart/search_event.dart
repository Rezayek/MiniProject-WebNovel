import 'package:flutter/foundation.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class NovelEventGetSearchHistory implements SearchEvent{

}

class NovelEventRemoveSearchHistory implements SearchEvent {
  final int index;

  NovelEventRemoveSearchHistory({required this.index});
}


class NovelEventGetSearchResult implements SearchEvent {
  final String option;

  NovelEventGetSearchResult ({required this.option});
}
