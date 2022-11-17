import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ricky_and_morty/apps/location/data/repositories/location_repository.dart';
import 'package:ricky_and_morty/apps/location/data/sources/location_source.dart';
import 'package:ricky_and_morty/apps/location/domain/models/location.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

import 'location_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LocationSource>(),
])
main() {
  final mockSource = MockLocationSource();
  final repository = LocationRepositoryImp(mockSource);

  group('LocationRepository -', () {
    test(
      'should return AllCharactersResponse',
      () async {
        const Map<String, dynamic> data = {
          'id': 1,
          'name': 'Earth',
          'type': 'Planet',
          'dimension': 'Dimension C-137',
          'residents': [
            'character/1',
            'character/2',
          ],
          'url': 'location/1',
          'created': '2017-11-10T00:00:00.000'
        };

        final locationObject = Location(
          id: 1,
          name: 'Earth',
          type: 'Planet',
          dimension: 'Dimension C-137',
          residents: [
            'character/1',
            'character/2',
          ],
          url: 'location/1',
          created: DateTime(2017, 11, 10, 00, 00, 00),
        );

        when(mockSource.getSingle(any)).thenAnswer(
          (_) async => const Right(data),
        );

        final result = await repository.getSingle('location/1');

        result.fold(
          (failure) {
            fail('Should not return failure');
          },
          (location) {
            expect(location.url, 'location/1');
            expect(location.toString(), locationObject.toString());
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

        final result = await repository.getSingle('location/url');

        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should catch Exception',
      () async {
        when(mockSource.getSingle(any))
            .thenAnswer((_) async => throw Exception());

        expect(repository.getSingle('location/url'), throwsException);
      },
    );
  });
}
