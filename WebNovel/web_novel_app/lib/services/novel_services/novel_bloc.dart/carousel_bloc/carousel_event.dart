import 'package:flutter/foundation.dart';

@immutable
abstract class CarouselEvent {
  const CarouselEvent();
}

class NovelEventGetCarouselNovels implements CarouselEvent {}