import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/characters/data/sources/characters_source.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_request.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/multiple_request.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_request.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_response.dart';
import 'package:ricky_and_morty/services/http_client/domain/usecases/http_client.dart';

import 'characters_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HttpClient>(),
  MockSpec<CustomRequest>(),
  MockSpec<AllRequest>(),
  MockSpec<MultipleRequest>(),
])
main() {
  final mockHttpClient = MockHttpClient();
  final mockAllRequest = MockAllRequest();
  final source = CharactersSourceImp(mockHttpClient);

  group('CharacterSource - getAll()', () {
    const Map<String, dynamic> data = {
      "info": {"count": 1, "pages": 1, "next": "url", "prev": null},
      "results": [
        {
          "id": 1,
          "name": "Rick",
          "status": "Alive",
          "species": "Human",
          "type": "",
          "gender": "Male",
          "origin": {"name": "Earth", "url": "url/location/1"},
          "location": {"name": "Earth", "url": "url/location/2"},
          "image": "url/image",
          "episode": [
            "url/1",
            "url/2",
          ],
          "url": "url",
          "created": "2017-11-04T00:00:00.000"
        },
      ],
    };
    test('should return success response', () async {
      final httpResponse = CustomResponse(
        status: ResponseStatus.success,
        data: data,
      );

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => httpResponse,
      );

      final result = await source.getAll(mockAllRequest);

      expect(result.toString(), const Right(data).toString());
    });

    test('should return unknown response', () async {
      final httpResponse = CustomResponse(
        status: ResponseStatus.unknown,
      );

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => httpResponse,
      );

      final result = await source.getAll(mockAllRequest);

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

      final result = await source.getAll(mockAllRequest);

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

      final result = await source.getAll(mockAllRequest);

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
