import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/episodes/data/repositories/episode_repository.dart';
import 'package:ricky_and_morty/apps/episodes/domain/models/episode.dart';
import 'package:ricky_and_morty/apps/episodes/domain/usecases/get_single_episode.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

import 'get_single_episode_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<EpisodeRepository>(),
  MockSpec<Episode>(),
])
main() {
  final mockRepository = MockEpisodeRepository();
  final mockEpisode = MockEpisode();
  final usecase = GetSingleEpisodeImp(mockRepository);

  group('GetSingleEpisode -', () {
    test('should return Episode', () async {
      when(mockRepository.getSingle(any)).thenAnswer(
        (_) async => Right(mockEpisode),
      );

      final result = await usecase('episode/url');

      expect(result, equals(Right(mockEpisode)));
    });

    test('should return Failure', () async {
      final failure = Failure('Failure');

      when(mockRepository.getSingle(any)).thenAnswer(
        (_) async => Left(failure),
      );

      final result = await usecase('episode/url');

      expect(result, equals(Left(failure)));
    });

    test('should return Exception', () async {
      when(mockRepository.getSingle(any)).thenAnswer(
        (_) async => throw Exception(),
      );

      expect(usecase('episode/url'), throwsException);
    });
  });
}
