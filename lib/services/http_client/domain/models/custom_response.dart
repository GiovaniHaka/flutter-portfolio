enum ResponseStatus {
  success,
  unknown,
  error,
}

class CustomResponse {
  ResponseStatus status;
  dynamic data;

  CustomResponse({
    required this.status,
    this.data,
  });
}
