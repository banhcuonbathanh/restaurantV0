import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/exception/failure.dart';
import '../data/dto/sign_up_response.dart';
import '../data/repository/isign_up_repository.dart';
import '../data/repository/sign_up_repository.dart';
import 'isign_up_service.dart';

/// provider to provide the instance of SignUpService
final signUpServiceProvider = Provider<ISignUpService>((ref) {
  final signUpRepository = ref.watch(signUpRepositoryProvider);

  return SignUpService(signUpRepository);
});

class SignUpService implements ISignUpService {
  final ISignUpRepository _signUpRepository;

  SignUpService(this._signUpRepository);

  @override
  Future<Result<SignUpResponse, Failure>> signUp(
      Map<String, dynamic> request) async {
    try {
      final response = await _signUpRepository.signUp(request);
      return Success(response);
    } on Failure catch (e) {
      return Error(e);
    }
  }
}
