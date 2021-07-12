import 'dart:convert';

import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

late IO.Socket socket;

class SocketService {
  Future<void> connectToSocketServer() async {
    try {
      // Configure socket transports must be sepecified
      socket = IO.io(narrSocketUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });

      // Connect to websocket
      socket.connect();

      // Handle socket events
      socket.on('connect', (data) {
        print('Connected to socket server ');
      });
    } catch (e) {
      print("Error connecting to socket server $e");
    }
  }

  Future<void> handleLoginEvent({
    required String token,
    required dynamic user,
  }) async {
    try {
      //Emitting the login event with token and user object
      socket.emit(
        'LOGIN',
        {"token": token, "user": user},
      );
      List usersOnlineArray = [];
      //listening for an event called EVENT:USERS:CURRENTLY:ONLINE;
      socket.on('EVENT:USERS:CURRENTLY:ONLINE', (data) {
        //decodeing the response gotten from the server
        final decodedData = jsonDecode(data);
        usersOnlineArray = decodedData['usersOnline'];

        usersOnline.getUsersOnline(usersOnlineArray);
        research.getReadingHistory(decodedData['readingHistory']);
        research.getSuggestion(decodedData['suggestion']);
        research.getTrending(decodedData['trending']);

        //listening for an event called EVENT:USER:LOGIN
        socket.on('EVENT:USER:LOGIN', (data) {
          final decodedData = jsonDecode(data);
          usersOnlineArray.add(decodedData);
          final jsonList =
              usersOnlineArray.map((item) => jsonEncode(item)).toList();

          // using toSet - toList strategy
          final uniqueJsonList = jsonList.toSet().toList();

          // convert each item back to the original form using JSON decoding
          final result =
              uniqueJsonList.map((item) => jsonDecode(item)).toList();

          usersOnline.getUsersOnline(result);
          print(usersOnline.usersOnlineList.length);
        });

        // tempArray = users;
      });

      socket.on('EVENT:USER:LOGOUT', (data) {
        final decodedData = jsonDecode(data);
        // String fullName = jsonDecode(data)['fullName'];
        String logoutEmail = decodedData['email'];

        for (var i = 0; i < usersOnlineArray.length; i++) {
          var obj = usersOnlineArray[i];
          if (obj['email'] == logoutEmail) {
            usersOnlineArray.removeAt(i);
            usersOnline.getUsersOnline(usersOnlineArray);
          }
        }
      });
    } catch (err) {
      print('Error >>> $err');
    }
  }

  void hnadleLogOutEvent() {
    try {
      socket.emit('LOGOUT');
    } catch (e) {
      print('log out error ::==> $e');
    }
  }
}
