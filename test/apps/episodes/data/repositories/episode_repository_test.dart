import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/episodes/data/repositories/episode_repository.dart';
import 'package:ricky_and_morty/apps/episodes/data/sources/episode_source.dart';
import 'package:ricky_and_morty/apps/episodes/domain/models/episode.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

import 'episode_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<EpisodeSource>(),
])
main() {
  final mockSource = MockEpisodeSource();
  final repository = EpisodeRepositoryImp(mockSource);

  group('EpisodeRepository -', () {
    test(
      'should return AllCharactersResponse',
      () async {
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

        final episodeObject = Episode(
          id: 1,
          name: 'Pilot',
          airDate: 'December 2, 2013',
          episode: 'S01E01',
          characters: [
            'character/1',
            'character/2',
          ],
          url: 'episode/1',
          created: DateTime(2017, 11, 10, 0, 0, 0),
        );

        when(mockSource.getSingle(any)).thenAnswer(
          (_) async => const Right(data),
        );

        final result = await repository.getSingle('episode/1');

        result.fold(
          (failure) {
            fail('Should not return failure');
          },
          (episode) {
            expect(episode.url, 'episode/1');
            expect(episode.toString(), episodeObject.toString());
          },
        );
      },
    );

    test(
      'should return Failure',
      () async {
        final failure = Failure('Failure');

        when(mockSource.getSingle(any)).thenAnswer(
          (_) async => Left(failure),
        );

        final result = await repository.getSingle('episode/url');

        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should catch Exception',
      () async {
        when(mockSource.getSingle(any))
            .thenAnswer((_) async => throw Exception());

        expect(repository.getSingle('episode/url'), throwsException);
      },
    );
  });
}
