import 'package:flutter/foundation.dart';

@immutable
abstract class NewEvent {
  const NewEvent();
}



class NovelEventGetNovels implements NewEvent {
  final int index;

  NovelEventGetNovels({required this.index});
}



class NovelEventGetNewNovels implements NewEvent {}