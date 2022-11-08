import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/data/sources/characters_source.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_characters_response.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_chars_request.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/multiple_chars_request.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';

abstract class CharactersRepository {
  Future<Either<Failure, GetCharactersResponse>> getAll(AllCharsRequest req);

  Future<Either<Failure, GetCharactersResponse>> getMultiple(
      MultiCharsRequest req);
}

class CharactersRepositoryImp implements CharactersRepository {
  late CharactersSource _source;

  CharactersRepositoryImp([CharactersSource? source]) {
    _source = source ?? CharactersSourceImp();
  }

  @override
  Future<Either<Failure, GetCharactersResponse>> getAll(
      AllCharsRequest req) async {
    try {
      final result = await _source.getAll(req);

      result.fold(
        (failure) => Left(failure),
        (data) => null,
      );
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Failure, GetCharactersResponse>> getMultiple(
      MultiCharsRequest req) async {
    try {
      throw Exception();
      await _source.getMultiple(req);
    } catch (e) {
      throw Exception();
    }
  }
}
