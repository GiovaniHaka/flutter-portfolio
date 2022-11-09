import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<int>>> getAll();
  Future<Either<Failure, void>> add(int key);
  Future<Either<Failure, void>> remove(int key);
  Either<Failure, Stream<int>> stream(int key);
}