import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/characters/data/repositories/characters_repository.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_all_characters_response.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_request.dart';
import 'package:ricky_and_morty/apps/characters/domain/usecases/get_all_characters.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

import 'get_all_characters_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CharactersRepository>(),
  MockSpec<GetAllCharactersResponse>(),
  MockSpec<AllRequest>(),
])
main() {
  final mockAllRequest = MockAllRequest();
  final mockAllResponse = MockGetAllCharactersResponse();
  final repository = MockCharactersRepository();
  final usecase = GetAllCharactersImp(repository);

  group('GetAllCharactersImp', () {
    test(
      'should return AllCharactersResponse',
      () async {
        when(repository.getAll(any)).thenAnswer(
          (_) async => Right(mockAllResponse),
        );

        final result = await usecase(mockAllRequest);

        expect(result, equals(Right(mockAllResponse)));
      },
    );

    test(
      'should return Failure',
      () async {
        final failure = Failure('Failure');

        when(repository.getAll(any)).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await usecase(mockAllRequest);

        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should catch Exception',
      () async {
        when(repository.getAll(any)).thenAnswer((_) async => throw Exception());

        expect(usecase(mockAllRequest), throwsException);
      },
    );
  });
}
