enum ResponseStatus {
  success,
  unknown,
  error,
}

class CustomResponse {
  ResponseStatus statusCode;
  Map<String, dynamic>? data;

  CustomResponse({
    required this.statusCode,
    this.data,
  });
}
