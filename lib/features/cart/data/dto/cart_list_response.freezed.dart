// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartListResponse _$CartListResponseFromJson(Map<String, dynamic> json) {
  return _CartListResponse.fromJson(json);
}

/// @nodoc
mixin _$CartListResponse {
  List<CartItemResponseData> get data => throw _privateConstructorUsedError;
  double get cartTotal => throw _privateConstructorUsedError;
  int get badgeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartListResponseCopyWith<CartListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartListResponseCopyWith<$Res> {
  factory $CartListResponseCopyWith(
          CartListResponse value, $Res Function(CartListResponse) then) =
      _$CartListResponseCopyWithImpl<$Res, CartListResponse>;
  @useResult
  $Res call(
      {List<CartItemResponseData> data, double cartTotal, int badgeCount});
}

/// @nodoc
class _$CartListResponseCopyWithImpl<$Res, $Val extends CartListResponse>
    implements $CartListResponseCopyWith<$Res> {
  _$CartListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? cartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CartItemResponseData>,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as double,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartListResponseCopyWith<$Res>
    implements $CartListResponseCopyWith<$Res> {
  factory _$$_CartListResponseCopyWith(
          _$_CartListResponse value, $Res Function(_$_CartListResponse) then) =
      __$$_CartListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartItemResponseData> data, double cartTotal, int badgeCount});
}

/// @nodoc
class __$$_CartListResponseCopyWithImpl<$Res>
    extends _$CartListResponseCopyWithImpl<$Res, _$_CartListResponse>
    implements _$$_CartListResponseCopyWith<$Res> {
  __$$_CartListResponseCopyWithImpl(
      _$_CartListResponse _value, $Res Function(_$_CartListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? cartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_$_CartListResponse(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CartItemResponseData>,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as double,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartListResponse implements _CartListResponse {
  const _$_CartListResponse(
      {final List<CartItemResponseData> data = const [],
      this.cartTotal = 0.0,
      this.badgeCount = 0})
      : _data = data;

  factory _$_CartListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CartListResponseFromJson(json);

  final List<CartItemResponseData> _data;
  @override
  @JsonKey()
  List<CartItemResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final double cartTotal;
  @override
  @JsonKey()
  final int badgeCount;

  @override
  String toString() {
    return 'CartListResponse(data: $data, cartTotal: $cartTotal, badgeCount: $badgeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartListResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal) &&
            (identical(other.badgeCount, badgeCount) ||
                other.badgeCount == badgeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), cartTotal, badgeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartListResponseCopyWith<_$_CartListResponse> get copyWith =>
      __$$_CartListResponseCopyWithImpl<_$_CartListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartListResponseToJson(
      this,
    );
  }
}

abstract class _CartListResponse implements CartListResponse {
  const factory _CartListResponse(
      {final List<CartItemResponseData> data,
      final double cartTotal,
      final int badgeCount}) = _$_CartListResponse;

  factory _CartListResponse.fromJson(Map<String, dynamic> json) =
      _$_CartListResponse.fromJson;

  @override
  List<CartItemResponseData> get data;
  @override
  double get cartTotal;
  @override
  int get badgeCount;
  @override
  @JsonKey(ignore: true)
  _$$_CartListResponseCopyWith<_$_CartListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItemResponseData _$CartItemResponseDataFromJson(Map<String, dynamic> json) {
  return _CartItemResponseData.fromJson(json);
}

/// @nodoc
mixin _$CartItemResponseData {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_description')
  String get shortDescription => throw _privateConstructorUsedError;
  String get qty => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'discounted_price')
  String get discountedPrice => throw _privateConstructorUsedError;
  String get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'line_amount')
  String get lineAmount => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemResponseDataCopyWith<CartItemResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemResponseDataCopyWith<$Res> {
  factory $CartItemResponseDataCopyWith(CartItemResponseData value,
          $Res Function(CartItemResponseData) then) =
      _$CartItemResponseDataCopyWithImpl<$Res, CartItemResponseData>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'short_description') String shortDescription,
      String qty,
      String price,
      @JsonKey(name: 'discounted_price') String discountedPrice,
      String discount,
      @JsonKey(name: 'line_amount') String lineAmount,
      String thumbnail,
      String currency});
}

/// @nodoc
class _$CartItemResponseDataCopyWithImpl<$Res,
        $Val extends CartItemResponseData>
    implements $CartItemResponseDataCopyWith<$Res> {
  _$CartItemResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productId = null,
    Object? productName = null,
    Object? shortDescription = null,
    Object? qty = null,
    Object? price = null,
    Object? discountedPrice = null,
    Object? discount = null,
    Object? lineAmount = null,
    Object? thumbnail = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discountedPrice: null == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String,
      lineAmount: null == lineAmount
          ? _value.lineAmount
          : lineAmount // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartItemResponseDataCopyWith<$Res>
    implements $CartItemResponseDataCopyWith<$Res> {
  factory _$$_CartItemResponseDataCopyWith(_$_CartItemResponseData value,
          $Res Function(_$_CartItemResponseData) then) =
      __$$_CartItemResponseDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'short_description') String shortDescription,
      String qty,
      String price,
      @JsonKey(name: 'discounted_price') String discountedPrice,
      String discount,
      @JsonKey(name: 'line_amount') String lineAmount,
      String thumbnail,
      String currency});
}

