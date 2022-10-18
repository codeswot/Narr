// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_online_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersOnline on UsersOnlineBase, Store {
  final _$usersOnlineListAtom = Atom(name: 'UsersOnlineBase.usersOnlineList');

  @override
  List<dynamic> get usersOnlineList {
    _$usersOnlineListAtom.reportRead();
    return super.usersOnlineList;
  }

  @override
  set usersOnlineList(List<dynamic> value) {
    _$usersOnlineListAtom.reportWrite(value, super.usersOnlineList, () {
      super.usersOnlineList = value;
    });
  }

  final _$UsersOnlineBaseActionController =
      ActionController(name: 'UsersOnlineBase');

  @override
  void getUsersOnline(List<dynamic> usersOnline) {
    final _$actionInfo = _$UsersOnlineBaseActionController.startAction(
        name: 'UsersOnlineBase.getUsersOnline');
    try {
      return super.getUsersOnline(usersOnline);
    } finally {
      _$UsersOnlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usersOnlineList: ${usersOnlineList}
    ''';
  }
}
