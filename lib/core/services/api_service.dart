import 'dart:convert';

import 'package:narr/shared/models/api_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ApiResponseModel> getRequest(
      {required String endpoint,
      Map<String, String>? headers,
      String? param}) async {
    Uri _uri = Uri.parse('$endpoint?$param');
    http.Response res = await http.get(_uri, headers: headers);
    ApiResponseModel apiResponse = ApiResponseModel(
      body: res.body,
      message: res.reasonPhrase,
      statusCode: res.statusCode,
    );

    return apiResponse;
  }

  Future<ApiResponseModel> postRequest(String endpoint,
      {required Map<String, dynamic> body,
      required Map<String, String> headers}) async {
    Uri _uri = Uri.parse(endpoint);
    http.Response res = await http.post(
      _uri,
      headers: headers,
      body: jsonEncode(body),
    );

    ApiResponseModel apiResponse = ApiResponseModel(
      body: res.body,
      message: res.reasonPhrase,
      statusCode: res.statusCode,
    );

    return apiResponse;
  }
}
