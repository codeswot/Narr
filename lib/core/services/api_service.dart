import 'package:narr/shared/models/api_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ApiResponseModel> getRequest(
      {required String url,
      String? params,
      Map<String, String>? headers}) async {
    final Uri _uri = Uri.parse('$url/$params');
    http.Response res = await http.get(
      _uri,
      headers: headers,
    );

    ApiResponseModel transformedResponse = ApiResponseModel(
      body: res.body,
      statusCode: res.statusCode,
      message: res.reasonPhrase,
    );

    return transformedResponse;
  }

  Future<ApiResponseModel> postRequest(
      {required String url,
      String? params,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    final Uri _uri = Uri.parse('$url/$params');
    http.Response res = await http.post(
      _uri,
      headers: headers!,
      body: body,
    );

    ApiResponseModel transformedResponse = ApiResponseModel(
      body: res.body,
      statusCode: res.statusCode,
      message: res.reasonPhrase,
    );

    return transformedResponse;
  }
}
