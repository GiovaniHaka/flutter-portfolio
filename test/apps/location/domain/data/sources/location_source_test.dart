import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/location/data/sources/location_source.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_request.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_response.dart';
import 'package:ricky_and_morty/services/http_client/domain/usecases/http_client.dart';

import 'location_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HttpClient>(),
  MockSpec<CustomRequest>(),
])
main() {
  final mockHttpClient = MockHttpClient();
  final source = LocationSourceImp(mockHttpClient);

  group('LocationSource -', () {
    const Map<String, dynamic> data = {
      'id': 1,
      'name': 'Earth',
      'type': 'Planet',
      'dimension': 'Dimension C-137',
      'residents': [
        'character/1',
        'character/2',
      ],
      'url': 'location/1',
      'created': '2017-11-10T00:00:00.000'
    };

    test('should return success response', () async {
      final httpResponse = CustomResponse(
        status: ResponseStatus.success,
        data: data,
      );

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => httpResponse,
      );

      final result = await source.getSingle('location/url');

      expect(result.toString(), const Right(data).toString());
    });

    test('should return unknown response', () async {
      final httpResponse = CustomResponse(
        status: ResponseStatus.unknown,
      );

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => httpResponse,
      );

      final result = await source.getSingle('location/url');

      result.fold(
        (failure) {
          expect(failure, isInstanceOf<Failure>());
        },
        (data) {
          fail('Should not return data');
        },
      );
    });

    test('should return bad request response', () async {
      final httpResponse = CustomResponse(
        status: ResponseStatus.badRequest,
      );

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => httpResponse,
      );

      final result = await source.getSingle('location/url');

      result.fold(
        (failure) {
          expect(failure, isInstanceOf<Failure>());
        },
        (data) {
          fail('Should not return data');
        },
      );
    });

    test('should return error response', () async {
      final httpResponse = CustomResponse(
        status: ResponseStatus.error,
      );

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => httpResponse,
      );

      final result = await source.getSingle('location/url');

      result.fold(
        (failure) {
          expect(failure, isInstanceOf<Failure>());
        },
        (data) {
          fail('Should not return data');
        },
      );
    });
  });
}
