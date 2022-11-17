import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ricky_and_morty/apps/location/data/repositories/location_repository.dart';
import 'package:ricky_and_morty/apps/location/domain/models/location.dart';
import 'package:ricky_and_morty/apps/location/domain/usecases/get_single_location.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

import 'get_single_location_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LocationRepository>(),
  MockSpec<Location>(),
])
main() {
  final mockRepository = MockLocationRepository();
  final mockLocation = MockLocation();
  final usecase = GetSingleLocationImp(mockRepository);

  group('GetSinglelocation -', () {
    test('should return location', () async {
      when(mockRepository.getSingle(any)).thenAnswer(
        (_) async => Right(mockLocation),
      );

      final result = await usecase('location/url');

      expect(result, equals(Right(mockLocation)));
    });

    test('should return Failure', () async {
      final failure = Failure('Failure');

      when(mockRepository.getSingle(any)).thenAnswer(
        (_) async => Left(failure),
      );

      final result = await usecase('location/url');

      expect(result, equals(Left(failure)));
    });

    test('should return Exception', () async {
      when(mockRepository.getSingle(any)).thenAnswer(
        (_) async => throw Exception(),
      );

      expect(usecase('location/url'), throwsException);
    });
  });
}