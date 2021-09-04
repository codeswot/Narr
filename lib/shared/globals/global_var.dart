import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:narr/core/state_management/analytics_mobx.dart';
import 'package:narr/core/state_management/reasearch_mobx.dart';
import 'package:narr/core/state_management/transaction_mobx.dart';
import 'package:narr/core/state_management/users_online_mobx.dart';
import 'package:narr/shared/models/user_model.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:url_launcher/url_launcher.dart';

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

void launchURL(linkUrl) async => await canLaunch(linkUrl)
    ? await launch(linkUrl)
    : throw 'Could not launch $linkUrl';
