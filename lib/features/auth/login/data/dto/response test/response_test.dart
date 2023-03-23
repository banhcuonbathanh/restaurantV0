import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_test.freezed.dart';
part 'response_test.g.dart';

@freezed
class LoginResponseTest with _$LoginResponseTest {
  const factory LoginResponseTest({
    // @JsonKey(name: 'access_token') required String accessToken,
    // @JsonKey(name: 'token_id') required String tokenId,
    // @JsonKey(name: 'user_id') required int userId,
    required String name,
    required String email,
    required String id,
    required String gender,
    required String status,
  }) = _LoginResponseTest;

  factory LoginResponseTest.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseTestFromJson(json);
}
