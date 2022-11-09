import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/location/domain/models/location.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> call(String url);
}