import 'package:web_novel_app/services/novel_services/models/novel_model.dart';
import 'dart:developer' as debug;

import '../../constants/enums.dart';

class FilterListSingleton {
  late List<NovelModel> novels;
  late List<NovelModel> newFilteredList = [];
  Map<FilterMenu, List<String>> currentSelectedTags = {
    FilterMenu.age: [],
    FilterMenu.genre: [],
    FilterMenu.origine: [],
    FilterMenu.status: ["Ongoing", "Completed", "Stopped"]
  };

  static final _shared = FilterListSingleton._sharedInstance();
  FilterListSingleton._sharedInstance();
  factory FilterListSingleton() => _shared;

  void setNovels(List<NovelModel> novels) => this.novels = novels;

  void filterNovels() {
    newFilteredList = [];
    if (!chechMap()) return;

    for (var element in novels) {
      if (checkNovelTagList(element.tags) && statusCheck(element.state)) {
        debug.log("added");
        newFilteredList.add(element);
      }
    }
  }

  bool statusCheck(String value) {
    if (currentSelectedTags[FilterMenu.status]!.contains(value)) {
      return true;
    } else {
      return false;
    }
  }

  bool checkNovelTagList(List<String> tags) {
    int index = 0;
    while (index < tags.length) {
      if (tagCheck(tags[index])) {
        return true;
      } else {
        index++;
      }
    }
    return false;
  }

  bool tagCheck(String value) {
    if (currentSelectedTags[FilterMenu.genre]!.contains(value)) return true;
    if (currentSelectedTags[FilterMenu.age]!.contains(value)) return true;
    if (currentSelectedTags[FilterMenu.origine]!.contains(value)) return true;
    return false;
  }

  List<NovelModel> getList(int index) {
    int index1 = index * 20;
    int index2 = 20 + (index  * 20);
    if (chechMap()) {
      return newFilteredList.sublist(
          index1,
          index2 > newFilteredList.length
              ? newFilteredList.length
              : index2 );
    } else {
      if (currentSelectedTags[FilterMenu.status]!.isEmpty) {
        asignNewList(false);
      }

      return novels.sublist(
          index1, index2  > novels.length ? novels.length : index2 );
    }
  }

  int maxIndex() {
    if (chechMap()) {
      return (newFilteredList.length / 20).ceil();
    }else {
      return (novels.length / 20).ceil();
    }
  }

  int lengthOfcurrent() {
    if (chechMap()) {
      return newFilteredList.length;
    }else {
      return novels.length;
    }
  }

  bool chechMap() {
    if (currentSelectedTags[FilterMenu.status] != []) {
      if (currentSelectedTags[FilterMenu.genre]!.isEmpty &&
          currentSelectedTags[FilterMenu.origine]!.isEmpty &&
          currentSelectedTags[FilterMenu.age]!.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  void addFilterValue(FilterMenu filterMenu, String value) {
    switch (filterMenu) {
      case FilterMenu.genre:
        addValue(currentSelectedTags[FilterMenu.genre], value);
        break;
      case FilterMenu.origine:
        addValue(currentSelectedTags[FilterMenu.origine], value);
        break;
      case FilterMenu.age:
        addValue(currentSelectedTags[FilterMenu.age], value);
        break;
      case FilterMenu.status:
        addValue(currentSelectedTags[FilterMenu.status], value);
        break;
    }
  }

  void removeFilterValue(FilterMenu filterMenu, String value) {
    switch (filterMenu) {
      case FilterMenu.genre:
        removeValue(currentSelectedTags[FilterMenu.genre], value);
        break;
      case FilterMenu.origine:
        removeValue(currentSelectedTags[FilterMenu.origine], value);
        break;
      case FilterMenu.age:
        removeValue(currentSelectedTags[FilterMenu.age], value);
        break;
      case FilterMenu.status:
        removeValue(currentSelectedTags[FilterMenu.status], value);
        break;
    }
  }

  void addValue(List<String>? list, value) {
    if (list != null) {
      if (!list.contains(value)) {
        list.add(value);
      }
    }
  }

  void removeValue(List<String>? list, value) {
    if (list != null) {
      if (list.contains(value)) {
        list.remove(value);
      }
    }
  }

  void asignNewList(bool isTrue) {
    if (!isTrue) {
      currentSelectedTags = {
        FilterMenu.age: [],
        FilterMenu.genre: [],
        FilterMenu.origine: [],
        FilterMenu.status: ["Ongoing", "Completed", "Stopped"]
      };
    }
  }

  bool isInTheList(FilterMenu filterMenu, String value) {
    if (checkPresence(currentSelectedTags[FilterMenu.genre], value)) {
      return true;
    }
    if (checkPresence(currentSelectedTags[FilterMenu.origine], value)) {
      return true;
    }
    if (checkPresence(currentSelectedTags[FilterMenu.age], value)) {
      return true;
    }
    if (checkPresence(currentSelectedTags[FilterMenu.status], value)) {
      return true;
    }
    return false;
  }

  bool checkPresence(List<String>? list, value) {
    if (list != null) {
      if (list.contains(value)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
