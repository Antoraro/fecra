import 'package:freezed_annotation/freezed_annotation.dart';

import 'currency_dto.dart';

part 'currency_rates_dto.freezed.dart';
part 'currency_rates_dto.g.dart';

@freezed
sealed class CurrencyRatesDTO with _$CurrencyRatesDTO {
  const factory CurrencyRatesDTO({
    required List<CurrencyDTO> currencies,
    required int timestamp,
  }) = CurrencyRatesDTOData;

  factory CurrencyRatesDTO.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRatesDTOFromJson(json);
}
