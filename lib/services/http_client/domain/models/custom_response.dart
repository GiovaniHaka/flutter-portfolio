enum ResponseStatus {
  success,
  unknown,
  error,
}

class CustomResponse {
  ResponseStatus status;
  Map<String, dynamic>? data;

  CustomResponse({
    required this.status,
    this.data,
  });
}
