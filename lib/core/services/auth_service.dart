import 'dart:convert';
import 'dart:io';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/models/user_model.dart';
import 'package:narr/shared/models/api_response_model.dart';
import 'package:narr/shared/screens/auth/verify_account.dart';

import '../../shared/globals/global_var.dart';

class AuthService {
  late String token;

  // Future login({required email, required password}) async {
  //   ApiResponseModel loginResponse;
  //   try {
  //     loginResponse = await narrService.apiService.postRequest(
  //       '$narrUrl/auth/login',
  //       body: <String, dynamic>{'email': email, 'password': password},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     if (loginResponse.statusCode == 200) {
  //       var decodedData = jsonDecode(loginResponse.body);
  //       var payLoad = decodedData["payload"];
  //
  //       UserModel user = UserModel.fromJson(payLoad);
  //
  //       Map<String, dynamic> userObj =
  //           Map<String, dynamic>.from(payLoad['user']);
  //       String token = payLoad['token'];
  //
  //       narrService.persistenceStorageService.saveItemToLocalStorage(
  //           storageName: 'local_token', itemBox: 'token', item: token);
  //       narrService.persistenceStorageService.saveItemToLocalStorage(
  //           storageName: 'local_user', itemBox: 'user', item: userObj);
  //
  //       return user;
  //     } else {
  //       var data = jsonDecode(loginResponse.body);
  //       var errorMessage = data['message'];
  //       narrService.dialogInfoService.showToast(errorMessage);
  //       loginResponse = ApiResponseModel(body: null, statusCode: data['statusCode'], message: e.message);
  //     }
  //   } on SocketException catch (e) {
  //     loginResponse = ApiResponseModel(body: null, statusCode: e.osError!.errorCode, message: e.message);
  //   }
  //   return loginResponse;
  // }

  Future<bool> login({required String email, required String password}) async {
    bool hasLoggedIn = false;
    try{
      final response = await narrService.apiService.postRequest(
        '$narrUrl/auth/login',
        body: {"email": email, "password": password},
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if(response.statusCode == 200){
        var payLoad = jsonDecode(response.body)["payload"];
        currentUser = UserModel.fromJson(response.body['user']);
        narrService.persistenceStorageService.saveItemToLocalStorage(
            storageName: 'local_token', itemBox: 'token', item: payLoad['token']);
        narrService.persistenceStorageService.saveItemToLocalStorage(
            storageName: 'local_user', itemBox: 'user', item: response.body['user']);
        hasLoggedIn = true;
      }else{
        hasLoggedIn = false;
        String errorMessage = jsonDecode(response.body)['message'];
        narrService.dialogInfoService.showToast(errorMessage);
      }
    }on SocketException catch(err){
      hasLoggedIn = false;
      narrService.dialogInfoService.showToast('Please check your internet connection');
    }
    on HttpException catch(err){
      hasLoggedIn = false;
      narrService.dialogInfoService.showToast(err.message);
    }
    return hasLoggedIn;
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