// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuotationResponse _$QuotationResponseFromJson(Map<String, dynamic> json) {
  return _QuotationResponse.fromJson(json);
}

/// @nodoc
mixin _$QuotationResponse {
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get marketCapitalization => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotationResponseCopyWith<QuotationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotationResponseCopyWith<$Res> {
  factory $QuotationResponseCopyWith(
          QuotationResponse value, $Res Function(QuotationResponse) then) =
      _$QuotationResponseCopyWithImpl<$Res, QuotationResponse>;
  @useResult
  $Res call(
      {String symbol,
      String name,
      String description,
      String currency,
      String marketCapitalization});
}

/// @nodoc
class _$QuotationResponseCopyWithImpl<$Res, $Val extends QuotationResponse>
    implements $QuotationResponseCopyWith<$Res> {
  _$QuotationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? description = null,
    Object? currency = null,
    Object? marketCapitalization = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      marketCapitalization: null == marketCapitalization
          ? _value.marketCapitalization
          : marketCapitalization // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuotationResponseCopyWith<$Res>
    implements $QuotationResponseCopyWith<$Res> {
  factory _$$_QuotationResponseCopyWith(_$_QuotationResponse value,
          $Res Function(_$_QuotationResponse) then) =
      __$$_QuotationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      String name,
      String description,
      String currency,
      String marketCapitalization});
}

/// @nodoc
class __$$_QuotationResponseCopyWithImpl<$Res>
    extends _$QuotationResponseCopyWithImpl<$Res, _$_QuotationResponse>
    implements _$$_QuotationResponseCopyWith<$Res> {
  __$$_QuotationResponseCopyWithImpl(
      _$_QuotationResponse _value, $Res Function(_$_QuotationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? description = null,
    Object? currency = null,
    Object? marketCapitalization = null,
  }) {
    return _then(_$_QuotationResponse(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      marketCapitalization: null == marketCapitalization
          ? _value.marketCapitalization
          : marketCapitalization // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$_QuotationResponse extends _QuotationResponse {
  const _$_QuotationResponse(
      {required this.symbol,
      required this.name,
      required this.description,
      required this.currency,
      required this.marketCapitalization})
      : super._();

  factory _$_QuotationResponse.fromJson(Map<String, dynamic> json) =>
      _$$_QuotationResponseFromJson(json);

  @override
  final String symbol;
  @override
  final String name;
  @override
  final String description;
  @override
  final String currency;
  @override
  final String marketCapitalization;

  @override
  String toString() {
    return 'QuotationResponse(symbol: $symbol, name: $name, description: $description, currency: $currency, marketCapitalization: $marketCapitalization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuotationResponse &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.marketCapitalization, marketCapitalization) ||
                other.marketCapitalization == marketCapitalization));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, symbol, name, description, currency, marketCapitalization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuotationResponseCopyWith<_$_QuotationResponse> get copyWith =>
      __$$_QuotationResponseCopyWithImpl<_$_QuotationResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuotationResponseToJson(
      this,
    );
  }
}

abstract class _QuotationResponse extends QuotationResponse {
  const factory _QuotationResponse(
      {required final String symbol,
      required final String name,
      required final String description,
      required final String currency,
      required final String marketCapitalization}) = _$_QuotationResponse;
  const _QuotationResponse._() : super._();

  factory _QuotationResponse.fromJson(Map<String, dynamic> json) =
      _$_QuotationResponse.fromJson;

  @override
  String get symbol;
  @override
  String get name;
  @override
  String get description;
  @override
  String get currency;
  @override
  String get marketCapitalization;
  @override
  @JsonKey(ignore: true)
  _$$_QuotationResponseCopyWith<_$_QuotationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
