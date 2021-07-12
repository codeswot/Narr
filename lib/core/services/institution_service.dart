import 'dart:convert';

import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';

class InstitutionService {
  Future getInstitutionType() async {
    dynamic data;
    await narrService.apiService
        .getRequest(endpoint: '$narrUrl/institution/types')
        .then((value) {
      if (value.statusCode == 200) {
        var decodedResponse = jsonDecode(value.body);
        var institutionTypeList =
            decodedResponse['institutionTypes']['payload'];
        data = institutionTypeList;
      } else {
        var decodedResponse = jsonDecode(value.body);
        var errorMessage = decodedResponse['message'];
        data = errorMessage;
      }
    });
    return data;
  }

  Future getInstitutionName(
      {required String type, required String category}) async {
    dynamic data;
    await narrService.apiService
        .getRequest(endpoint: '$narrUrl/institution/$type/$category')
        .then(
      (value) {
        if (value.statusCode == 200) {
          var decodedResponse = jsonDecode(value.body);
          var institutionTypeList = decodedResponse['institutions']['payload'];
          data = institutionTypeList;
        } else {
          var decodedResponse = jsonDecode(value.body);
          var errorMessage = decodedResponse['message'];
          data = errorMessage;
        }
      },
    );
    return data;
  }

  Future getInstitutionObject({required String name}) async {
    dynamic data;
    await narrService.apiService
        .getRequest(
            endpoint: '$narrUrl/institution/getbyname', param: 'name=$name')
        .then(
      (value) {
        if (value.statusCode == 200) {
          var decodedResponse = jsonDecode(value.body);

          var institutionObject = decodedResponse['institution'];
          data = institutionObject;
        } else {
          var decodedResponse = jsonDecode(value.body);
          var errorMessage = decodedResponse['message'];
          print(decodedResponse);
          data = errorMessage;
        }
      },
    );
    return data;
  }
}
