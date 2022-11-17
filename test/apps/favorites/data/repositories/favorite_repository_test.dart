import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/favorites/data/repositories/favorite_repository.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

import '../../favorite_mocks_test.mocks.dart';

main() {
  group('FavoriteRepository -', () {
    final mockSource = MockFavoriteSource();
    final repository = FavoriteRepositoryImp(mockSource);

    group('add() -', () {
      test('should add favorite', () async {
        when(mockSource.add(any)).thenAnswer(
          (_) async => const Right(null),
        );

        final result = await repository.add(1);

        expect(result, equals(const Right(null)));
      });

      test('should return Failure', () async {
        final failure = Failure('Failure');

        when(mockSource.add(any)).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await repository.add(1);

        expect(result, equals(Left(failure)));
      });

      test('should return Exception', () async {
        when(mockSource.add(any)).thenAnswer(
          (_) async => throw Exception(),
        );

        expect(repository.add(1), throwsException);
      });
    });

    group('remove() -', () {
      test('should remove favorite', () async {
        when(mockSource.remove(any)).thenAnswer(
          (_) async => const Right(null),
        );

        final result = await repository.remove(1);

        expect(result, equals(const Right(null)));
      });

      test('should return Failure', () async {
        final failure = Failure('Failure');

        when(mockSource.remove(any)).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await repository.remove(1);

        expect(result, equals(Left(failure)));
      });

      test('should return Exception', () async {
        when(mockSource.remove(any)).thenAnswer(
          (_) async => throw Exception(),
        );

        expect(repository.remove(1), throwsException);
      });
    });

    group('getSingle() -', () {
      test('should get favorite', () async {
        when(mockSource.getSingle(any)).thenAnswer(
          (_) async => const Right(true),
        );

        final result = await repository.getSingle(1);

        expect(result, equals(const Right(true)));
      });

      test('should not get favorite', () async {
        when(mockSource.getSingle(any)).thenAnswer(
          (_) async => const Right(null),
        );

        final result = await repository.getSingle(1);

        expect(result, equals(const Right(false)));
      });

      test('should return Failure', () async {
        final failure = Failure('Failure');

        when(mockSource.getSingle(any)).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await repository.getSingle(1);

        expect(result, equals(Left(failure)));
      });

      test('should return Exception', () async {
        when(mockSource.getSingle(any)).thenAnswer(
          (_) async => throw Exception(),
        );

        expect(repository.getSingle(1), throwsException);
      });
    });
    group('GetAllFavorite -', () {
      test('should get empty favorites', () async {
        when(mockSource.getAll()).thenAnswer(
          (_) async => const Right(<dynamic>[]),
        );

        final result = await repository.getAll();

        result.fold(
          (l) {
            fail('Should not return failure');
          },
          (ids) {
            expect(ids.isEmpty, true);
          },
        );
      });

      test('should get all favorites', () async {
        when(mockSource.getAll()).thenAnswer(
          (_) async => const Right(<dynamic>[
            {1: true},
            {2: true},
            {3: true},
          ]),
        );

        final result = await repository.getAll();

        expect(result.length(), const Right([1, 2, 3]).length());
        expect(result.toString(), const Right([1, 2, 3]).toString());
      });

      test('should return Failure', () async {
        final failure = Failure('Failure');

        when(mockSource.getAll()).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await repository.getAll();

        expect(result, equals(Left(failure)));
      });

      test('should return Exception', () async {
        when(mockSource.getAll()).thenAnswer(
          (_) async => throw Exception(),
        );

        expect(repository.getAll(), throwsException);
      });
    });
  });
}
