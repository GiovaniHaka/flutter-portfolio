import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class LocationSource {
  Future<Either<Failure, Map<String, dynamic>>> call(String url);
}
