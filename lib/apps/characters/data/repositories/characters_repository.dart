import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/data/sources/characters_source.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/get_characters_response.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_chars_request.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/multiple_chars_request.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';
import 'package:ricky_and_morty/common/models/rick_and_morty_api/response_info.dart';

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

      return result.fold(
        (failure) => Left(failure),
        (data) {
          final info = ResponseInfo.fromMap(data['info']);
          final results = data['results'] as List;
          final characters = results.map((e) => Character.fromMap(e)).toList();

          return Right(GetCharactersResponse(
            info: info,
            characters: characters,
          ));
        },
      );
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }

  @override
  Future<Either<Failure, GetCharactersResponse>> getMultiple(
      MultiCharsRequest req) async {
    try {
      final result = await _source.getMultiple(req);

      return result.fold(
        (failure) => Left(failure),
        (data) {
          final info = ResponseInfo.fromMap(data['info']);
          final results = data['results'] as List;
          final characters = results.map((e) => Character.fromMap(e)).toList();

          return Right(GetCharactersResponse(
            info: info,
            characters: characters,
          ));
        },
      );
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
