import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/episodes/data/sources/episode_source.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_request.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_response.dart';
import 'package:ricky_and_morty/services/http_client/domain/usecases/http_client.dart';

import 'episode_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HttpClient>(),
  MockSpec<CustomRequest>(),
])
main() {
  final mockHttpClient = MockHttpClient();
  final source = EpisodeSourceImp(mockHttpClient);

  group('EpisodeSource -', () {
    const Map<String, dynamic> data = {
      'id': 1,
      'name': 'Pilot',
      'air_date': 'December 2, 2013',
      'episode': 'S01E01',
      'characters': [
        'character/1',
        'character/2',
      ],
      'url': 'episode/1',
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

      final result = await source.getSingle('episode/url');

      expect(result.toString(), const Right(data).toString());
    });

    test('should return unknown response', () async {
      final httpResponse = CustomResponse(
        status: ResponseStatus.unknown,
      );

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => httpResponse,
      );

      final result = await source.getSingle('episode/url');

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

      final result = await source.getSingle('episode/url');

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

      final result = await source.getSingle('episode/url');

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
