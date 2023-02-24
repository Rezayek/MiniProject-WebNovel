import 'package:flutter/foundation.dart';

@immutable
abstract class FilterEvent {
  const FilterEvent();
}

class FilterEventGetNovels implements FilterEvent {
  FilterEventGetNovels();
}

class FilterEventGetFilteredNovels implements FilterEvent {
  final int index;

  FilterEventGetFilteredNovels({required this.index});
  
}




