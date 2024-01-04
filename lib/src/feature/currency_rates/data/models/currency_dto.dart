import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_dto.freezed.dart';
part 'currency_dto.g.dart';

@freezed
sealed class CurrencyDTO with _$CurrencyDTO {
  const factory CurrencyDTO({
    required String key,
    required String name,
    required double exchange,
    required String flag,
  }) = CurrencyDTOData;

  factory CurrencyDTO.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDTOFromJson(json);
}
