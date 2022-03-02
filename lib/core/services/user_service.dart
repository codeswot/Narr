import 'dart:convert';

import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';

class UserService {
  Future getAllResearchers() async {
    dynamic data;
    await narrService.apiService
        .getRequest(endpoint: '$narrUrl/user', headers: {
      'x-token': currentUser.token,
    }).then(
      (value) {
        if (value.statusCode == 200) {
          var decodedResponse = jsonDecode(value.body);
          var researchersList = decodedResponse['payload'];
          data = researchersList;
        } else {
          var decodedResponse = jsonDecode(value.body);
          var errorMessage = decodedResponse['message'];
          data = errorMessage;
        }
      },
    );
    return data;
  }

  Future getOneResearcher(String id) async {
    dynamic data;
    await narrService.apiService
        .getRequest(endpoint: '$narrUrl/user/$id', headers: {
      'x-token': currentUser.token,
    }).then(
      (value) {
        if (value.statusCode == 200) {
          var decodedResponse = jsonDecode(value.body);
          var researcher = decodedResponse['payload'];
          data = researcher;
        } else {
          var decodedResponse = jsonDecode(value.body);
          var errorMessage = decodedResponse['message'];
          data = errorMessage;
        }
      },
    );
    return data;
  }
}
