// Mocks generated by Mockito 5.3.2 from annotations
// in ricky_and_morty/test/apps/characters/data/sources/characters_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ricky_and_morty/apps/characters/domain/models/character_filters.dart'
    as _i7;
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_request.dart'
    as _i6;
import 'package:ricky_and_morty/apps/characters/domain/models/request/multiple_request.dart'
    as _i8;
import 'package:ricky_and_morty/services/http_client/domain/models/custom_request.dart'
    as _i5;
import 'package:ricky_and_morty/services/http_client/domain/models/custom_response.dart'
    as _i2;
import 'package:ricky_and_morty/services/http_client/domain/usecases/http_client.dart'
    as _i3;

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

class _FakeCustomResponse_0 extends _i1.SmartFake
    implements _i2.CustomResponse {
  _FakeCustomResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i3.HttpClient {
  @override
  _i4.Future<_i2.CustomResponse> get(_i5.CustomRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [request],
        ),
        returnValue: _i4.Future<_i2.CustomResponse>.value(_FakeCustomResponse_0(
          this,
          Invocation.method(
            #get,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.CustomResponse>.value(_FakeCustomResponse_0(
          this,
          Invocation.method(
            #get,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.CustomResponse>);
}

/// A class which mocks [CustomRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCustomRequest extends _i1.Mock implements _i5.CustomRequest {
  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
}

/// A class which mocks [AllRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockAllRequest extends _i1.Mock implements _i6.AllRequest {
  @override
  set filters(_i7.CharacterFilters? _filters) => super.noSuchMethod(
        Invocation.setter(
          #filters,
          _filters,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set url(String? _url) => super.noSuchMethod(
        Invocation.setter(
          #url,
          _url,
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MultipleRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockMultipleRequest extends _i1.Mock implements _i8.MultipleRequest {
  @override
  set ids(List<int>? _ids) => super.noSuchMethod(
        Invocation.setter(
          #ids,
          _ids,
        ),
        returnValueForMissingStub: null,
      );
}
