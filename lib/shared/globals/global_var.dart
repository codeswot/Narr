import 'package:narr/core/state_management/analytics_mobx.dart';
import 'package:narr/core/state_management/reasearch_mobx.dart';
import 'package:narr/core/state_management/transaction_mobx.dart';
import 'package:narr/core/state_management/users_online_mobx.dart';
import 'package:narr/shared/models/user_model.dart';

late UserModel currentUser;
UsersOnline usersOnline = UsersOnline();
Research research = Research();
Analytics analytics = Analytics();
Transaction transaction = Transaction();
