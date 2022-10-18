import 'package:mobx/mobx.dart';

part 'analytics_mobx.g.dart';

class Analytics = AnalyticsBase with _$Analytics;

abstract class AnalyticsBase with Store {
  @observable
  dynamic blockchainAnalytics;

  @action
  void getBlockchainAnalytics(dynamic analytics) {
    blockchainAnalytics = analytics;
  }
}
