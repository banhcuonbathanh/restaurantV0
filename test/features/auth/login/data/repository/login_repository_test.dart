import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restauranttdd0/core/exception/failure.dart';
import 'package:restauranttdd0/features/auth/login/data/api/login_api_service.dart';
import 'package:restauranttdd0/features/auth/login/data/dto/response/login_response.dart';
import 'package:restauranttdd0/features/auth/login/data/repository/login_repository.dart';

import '../../../../../data/login/login_test_data.dart';
import 'login_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginApiService>()])
void main() {
  late LoginApiService mockLoginApiService;

  setUp(() {
    mockLoginApiService = MockLoginApiService();
  });

  group(' login repository success', () {
    test('''

  Given a LoginRepository with mock of LoginApiService

  when user login

  then return success login response

  ''', () async {
      // given
      final repository = LoginRepository(mockLoginApiService);

// when
      when(mockLoginApiService.login(loginRequest))
          .thenAnswer((realInvocation) async {
        return loginRepositoryResponse;
      });

      final response = await repository.login(loginRequest);
// then

      expect(response, loginRepositoryResponse);

      expect(response, isA<LoginResponse>());
      verify(mockLoginApiService.login(loginRequest)).called(1);
    });
  });

  group(' login failure', () {
    test('''

Given LoginRepository with mock of loginApiService
when use login with request = { 'email': 'email', 'pass': 'password'}
then throw a failure response
''', () {
      // Given
      final respository = LoginRepository(mockLoginApiService);

      // When

      when(mockLoginApiService.login(loginRequest))
          .thenThrow(Failure(message: 'some thind when wrong'));

      // Then
      final response = respository.login(loginRequest);
      expect(
        response,
        throwsA(isA<Failure>()),
      );

      verify(mockLoginApiService.login(loginRequest)).called(1);
    });

    // --------------- test socket

    test('''

given LoginRepository with mock of loginApiService a login request
when user login
then throw a socler exception

 ''', () {
// given
      final respository = LoginRepository(mockLoginApiService);
// when

      when(mockLoginApiService.login(loginRequest))
          .thenThrow(const SocketException('message'));

// then

      final response = respository.login(loginRequest);
      expect(
        response,
        throwsA(isA<SocketException>()),
      );

      verify(mockLoginApiService.login(loginRequest)).called(1);
    });
  });
}
