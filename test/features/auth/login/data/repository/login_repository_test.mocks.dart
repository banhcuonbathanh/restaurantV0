// Mocks generated by Mockito 5.4.0 from annotations
// in restauranttdd0/test/features/auth/login/data/repository/login_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:restauranttdd0/features/auth/login/data/api/login_api_service.dart'
    as _i3;
import 'package:restauranttdd0/features/auth/login/data/dto/response/login_response.dart'
    as _i2;

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

class _FakeLoginResponse_0 extends _i1.SmartFake implements _i2.LoginResponse {
  _FakeLoginResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LoginApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginApiService extends _i1.Mock implements _i3.LoginApiService {
  @override
  _i4.Future<_i2.LoginResponse> login(Map<String, dynamic>? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [request],
        ),
        returnValue: _i4.Future<_i2.LoginResponse>.value(_FakeLoginResponse_0(
          this,
          Invocation.method(
            #login,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.LoginResponse>.value(_FakeLoginResponse_0(
          this,
          Invocation.method(
            #login,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.LoginResponse>);
}
