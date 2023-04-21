// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Quotation {
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get capitalization => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuotationCopyWith<Quotation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotationCopyWith<$Res> {
  factory $QuotationCopyWith(Quotation value, $Res Function(Quotation) then) =
      _$QuotationCopyWithImpl<$Res, Quotation>;
  @useResult
  $Res call(
      {String symbol,
      String name,
      String description,
      String currency,
      int capitalization});
}

/// @nodoc
class _$QuotationCopyWithImpl<$Res, $Val extends Quotation>
    implements $QuotationCopyWith<$Res> {
  _$QuotationCopyWithImpl(this._value, this._then);

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
    Object? capitalization = null,
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
      capitalization: null == capitalization
          ? _value.capitalization
          : capitalization // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuotationCopyWith<$Res> implements $QuotationCopyWith<$Res> {
  factory _$$_QuotationCopyWith(
          _$_Quotation value, $Res Function(_$_Quotation) then) =
      __$$_QuotationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      String name,
      String description,
      String currency,
      int capitalization});
}

/// @nodoc
class __$$_QuotationCopyWithImpl<$Res>
    extends _$QuotationCopyWithImpl<$Res, _$_Quotation>
    implements _$$_QuotationCopyWith<$Res> {
  __$$_QuotationCopyWithImpl(
      _$_Quotation _value, $Res Function(_$_Quotation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? description = null,
    Object? currency = null,
    Object? capitalization = null,
  }) {
    return _then(_$_Quotation(
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
      capitalization: null == capitalization
          ? _value.capitalization
          : capitalization // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Quotation implements _Quotation {
  const _$_Quotation(
      {required this.symbol,
      required this.name,
      required this.description,
      required this.currency,
      required this.capitalization});

  @override
  final String symbol;
  @override
  final String name;
  @override
  final String description;
  @override
  final String currency;
  @override
  final int capitalization;

  @override
  String toString() {
    return 'Quotation(symbol: $symbol, name: $name, description: $description, currency: $currency, capitalization: $capitalization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quotation &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.capitalization, capitalization) ||
                other.capitalization == capitalization));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, symbol, name, description, currency, capitalization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuotationCopyWith<_$_Quotation> get copyWith =>
      __$$_QuotationCopyWithImpl<_$_Quotation>(this, _$identity);
}

abstract class _Quotation implements Quotation {
  const factory _Quotation(
      {required final String symbol,
      required final String name,
      required final String description,
      required final String currency,
      required final int capitalization}) = _$_Quotation;

  @override
  String get symbol;
  @override
  String get name;
  @override
  String get description;
  @override
  String get currency;
  @override
  int get capitalization;
  @override
  @JsonKey(ignore: true)
  _$$_QuotationCopyWith<_$_Quotation> get copyWith =>
      throw _privateConstructorUsedError;
}
