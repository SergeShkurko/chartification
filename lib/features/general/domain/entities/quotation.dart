import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation.freezed.dart';

@freezed
class Quotation with _$Quotation {
  const factory Quotation({
    required String symbol,
    required String name,
    required String description,
    required String currency,
    required int capitalization,
  }) = _Quotation;
}
