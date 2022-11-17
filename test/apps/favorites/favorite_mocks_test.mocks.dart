// Mocks generated by Mockito 5.3.2 from annotations
// in ricky_and_morty/test/apps/favorites/favorite_mocks_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ricky_and_morty/apps/favorites/data/repositories/favorite_repository.dart'
    as _i3;
import 'package:ricky_and_morty/apps/favorites/data/sources/favorite_source.dart'
    as _i6;
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

/// A class which mocks [FavoriteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoriteRepository extends _i1.Mock
    implements _i3.FavoriteRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<int>>> getAll() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<int>>>.value(
            _FakeEither_0<_i5.Failure, List<int>>(
          this,
          Invocation.method(
            #getAll,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<int>>>.value(
                _FakeEither_0<_i5.Failure, List<int>>(
          this,
          Invocation.method(
            #getAll,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<int>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> add(int? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [key],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #add,
            [key],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #add,
            [key],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> getSingle(int? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSingle,
          [key],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #getSingle,
            [key],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #getSingle,
            [key],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> remove(int? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #remove,
            [key],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #remove,
            [key],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Stream<_i2.Either<_i5.Failure, bool>> stream(int? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #stream,
          [key],
        ),
        returnValue: _i4.Stream<_i2.Either<_i5.Failure, bool>>.empty(),
        returnValueForMissingStub:
            _i4.Stream<_i2.Either<_i5.Failure, bool>>.empty(),
      ) as _i4.Stream<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Stream<_i2.Either<_i5.Failure, dynamic>> onChange() =>
      (super.noSuchMethod(
        Invocation.method(
          #onChange,
          [],
        ),
        returnValue: _i4.Stream<_i2.Either<_i5.Failure, dynamic>>.empty(),
        returnValueForMissingStub:
            _i4.Stream<_i2.Either<_i5.Failure, dynamic>>.empty(),
      ) as _i4.Stream<_i2.Either<_i5.Failure, dynamic>>);
}

/// A class which mocks [FavoriteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoriteSource extends _i1.Mock implements _i6.FavoriteSource {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<dynamic>>> getAll() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<dynamic>>>.value(
            _FakeEither_0<_i5.Failure, List<dynamic>>(
          this,
          Invocation.method(
            #getAll,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<dynamic>>>.value(
                _FakeEither_0<_i5.Failure, List<dynamic>>(
          this,
          Invocation.method(
            #getAll,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<dynamic>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> add(int? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [key],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #add,
            [key],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #add,
            [key],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> remove(int? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #remove,
            [key],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #remove,
            [key],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, dynamic>> getSingle(int? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSingle,
          [key],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, dynamic>>.value(
            _FakeEither_0<_i5.Failure, dynamic>(
          this,
          Invocation.method(
            #getSingle,
            [key],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, dynamic>>.value(
                _FakeEither_0<_i5.Failure, dynamic>(
          this,
          Invocation.method(
            #getSingle,
            [key],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, dynamic>>);
  @override
  _i4.Stream<_i2.Either<_i5.Failure, dynamic>> stream(int? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #stream,
          [key],
        ),
        returnValue: _i4.Stream<_i2.Either<_i5.Failure, dynamic>>.empty(),
        returnValueForMissingStub:
            _i4.Stream<_i2.Either<_i5.Failure, dynamic>>.empty(),
      ) as _i4.Stream<_i2.Either<_i5.Failure, dynamic>>);
  @override
  _i4.Stream<_i2.Either<_i5.Failure, dynamic>> onChange() =>
      (super.noSuchMethod(
        Invocation.method(
          #onChange,
          [],
        ),
        returnValue: _i4.Stream<_i2.Either<_i5.Failure, dynamic>>.empty(),
        returnValueForMissingStub:
            _i4.Stream<_i2.Either<_i5.Failure, dynamic>>.empty(),
      ) as _i4.Stream<_i2.Either<_i5.Failure, dynamic>>);
}
