class ApiResponseModel {
  final String body;
  final int statusCode;
  final String? message;

  ApiResponseModel(
      {required this.body, required this.statusCode, required this.message});

  factory ApiResponseModel.fromJson(Map<String, dynamic> data) =>
      ApiResponseModel(
        body: data['data'] as String,
        message: data['reason_phrase'] as String,
        statusCode: data['status_code'] as int,
      );
}
