import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_characters_response.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class GetMultipleCharacters {
  Future<Either<Failure,GetCharactersResponse>> call(List<int> ids);
}

class GetMultipleCharactersImp implements GetMultipleCharacters {
  @override
  Future<Either<Failure,GetCharactersResponse>> call(List<int> ids) {
    throw UnimplementedError();
  }
}
