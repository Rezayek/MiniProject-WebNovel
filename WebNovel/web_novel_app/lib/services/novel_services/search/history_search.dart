import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:web_novel_app/services/novel_services/novels_exceptions.dart';


class HistorySearch {
  static final _shared = HistorySearch._sharedInstance();
  HistorySearch._sharedInstance();
  factory HistorySearch() => _shared;

  Future<String> get localDirectory async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async {
    final path = await localDirectory;
    var file = File('$path/novel_search_history.txt');

    if (!file.existsSync()) {
      final path = await localDirectory;
      file =
          await File('$path/novel_search_history.txt').create(recursive: true);
    }

    return file;
  }

  Future<List<String>> readData() async {
    try {
      final file = await localFile;
      final fileMap = await file.readAsString();
      if (fileMap.isEmpty) return [];
      final fileData = await json.decode(fileMap)["searchHistory"];

      if (fileData != null) {
        return List.from(fileData);
      } else {
        return [];
      }
    } on Exception {
      throw NovelExceptionFileIsMessing();
    }
  }

  Future<void> writeData(String data) async {
    try {
      final listData = await readData();
      if(!listData.contains(data) && data.isNotEmpty){
        if (listData.length > 5) {
          listData.removeAt(0);
          listData.add(data);
        } else {
          listData.add(data);
        }
      }
      await saveData(listData);
    } on Exception {
      throw NovelExceptionFileIsMessing();
    }
  }

  Future<void> removeHistory(int index) async {
    try {
      final listData = await readData();
      listData.removeAt(index);
      await saveData(listData);
    } on Exception {
      throw NovelExceptionFileIsMessing();
    }
  }

  Future<void> saveData(List<String> listData) async {
    var file = await localFile;
    await file.writeAsString(jsonEncode(SearchHistory(listData)));
  }
}

class SearchHistory {
  List<String> searchHistory;

  SearchHistory(this.searchHistory);

  Map toJson() => {
        'searchHistory': searchHistory,};
}
