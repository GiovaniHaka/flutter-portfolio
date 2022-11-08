import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character_filters.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_characters_response.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class GetAllCharacters {
  Future<Either<Failure, GetCharactersResponse>> call(CharacterFilters filters);
}

class GetAllCharactersImp implements GetAllCharacters {
  @override
  Future<Either<Failure, GetCharactersResponse>> call(
      CharacterFilters filters) {
    throw UnimplementedError();
  }
}
