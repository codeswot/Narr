import 'package:hive/hive.dart';

class PersistenceStorageService {
  //token box
  void saveItemToLocalStorage(
      {required String storageName,
      required String itemBox,
      dynamic item}) async {
    var tokenStore = await Hive.openBox(storageName);
    tokenStore.put(itemBox, item);
  }

  Future<String> getLocalToken() async {
    var store = await Hive.openBox('local_token');
    String savedData = await store.get('token');
    return savedData;
  }

//User box

  Future getLocalUser() async {
    var store = await Hive.openBox('local_user');
    var savedUser = await store.get('user');
    Map<String, dynamic> hashedUser =
        savedUser.map((key, value) => MapEntry(key.toString(), value));

    return hashedUser;
  }

  clearToken() async {
    Hive.box('local_user').clear();
    Hive.box('local_token').clear();
  }
}
