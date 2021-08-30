import 'dart:convert';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/models/user_model.dart';
import 'package:narr/shared/models/api_response_model.dart';
import 'package:narr/shared/screens/auth_screens/verify_account.dart';

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

        Map<String, dynamic> userObj =
            Map<String, dynamic>.from(payLoad['user']);
        String token = payLoad['token'];

        narrService.persistenceStorageService.saveItemToLocalStorage(
            storageName: 'local_token', itemBox: 'token', item: token);
        narrService.persistenceStorageService.saveItemToLocalStorage(
            storageName: 'local_user', itemBox: 'user', item: userObj);

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

  Future register(
      {required String fName,
      required String lName,
      required String dob,
      required String phone,
      required String address,
      required dynamic institution,
      required String email,
      required String password,
      List? specialization,
      List? interest,
      required context}) async {
    dynamic code;
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
          "address": address,
          "institution": institution,
          "interest": interest,
          "specialization": specialization,
        },
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (regResponse.statusCode == 200) {
        var data = jsonDecode(regResponse.body);
        code = data['statusCode'];
        narrService.routerService.nextRoute(
          context,
          VerifyAccount(),
        );
        // narrService.routerService.popUntil(context, LoginScreen());
      } else {
        var data = jsonDecode(regResponse.body);
        var errorMessage = data['message'];
        print(errorMessage);
        code = data['statusCode'];
        narrService.dialogInfoService.showToast(errorMessage);
        return data;
      }
    } catch (e) {
      print('an error Occurred => $e');
    }
    return code;
  }
}



//  endpoint: '$narrUrl/auth/login',
//         body: ,
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },