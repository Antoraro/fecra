// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyDTODataImpl _$$CurrencyDTODataImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrencyDTODataImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      exchange: (json['exchange'] as num).toDouble(),
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$$CurrencyDTODataImplToJson(
        _$CurrencyDTODataImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'exchange': instance.exchange,
      'flag': instance.flag,
    };
