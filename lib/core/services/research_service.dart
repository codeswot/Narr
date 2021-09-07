import 'dart:convert';

import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';

class ResearchService {
  Future getAllResearch() async {
    dynamic data;
    await narrService.apiService
        .getRequest(endpoint: '$narrUrl/research', headers: {
      'x-token': currentUser.token,
    }).then(
      (value) {
        if (value.statusCode == 200) {
          var decodedResponse = jsonDecode(value.body);
          var researchList = decodedResponse['payload'];
          data = researchList;
        } else {
          var decodedResponse = jsonDecode(value.body);
          var errorMessage = decodedResponse['message'];
          data = errorMessage;
        }
      },
    );
    return data;
  }

  Future getOneResearch(String id) async {
    dynamic data;
    await narrService.apiService
        .getRequest(endpoint: '$narrUrl/research/$id', headers: {
      'x-token': currentUser.token,
    }).then(
      (value) {
        if (value.statusCode == 200) {
          var decodedResponse = jsonDecode(value.body);
          var research = decodedResponse['payload']['research'];
          data = research;
        } else {
          var decodedResponse = jsonDecode(value.body);
          var errorMessage = decodedResponse['message'];
          data = errorMessage;
        }
      },
    );
    return data;
  }

  Future getAllIctWork() async {
    dynamic data;
    await narrService.apiService
        .getRequest(endpoint: '$narrUrl/ictWorks', headers: {
      'x-token': currentUser.token,
    }).then(
      (value) {
        if (value.statusCode == 200) {
          var decodedResponse = jsonDecode(value.body);
          var worksList = decodedResponse['feeds']['payload'];
          data = worksList;
        } else {
          var decodedResponse = jsonDecode(value.body);
          var errorMessage = decodedResponse['message'];
          data = errorMessage;
        }
      },
    );
    return data;
  }

  //
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
}
