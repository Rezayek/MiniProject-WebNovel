
import 'package:flutter/material.dart';

@immutable
abstract class IndexEvent {
  const IndexEvent();
}

class IndexEventGetNovels implements IndexEvent {
  final int index;
  final BuildContext context;

  IndexEventGetNovels({required this.index, required this.context});
}