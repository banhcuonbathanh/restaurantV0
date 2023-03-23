import 'package:multiple_result/multiple_result.dart';

import '../../../../core/exception/failure.dart';
import '../data/dto/sign_up_response.dart';

abstract class ISignUpService {
  Future<Result<SignUpResponse, Failure>> signUp(Map<String, dynamic> request);
}
