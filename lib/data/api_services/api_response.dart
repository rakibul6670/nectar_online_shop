class ApiResponse {
  final int statusCode;
  final bool isSuccess;
  final dynamic response;
  final String? message;

  ApiResponse({
    required this.statusCode,
    required this.isSuccess,
    required this.response,
    this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> response) {
    return ApiResponse(
      statusCode: response["statusCode"],
      isSuccess: response["success"],
      response: response["responseBody"],
      message: response["message"] ?? "Something went wrong! ",
    );
  }
}
