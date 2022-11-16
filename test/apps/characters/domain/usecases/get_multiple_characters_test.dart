import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/characters/data/repositories/characters_repository.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/multiple_request.dart';
import 'package:ricky_and_morty/apps/characters/domain/usecases/get_multiple_characters.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';
import 'get_multiple_characters_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CharactersRepository>(),
  MockSpec<MultipleRequest>(),
])
main() {
  final mockAllRequest = MockMultipleRequest();
  final repository = MockCharactersRepository();
  final usecase = GetMultipleCharactersImp(repository);

  group('GetMultipleCharactersImp', () {
    test(
      'should return List<Character>',
      () async {
        when(repository.getMultiple(any)).thenAnswer(
          (_) async => const Right(<Character>[]),
        );

        final result = await usecase(mockAllRequest);

        expect(result, equals(const Right(<Character>[])));
      },
    );

    test(
      'should return Failure',
      () async {
        final failure = Failure('Failure');

        when(repository.getMultiple(any)).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await usecase(mockAllRequest);

        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should catch Exception',
      () async {
        when(repository.getMultiple(any))
            .thenAnswer((_) async => throw Exception());

        expect(usecase(mockAllRequest), throwsException);
      },
    );
  });
}
