import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_chars_request.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/multiple_chars_request.dart';
import 'package:ricky_and_morty/common/constants/endpoints/ricky_morty_endpoints.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_request.dart';
import 'package:ricky_and_morty/services/http_client/domain/models/custom_response.dart';
import 'package:ricky_and_morty/services/http_client/domain/usecases/http_client.dart';

abstract class CharactersSource {
  Future<Either<Failure, Map<String, dynamic>>> getAll(AllCharsRequest req);

  Future<Either<Failure, Map<String, dynamic>>> getMultiple(
      MultiCharsRequest req);
}

class CharactersSourceImp implements CharactersSource {
  late HttpClient _httpClient;

  CharactersSourceImp([HttpClient? httpClient]) {
    _httpClient = httpClient ?? HttpClietImp();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAll(
      AllCharsRequest req) async {
    try {
      String path = RickMortyApi.characters;

      final url = req.url;
      final filters = req.filters;

      if (url != null) {
        path = url;
      }

      if (filters != null) {
        /// TODO implementar filtros
      }

      final request = CustomRequest(path);

      final response = await _httpClient.get(request);
      final status = response.status;
      final data = response.data;

      switch (status) {
        case ResponseStatus.success:
          return Right(data!);
        case ResponseStatus.unknown:
          return Left(Failure('Não conseguimos encontrar os personagens'));
        case ResponseStatus.error:
          return Left(Failure('Erro ao encontrar personagens'));
        default:
          throw Exception();
      }
    } catch (e) {
      log(e.toString());
      return Left(Failure('Erro ao buscar personagens'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getMultiple(
      MultiCharsRequest req) async {
    try {
      String path = RickMortyApi.characters;

      final url = req.url;
      final ids = req.ids;

      if (url != null) {
        path = url;
      }

      if (ids != null) {
        /// TODO implementar ids
      }

      final request = CustomRequest(path);

      final response = await _httpClient.get(request);
      final status = response.status;
      final data = response.data;

      switch (status) {
        case ResponseStatus.success:
          return Right(data!);
        case ResponseStatus.unknown:
          return Left(Failure('Não conseguimos encontrar os personagens'));
        case ResponseStatus.error:
          return Left(Failure('Erro ao encontrar os personagens'));
        default:
          throw Exception();
      }
    } catch (e) {
      return Left(Failure('Erro ao buscar personagens'));
    }
  }
}
