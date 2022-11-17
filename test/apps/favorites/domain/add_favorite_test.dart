import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/favorites/domain/add_favorite.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

import '../favorite_mocks_test.mocks.dart';

main() {
  final mockRepository = MockFavoriteRepository();
  final usecase = AddFavoriteImp(mockRepository);

  group('AddFavorite -', () {
    test('should add favorite', () async {
      when(mockRepository.add(any)).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await usecase(1);

      expect(result, equals(const Right(null)));
    });

    test('should return Failure', () async {
      final failure = Failure('Failure');

      when(mockRepository.add(any)).thenAnswer(
        (_) async => Left(failure),
      );

      final result = await usecase(1);

      expect(result, equals(Left(failure)));
    });

    test('should return Exception', () async {
      when(mockRepository.add(any)).thenAnswer(
        (_) async => throw Exception(),
      );

      expect(usecase(1), throwsException);
    });
  });
}
