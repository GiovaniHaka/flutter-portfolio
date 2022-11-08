import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character_filters.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_characters_response.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class CharactersRepository {
  Future<Either<Failure, GetCharactersResponse>> getAll(CharacterFilters filters);
  Future<Either<Failure,GetCharactersResponse>> getMultiple(List<int> ids);
}

class CharactersRepositoryImp implements CharactersRepository {
  @override
  Future<Either<Failure, GetCharactersResponse>> getAll(CharacterFilters filters) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GetCharactersResponse>> getMultiple(List<int> ids) {
    // TODO: implement getMultiple
    throw UnimplementedError();
  }
}