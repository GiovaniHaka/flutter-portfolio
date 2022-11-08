import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/data/repositories/characters_repository.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character_filters.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_characters_response.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class GetAllCharacters {
  Future<Either<Failure, GetCharactersResponse>> call(CharacterFilters filters);
}

class GetAllCharactersImp implements GetAllCharacters {
  late CharactersRepository _repository;

  GetAllCharactersImp([CharactersRepository? repository]) {
    _repository = repository ?? CharactersRepositoryImp();
  }

  @override
  Future<Either<Failure, GetCharactersResponse>> call(
    CharacterFilters filters,
  ) async {
    try {
      return await _repository.getAll(filters);
    } catch (e) {
      throw Exception();
    }
  }
}
