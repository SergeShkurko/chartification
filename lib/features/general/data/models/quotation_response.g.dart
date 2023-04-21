// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuotationResponse _$$_QuotationResponseFromJson(Map<String, dynamic> json) =>
    _$_QuotationResponse(
      symbol: json['Symbol'] as String,
      name: json['Name'] as String,
      description: json['Description'] as String,
      currency: json['Currency'] as String,
      marketCapitalization: json['MarketCapitalization'] as String,
    );

Map<String, dynamic> _$$_QuotationResponseToJson(
        _$_QuotationResponse instance) =>
    <String, dynamic>{
      'Symbol': instance.symbol,
      'Name': instance.name,
      'Description': instance.description,
      'Currency': instance.currency,
      'MarketCapitalization': instance.marketCapitalization,
    };
