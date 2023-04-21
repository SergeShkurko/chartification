import 'package:chartification/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation_response.freezed.dart';
part 'quotation_response.g.dart';

@freezed
class QuotationResponse with _$QuotationResponse {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory QuotationResponse({
    required String symbol,
    required String name,
    required String description,
    required String currency,
    required String marketCapitalization,
  }) = _QuotationResponse;

  const QuotationResponse._();

  factory QuotationResponse.fromJson(Map<String, dynamic> json) =>
      _$QuotationResponseFromJson(json);

  Quotation toEntity() => Quotation(
        symbol: symbol,
        name: name,
        description: description,
        currency: currency,
        capitalization: int.tryParse(marketCapitalization) ?? 0,
      );
}
