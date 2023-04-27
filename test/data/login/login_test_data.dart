import 'package:restauranttdd0/features/auth/login/data/dto/response/login_response.dart';

final Map<String, dynamic> loginRequest = {
  'email': 'email',
  'pass': 'abc123',
};

const loginRepositoryResponse = LoginResponse(
    accessToken: 'true', email: 'email', name: '', tokenId: '', userId: 1);