/// @nodoc
class __$$_CartItemResponseDataCopyWithImpl<$Res>
    extends _$CartItemResponseDataCopyWithImpl<$Res, _$_CartItemResponseData>
    implements _$$_CartItemResponseDataCopyWith<$Res> {
  __$$_CartItemResponseDataCopyWithImpl(_$_CartItemResponseData _value,
      $Res Function(_$_CartItemResponseData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productId = null,
    Object? productName = null,
    Object? shortDescription = null,
    Object? qty = null,
    Object? price = null,
    Object? discountedPrice = null,
    Object? discount = null,
    Object? lineAmount = null,
    Object? thumbnail = null,
    Object? currency = null,
  }) {
    return _then(_$_CartItemResponseData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discountedPrice: null == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String,
      lineAmount: null == lineAmount
          ? _value.lineAmount
          : lineAmount // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartItemResponseData implements _CartItemResponseData {
  const _$_CartItemResponseData(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'short_description') required this.shortDescription,
      required this.qty,
      required this.price,
      @JsonKey(name: 'discounted_price') this.discountedPrice = '0.0',
      this.discount = '0.0',
      @JsonKey(name: 'line_amount') required this.lineAmount,
      required this.thumbnail,
      required this.currency});

  factory _$_CartItemResponseData.fromJson(Map<String, dynamic> json) =>
      _$$_CartItemResponseDataFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'short_description')
  final String shortDescription;
  @override
  final String qty;
  @override
  final String price;
  @override
  @JsonKey(name: 'discounted_price')
  final String discountedPrice;
  @override
  @JsonKey()
  final String discount;
  @override
  @JsonKey(name: 'line_amount')
  final String lineAmount;
  @override
  final String thumbnail;
  @override
  final String currency;

  @override
  String toString() {
    return 'CartItemResponseData(id: $id, userId: $userId, productId: $productId, productName: $productName, shortDescription: $shortDescription, qty: $qty, price: $price, discountedPrice: $discountedPrice, discount: $discount, lineAmount: $lineAmount, thumbnail: $thumbnail, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemResponseData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.lineAmount, lineAmount) ||
                other.lineAmount == lineAmount) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      productId,
      productName,
      shortDescription,
      qty,
      price,
      discountedPrice,
      discount,
      lineAmount,
      thumbnail,
      currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartItemResponseDataCopyWith<_$_CartItemResponseData> get copyWith =>
      __$$_CartItemResponseDataCopyWithImpl<_$_CartItemResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartItemResponseDataToJson(
      this,
    );
  }
}

abstract class _CartItemResponseData implements CartItemResponseData {
  const factory _CartItemResponseData(
      {required final String id,
      @JsonKey(name: 'user_id')
          required final String userId,
      @JsonKey(name: 'product_id')
          required final String productId,
      @JsonKey(name: 'product_name')
          required final String productName,
      @JsonKey(name: 'short_description')
          required final String shortDescription,
      required final String qty,
      required final String price,
      @JsonKey(name: 'discounted_price')
          final String discountedPrice,
      final String discount,
      @JsonKey(name: 'line_amount')
          required final String lineAmount,
      required final String thumbnail,
      required final String currency}) = _$_CartItemResponseData;

  factory _CartItemResponseData.fromJson(Map<String, dynamic> json) =
      _$_CartItemResponseData.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'short_description')
  String get shortDescription;
  @override
  String get qty;
  @override
  String get price;
  @override
  @JsonKey(name: 'discounted_price')
  String get discountedPrice;
  @override
  String get discount;
  @override
  @JsonKey(name: 'line_amount')
  String get lineAmount;
  @override
  String get thumbnail;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemResponseDataCopyWith<_$_CartItemResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}
