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

  factory NovelModel.fromRequest(Map<String, dynamic> novel) => NovelModel(
      id: novel[idNovel],
      url: novel[urlNovel],
      name: novel[nameNovel],
      author: novel[authorNovel],
      translator: novel[translatorNovel],
      rating: novel[ratingNovel],
      state: novel[stateNovel],
      releaseDate: novel[releaseDateNovel],
      coins: novel[coinsNovel],
      description: novel[descriptionNovel],
      tags: novel[tagsNovel],
      currentRank: 1,
      previousRank: 0,
      readers: 0,
      chapters: 50);
}
