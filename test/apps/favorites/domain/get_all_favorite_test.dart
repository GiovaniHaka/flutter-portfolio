import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/favorites/domain/get_all_favorites.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

import '../favorite_mocks_test.mocks.dart';

main() {
  final mockRepository = MockFavoriteRepository();
  final usecase = GetAllFavoritesImp(mockRepository);

  group('GetAllFavorite -', () {
    test('should get empty favorites', () async {
      when(mockRepository.getAll()).thenAnswer(
        (_) async => const Right(<int>[]),
      );

      final result = await usecase();

      expect(result, equals(const Right(<int>[])));
    });

    test('should get all favorites', () async {
      when(mockRepository.getAll()).thenAnswer(
        (_) async => const Right([1, 2, 3]),
      );

      final result = await usecase();

      expect(result, equals(const Right([1, 2, 3])));
    });

    test('should return Failure', () async {
      final failure = Failure('Failure');

      when(mockRepository.getAll()).thenAnswer(
        (_) async => Left(failure),
      );

      final result = await usecase();

      expect(result, equals(Left(failure)));
    });

    test('should return Exception', () async {
      when(mockRepository.getAll()).thenAnswer(
        (_) async => throw Exception(),
      );

      expect(usecase(), throwsException);
    });
  });
}
