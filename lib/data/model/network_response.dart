class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final Map<String, dynamic>? body;
  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    required this.body,
  });
}
