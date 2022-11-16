import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/characters/data/repositories/characters_repository.dart';
import 'package:ricky_and_morty/apps/characters/data/sources/characters_source.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_all_characters_response.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_request.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/multiple_request.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';
import 'package:ricky_and_morty/common/models/rick_and_morty_api/info.dart';

import '../../domain/usecases/get_multiple_characters_test.mocks.dart';
import 'characters_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CharactersSource>(),
  MockSpec<GetAllCharactersResponse>(),
  MockSpec<AllRequest>(),
])
main() {
  final mockAllRequest = MockAllRequest();
  final mockMultipleRequest = MockMultipleRequest();
  final mockSource = MockCharactersSource();
  final repository = CharactersRepositoryImp(mockSource);

  group('CharactersRepository - getAll()', () {
    test(
      'should return AllCharactersResponse',
      () async {
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

        final responseObject = GetAllCharactersResponse(
          info: Info(count: 1, pages: 1, next: 'url', prev: null),
          characters: [
            Character(
              id: 1,
              name: 'Rick',
              status: CharacterStatus.alive,
              species: 'Human',
              type: '',
              gender: CharacterGender.male,
              origin: CharacterOrigin(name: 'Earth', url: 'url/location/1'),
              location: CharacterLocation(name: 'Earth', url: 'url/location/2'),
              image: 'url/image',
              episode: [
                "url/1",
                "url/2",
              ],
              url: 'url',
              created: DateTime(2017, 11, 4, 00, 00, 00),
            )
          ],
        );

        when(mockSource.getAll(any)).thenAnswer(
          (_) async => const Right(data),
        );

        final result = await repository.getAll(mockAllRequest);

        expect(result.toString(), Right(responseObject).toString());
      },
    );

    test(
      'should return Failure',
      () async {
        final failure = Failure('Failure');

        when(mockSource.getAll(any)).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await repository.getAll(mockAllRequest);

        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should catch Exception',
      () async {
        when(mockSource.getAll(any)).thenAnswer((_) async => throw Exception());

        expect(repository.getAll(mockAllRequest), throwsException);
      },
    );
  });

  group('CharactersRepository - getMultiple()', () {
    test(
      'should return List<Character>',
      () async {
        const List<dynamic> data = [
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
        ];

        final responseList = [
          Character(
            id: 1,
            name: 'Rick',
            status: CharacterStatus.alive,
            species: 'Human',
            type: '',
            gender: CharacterGender.male,
            origin: CharacterOrigin(name: 'Earth', url: 'url/location/1'),
            location: CharacterLocation(name: 'Earth', url: 'url/location/2'),
            image: 'url/image',
            episode: [
              "url/1",
              "url/2",
            ],
            url: 'url',
            created: DateTime(2017, 11, 4, 00, 00, 00),
          )
        ];

        when(mockSource.getMultiple(any)).thenAnswer(
          (_) async => const Right(data),
        );

        final result = await repository.getMultiple(MultipleRequest(ids: [1]));

        expect(1, Right(responseList).value.first.id);
        expect(result.length(), Right(responseList).length());
        expect(result.toString(), Right(responseList).toString());
      },
    );

    test(
      'should return Failure',
      () async {
        final failure = Failure('Failure');

        when(mockSource.getMultiple(any)).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await repository.getMultiple(mockMultipleRequest);

        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should catch Exception',
      () async {
        when(mockSource.getMultiple(any)).thenAnswer(
          (_) async => throw Exception(),
        );

        expect(repository.getMultiple(mockMultipleRequest), throwsException);
      },
    );
  });
}
