import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/data/repositories/characters_repository.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_characters_response.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class GetMultipleCharacters {
  Future<Either<Failure, GetCharactersResponse>> call(List<int> ids);
}

class GetMultipleCharactersImp implements GetMultipleCharacters {
  late CharactersRepository _repository;

  GetMultipleCharactersImp([CharactersRepository? repository]) {
    _repository = repository ?? CharactersRepositoryImp();
  }

  @override
  Future<Either<Failure, GetCharactersResponse>> call(List<int> ids) async {
    try {
      return await _repository.getMultiple(ids);
    } catch (e) {
      throw Exception();
    }
  }
}
