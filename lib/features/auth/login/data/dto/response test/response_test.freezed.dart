// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginResponseTest _$LoginResponseTestFromJson(Map<String, dynamic> json) {
  return _LoginResponseTest.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseTest {
// @JsonKey(name: 'access_token') required String accessToken,
// @JsonKey(name: 'token_id') required String tokenId,
// @JsonKey(name: 'user_id') required int userId,
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseTestCopyWith<LoginResponseTest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseTestCopyWith<$Res> {
  factory $LoginResponseTestCopyWith(
          LoginResponseTest value, $Res Function(LoginResponseTest) then) =
      _$LoginResponseTestCopyWithImpl<$Res, LoginResponseTest>;
  @useResult
  $Res call(
      {String name, String email, String id, String gender, String status});
}

/// @nodoc
class _$LoginResponseTestCopyWithImpl<$Res, $Val extends LoginResponseTest>
    implements $LoginResponseTestCopyWith<$Res> {
  _$LoginResponseTestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? id = null,
    Object? gender = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginResponseTestCopyWith<$Res>
    implements $LoginResponseTestCopyWith<$Res> {
  factory _$$_LoginResponseTestCopyWith(_$_LoginResponseTest value,
          $Res Function(_$_LoginResponseTest) then) =
      __$$_LoginResponseTestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String email, String id, String gender, String status});
}

/// @nodoc
class __$$_LoginResponseTestCopyWithImpl<$Res>
    extends _$LoginResponseTestCopyWithImpl<$Res, _$_LoginResponseTest>
    implements _$$_LoginResponseTestCopyWith<$Res> {
  __$$_LoginResponseTestCopyWithImpl(
      _$_LoginResponseTest _value, $Res Function(_$_LoginResponseTest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? id = null,
    Object? gender = null,
    Object? status = null,
  }) {
    return _then(_$_LoginResponseTest(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginResponseTest implements _LoginResponseTest {
  const _$_LoginResponseTest(
      {required this.name,
      required this.email,
      required this.id,
      required this.gender,
      required this.status});

  factory _$_LoginResponseTest.fromJson(Map<String, dynamic> json) =>
      _$$_LoginResponseTestFromJson(json);

// @JsonKey(name: 'access_token') required String accessToken,
// @JsonKey(name: 'token_id') required String tokenId,
// @JsonKey(name: 'user_id') required int userId,
  @override
  final String name;
  @override
  final String email;
  @override
  final String id;
  @override
  final String gender;
  @override
  final String status;

  @override
  String toString() {
    return 'LoginResponseTest(name: $name, email: $email, id: $id, gender: $gender, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginResponseTest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, id, gender, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginResponseTestCopyWith<_$_LoginResponseTest> get copyWith =>
      __$$_LoginResponseTestCopyWithImpl<_$_LoginResponseTest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginResponseTestToJson(
      this,
    );
  }
}

abstract class _LoginResponseTest implements LoginResponseTest {
  const factory _LoginResponseTest(
      {required final String name,
      required final String email,
      required final String id,
      required final String gender,
      required final String status}) = _$_LoginResponseTest;

  factory _LoginResponseTest.fromJson(Map<String, dynamic> json) =
      _$_LoginResponseTest.fromJson;

  @override // @JsonKey(name: 'access_token') required String accessToken,
// @JsonKey(name: 'token_id') required String tokenId,
// @JsonKey(name: 'user_id') required int userId,
  String get name;
  @override
  String get email;
  @override
  String get id;
  @override
  String get gender;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_LoginResponseTestCopyWith<_$_LoginResponseTest> get copyWith =>
      throw _privateConstructorUsedError;
}
