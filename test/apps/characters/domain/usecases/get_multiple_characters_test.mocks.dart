// Mocks generated by Mockito 5.3.2 from annotations
// in ricky_and_morty/test/apps/characters/domain/usecases/get_multiple_characters_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ricky_and_morty/apps/characters/data/repositories/characters_repository.dart'
    as _i3;
import 'package:ricky_and_morty/apps/characters/domain/models/character.dart'
    as _i8;
import 'package:ricky_and_morty/apps/characters/domain/models/get_all_characters_response.dart'
    as _i6;
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_request.dart'
    as _i7;
import 'package:ricky_and_morty/apps/characters/domain/models/request/multiple_request.dart'
    as _i9;
import 'package:ricky_and_morty/common/exceptions/failure.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CharactersRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharactersRepository extends _i1.Mock
    implements _i3.CharactersRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.GetAllCharactersResponse>> getAll(
          _i7.AllRequest? req) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [req],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.Failure, _i6.GetAllCharactersResponse>>.value(
            _FakeEither_0<_i5.Failure, _i6.GetAllCharactersResponse>(
          this,
          Invocation.method(
            #getAll,
            [req],
          ),
        )),
        returnValueForMissingStub: _i4.Future<
                _i2.Either<_i5.Failure, _i6.GetAllCharactersResponse>>.value(
            _FakeEither_0<_i5.Failure, _i6.GetAllCharactersResponse>(
          this,
          Invocation.method(
            #getAll,
            [req],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.GetAllCharactersResponse>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Character>>> getMultiple(
          _i9.MultipleRequest? req) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMultiple,
          [req],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i8.Character>>>.value(
                _FakeEither_0<_i5.Failure, List<_i8.Character>>(
          this,
          Invocation.method(
            #getMultiple,
            [req],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i8.Character>>>.value(
                _FakeEither_0<_i5.Failure, List<_i8.Character>>(
          this,
          Invocation.method(
            #getMultiple,
            [req],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.Character>>>);
}

/// A class which mocks [MultipleRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockMultipleRequest extends _i1.Mock implements _i9.MultipleRequest {
  @override
  set ids(List<int>? _ids) => super.noSuchMethod(
        Invocation.setter(
          #ids,
          _ids,
        ),
        returnValueForMissingStub: null,
      );
}
