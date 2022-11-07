import 'package:dio/dio.dart';
import 'package:ricky_and_morty/common/exceptions/http_client_exception.dart';
import 'package:ricky_and_morty/services/http_client/data/client_service.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_request.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_response.dart';

class DioClientServiceImp implements ClientService {
  final _dio = Dio();

  @override
  Future<CustomResponse> get(CustomRequest request) async {
    try {
      final path = request.path;
      final queryParams = request.queryParameters;

      final response = await _dio.get(path, queryParameters: queryParams);

      return CustomResponse(
        data: response.data,
        statusCode: response.statusCode,
      );
    } catch (e) {
      throw HttpClientException();
    }
  }
}
