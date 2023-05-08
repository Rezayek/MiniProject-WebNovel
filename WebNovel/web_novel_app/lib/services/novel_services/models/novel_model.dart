import 'package:flutter/foundation.dart';
import '../../../constants/novel_map_fields.dart';

@immutable
class NovelModel {
  final String id;
  final String url;
  final String name;
  final List<String> author;
  final List<String> translator;
  final double rating;
  final String state;
  final String releaseDate;
  final int coins;
  final String description;
  final List<String> tags;
  final int currentRank;
  final int previousRank;
  final int readers;
  final int chapters;

  const NovelModel({
    required this.id,
    required this.url,
    required this.name,
    required this.author,
    required this.translator,
    required this.rating,
    required this.state,
    required this.releaseDate,
    required this.coins,
    required this.description,
    required this.tags,
    required this.currentRank,
    required this.previousRank,
    required this.readers,
    required this.chapters,
  });
  // novel[urlNovel]
  factory NovelModel.fromRequest(Map<String, dynamic> novel) => NovelModel(
      id: novel[idNovel] ?? "1",
      url: "",
      name: novel[nameNovel],
      author: List<String>.from(novel[authorNovel].cast<dynamic>()),
      translator: List<String>.from(novel[translatorNovel].cast<dynamic>()),
      rating: novel[ratingNovel].toDouble(),
      state: novel[stateNovel].toString(),
      releaseDate: novel[releaseDateNovel].toString(),
      coins: novel[coinsNovel],
      description: novel[descriptionNovel],
      tags: List<String>.from(novel[tagsNovel].cast<dynamic>()),
      currentRank: (() {
        try {
          return int.parse(novel[currentRankNovel].toString());
        } catch (e) {
          return 0;
        }
      })(),
      previousRank: (() {
        try {
          return int.parse(novel[previousRankNovel].toString());
        } catch (e) {
          return 0;
        }
      })(),
      readers: (() {
        try {
          return int.parse(novel[readerNovel].toString());
        } catch (e) {
          return 0;
        }
      })(),
      chapters: (() {
        try {
          return int.parse(novel[chaptersNovel].toString());
        } catch (e) {
          return 0;
        }
      })());
}
