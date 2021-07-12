// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reasearch_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Research on ResearchBase, Store {
  final _$readingHistoryListAtom =
      Atom(name: 'ResearchBase.readingHistoryList');

  @override
  List<dynamic> get readingHistoryList {
    _$readingHistoryListAtom.reportRead();
    return super.readingHistoryList;
  }

  @override
  set readingHistoryList(List<dynamic> value) {
    _$readingHistoryListAtom.reportWrite(value, super.readingHistoryList, () {
      super.readingHistoryList = value;
    });
  }

  final _$suggestionListAtom = Atom(name: 'ResearchBase.suggestionList');

  @override
  List<dynamic> get suggestionList {
    _$suggestionListAtom.reportRead();
    return super.suggestionList;
  }

  @override
  set suggestionList(List<dynamic> value) {
    _$suggestionListAtom.reportWrite(value, super.suggestionList, () {
      super.suggestionList = value;
    });
  }

  final _$trendingListAtom = Atom(name: 'ResearchBase.trendingList');

  @override
  List<dynamic> get trendingList {
    _$trendingListAtom.reportRead();
    return super.trendingList;
  }

  @override
  set trendingList(List<dynamic> value) {
    _$trendingListAtom.reportWrite(value, super.trendingList, () {
      super.trendingList = value;
    });
  }

  final _$ResearchBaseActionController = ActionController(name: 'ResearchBase');

  @override
  void getReadingHistory(List<dynamic> history) {
    final _$actionInfo = _$ResearchBaseActionController.startAction(
        name: 'ResearchBase.getReadingHistory');
    try {
      return super.getReadingHistory(history);
    } finally {
      _$ResearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getSuggestion(List<dynamic> suggestion) {
    final _$actionInfo = _$ResearchBaseActionController.startAction(
        name: 'ResearchBase.getSuggestion');
    try {
      return super.getSuggestion(suggestion);
    } finally {
      _$ResearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getTrending(List<dynamic> trending) {
    final _$actionInfo = _$ResearchBaseActionController.startAction(
        name: 'ResearchBase.getTrending');
    try {
      return super.getTrending(trending);
    } finally {
      _$ResearchBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
readingHistoryList: ${readingHistoryList},
suggestionList: ${suggestionList},
trendingList: ${trendingList}
    ''';
  }
}
