import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/episodes/domain/models/episode.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, Episode>> call(String url);
}
