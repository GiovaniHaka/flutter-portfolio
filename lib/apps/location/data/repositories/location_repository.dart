import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/location/data/sources/location_source.dart';
import 'package:ricky_and_morty/apps/location/domain/models/location.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> call(String url);
}

class LocationRepositoryImp implements LocationRepository {
  late LocationSource _source;

  @override
  Future<Either<Failure, Location>> call(String url) {
    try {
      throw UnimplementedError();
    } catch (e) {
      throw Exception(e);
    }
  }
}
