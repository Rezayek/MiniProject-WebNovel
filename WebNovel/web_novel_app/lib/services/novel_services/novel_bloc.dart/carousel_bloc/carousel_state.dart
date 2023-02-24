import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

@immutable
abstract class CarouselState {
  const CarouselState();
}

class CarouselStateInit implements CarouselState {}


class NovelStateGetCarouselNovels implements CarouselState {
  final List<NovelModel> novels;
  final Exception? exception;
  NovelStateGetCarouselNovels({required this.novels, required this.exception});
}