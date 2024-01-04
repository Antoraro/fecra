// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_rates_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyRatesDTODataImpl _$$CurrencyRatesDTODataImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrencyRatesDTODataImpl(
      currencies: (json['currencies'] as List<dynamic>)
          .map((e) => CurrencyDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$$CurrencyRatesDTODataImplToJson(
        _$CurrencyRatesDTODataImpl instance) =>
    <String, dynamic>{
      'currencies': instance.currencies,
      'timestamp': instance.timestamp,
    };
