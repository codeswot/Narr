import 'package:mobx/mobx.dart';

part 'users_online_mobx.g.dart';

class UsersOnline = UsersOnlineBase with _$UsersOnline;

abstract class UsersOnlineBase with Store {
  @observable
  List usersOnlineList = [];

  @action
  void getUsersOnline(List usersOnline) {
    usersOnlineList = usersOnline;
  }
}
