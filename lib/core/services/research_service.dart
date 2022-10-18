import 'dart:convert';

import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/models/research.dart';

class ResearchService {
  Future<List<ResearchModel>> getAllResearch() async {
    List<ResearchModel> researchList = [];
    await narrService.apiService
        .getRequest(endpoint: '$narrUrl/research', headers: {
      'x-token': currentUser.token,
    }).then(
      (value) {
        if (value.statusCode == 200) {
          dynamic decodedResponse = jsonDecode(value.body);
          List researchs = decodedResponse['payload'];
          for (var research in researchs) {
            ResearchModel singleResearch = ResearchModel.fromJson(research);
            researchList.add(singleResearch);
          }
        } else {
          researchList = [];
        }
      },
    );
    return researchList;
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
}
