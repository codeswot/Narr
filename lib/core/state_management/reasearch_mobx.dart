import 'package:mobx/mobx.dart';

part 'reasearch_mobx.g.dart';

class Research = ResearchBase with _$Research;

abstract class ResearchBase with Store {
  @observable
  List readingHistoryList = [];

  @observable
  List suggestionList = [];

  @observable
  List trendingList = [];

  @action
  void getReadingHistory(List history) {
    readingHistoryList = history;
  }

  @action
  void getSuggestion(List suggestion) {
    readingHistoryList = suggestion;
  }

  @action
  void getTrending(List trending) {
    readingHistoryList = trending;
  }
}
