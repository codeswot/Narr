import 'dart:convert';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/models/user_model.dart';
import 'package:narr/shared/models/api_response_model.dart';

class AuthService {
  late String token;

  Future login({required email, required password}) async {
    ApiResponseModel loginResponse;
    try {
      loginResponse = await narrService.apiService.postRequest(
        '$narrUrl/auth/login',
        body: <String, dynamic>{'email': email, 'password': password},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (loginResponse.statusCode == 200) {
        var decodedData = jsonDecode(loginResponse.body);
        var payLoad = decodedData["payload"];
        UserModel user = UserModel.fromJson(payLoad);
        return user;
      } else {
        var data = jsonDecode(loginResponse.body);
        var errorMessage = data['message'];
        narrService.dialogInfoService.showToast(errorMessage);
        return data;
      }
    } catch (e) {
      print('an error Occurred => $e');
    }
    throw {'An Error Occurred Login in'};
  }

  Future<void> register(
      {required String fName,
      required String lName,
      required String dob,
      required String phone,
      required String address,
      required institution,
      required String email,
      required String password,
      required context}) async {
    // ApiResponse loginResponse;
    try {
      ApiResponseModel regResponse = await narrService.apiService.postRequest(
        '$narrUrl/auth/register',
        body: <String, dynamic>{
          "email": email,
          "password": password,
          "fName": fName,
          "lName": lName,
          "dob": dob,
          "phone": phone,
          "addredd": address,
          "institution": institution,
        },
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (regResponse.statusCode == 200) {
        var data = jsonDecode(regResponse.body);
        var message = data['message'];
        print(message);
        // narrService.routerService.popUntil(context, LoginScreen());
      } else {
        var data = jsonDecode(regResponse.body);
        var errorMessage = data['message'];
        narrService.dialogInfoService.showToast(errorMessage);
        return data;
      }
    } catch (e) {
      print('an error Occurred => $e');
    }
  }
}



//  endpoint: '$narrUrl/auth/login',
//         body: ,
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },