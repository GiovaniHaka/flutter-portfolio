// Mocks generated by Mockito 5.3.2 from annotations
// in ricky_and_morty/test/apps/location/domain/data/repositories/location_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ricky_and_morty/apps/location/data/sources/location_source.dart'
    as _i3;
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

/// A class which mocks [LocationSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocationSource extends _i1.Mock implements _i3.LocationSource {
  @override
  _i4.Future<_i2.Either<_i5.Failure, Map<String, dynamic>>> getSingle(
          String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSingle,
          [url],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, Map<String, dynamic>>>.value(
                _FakeEither_0<_i5.Failure, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getSingle,
            [url],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, Map<String, dynamic>>>.value(
                _FakeEither_0<_i5.Failure, Map<String, dynamic>>(
          this,
          Invocation.method(
            #getSingle,
            [url],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, Map<String, dynamic>>>);
}