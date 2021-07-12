// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Analytics on AnalyticsBase, Store {
  final _$blockchainAnalyticsAtom =
      Atom(name: 'AnalyticsBase.blockchainAnalytics');

  @override
  dynamic get blockchainAnalytics {
    _$blockchainAnalyticsAtom.reportRead();
    return super.blockchainAnalytics;
  }

  @override
  set blockchainAnalytics(dynamic value) {
    _$blockchainAnalyticsAtom.reportWrite(value, super.blockchainAnalytics, () {
      super.blockchainAnalytics = value;
    });
  }

  final _$AnalyticsBaseActionController =
      ActionController(name: 'AnalyticsBase');

  @override
  void getBlockchainAnalytics(dynamic analytics) {
    final _$actionInfo = _$AnalyticsBaseActionController.startAction(
        name: 'AnalyticsBase.getBlockchainAnalytics');
    try {
      return super.getBlockchainAnalytics(analytics);
    } finally {
      _$AnalyticsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
blockchainAnalytics: ${blockchainAnalytics}
    ''';
  }
}
