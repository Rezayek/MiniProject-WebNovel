import 'package:flutter/foundation.dart';


@immutable
abstract class IndexState {
  const IndexState();
}

class IndexStateInit implements IndexState {}

class IndexStateGetNovel implements IndexState {
  final int currentIndex;
  IndexStateGetNovel({required this.currentIndex});
}
