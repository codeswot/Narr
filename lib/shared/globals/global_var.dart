import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:narr/core/state_management/analytics_mobx.dart';
import 'package:narr/core/state_management/reasearch_mobx.dart';
import 'package:narr/core/state_management/transaction_mobx.dart';
import 'package:narr/core/state_management/users_online_mobx.dart';
import 'package:narr/shared/models/chart_model.dart';
import 'package:narr/shared/models/user_model.dart';
import 'package:narr/shared/themes/colors.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:charts_flutter/flutter.dart' as charts;

late UserModel currentUser;
//for test purpose
String publicKey = 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh';

//analytics
UsersOnline usersOnline = UsersOnline();
Research research = Research();
Analytics analytics = Analytics();
Transaction transaction = Transaction();
Dio dio = new Dio();

Color determinePrimaryColor(context) {
  if (currentUser.user.userRole == 'researcher') {
    return NarrColors.royalGreen;
  } else if (currentUser.user.userRole == 'admin') {
    return NarrColors.chocolateBrown;
  } else if (currentUser.user.userRole == 'investor') {
    return Colors.yellow;
  } else if (currentUser.user.userRole == 'Sponsor') {
    return Colors.red;
  } else {
    return NarrColors.royalGreen;
  }
}

final data = [
  ChartModel(1, 75),
  ChartModel(2, 35),
  ChartModel(3, 10),
  ChartModel(4, 65),
  ChartModel(5, 75),
];

List<charts.Series<ChartModel, int>> chartAnalytics = [
  charts.Series<ChartModel, int>(
    id: 'Sales',
    colorFn: (_, __) => charts.Color.fromHex(code: '#00a368'),
    domainFn: (ChartModel sales, _) => sales.month,
    measureFn: (ChartModel sales, _) => sales.captured,
    data: data,
  )
];
