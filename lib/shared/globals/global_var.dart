import 'package:flutter/material.dart';
import 'package:narr/core/state_management/analytics_mobx.dart';
import 'package:narr/core/state_management/reasearch_mobx.dart';
import 'package:narr/core/state_management/transaction_mobx.dart';
import 'package:narr/core/state_management/users_online_mobx.dart';
import 'package:narr/shared/models/user_model.dart';
import 'package:narr/shared/themes/colors.dart';

late UserModel currentUser;
UsersOnline usersOnline = UsersOnline();
Research research = Research();
Analytics analytics = Analytics();
Transaction transaction = Transaction();

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
