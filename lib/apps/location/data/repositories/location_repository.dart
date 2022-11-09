import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/location/data/sources/location_source.dart';
import 'package:ricky_and_morty/apps/location/domain/models/location.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> call(String url);
}

class LocationRepositoryImp implements LocationRepository {
  late LocationSource _source;

  LocationRepositoryImp([LocationSource? source]) {
    _source = source ?? LocationSourceImp();
  }

  @override
  Future<Either<Failure, Location>> call(String url) async {
    try {
      final result = await _source.call(url);

      return result.fold(
        (failure) => Left(failure),
        (data) {
          final location = Location.fromMap(data['results'].first);
          return Right(location);
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
