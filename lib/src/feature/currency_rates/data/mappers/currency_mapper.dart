import 'package:collection/collection.dart';

import '../../../../core/data/database/database.dart';
import '../../domain/models/currency_domain.dart';
import '../../domain/models/currency_with_rates_domain.dart';
import '../../domain/models/rate_domain.dart';
import '../models/currency_dto.dart';

class CurrencyRatesMapper {
  static List<CurrencyEntity> currencyDtoToEntities(List<CurrencyDTO> dtoList) {
    return dtoList
        .map((dto) => CurrencyEntity(
              currencyKey: dto.key,
              name: dto.name,
              flag: dto.flag,
            ))
        .toList();
  }

  static List<ExchangeRateEntity> rateDtoToEntities(
    int timestamp,
    List<CurrencyDTO> dtoList,
  ) {
    return dtoList
        .map((dto) => ExchangeRateEntity(
              id: -1,
              timestamp: timestamp,
              currencyId: dto.key,
              exchange: dto.exchange,
            ))
        .toList();
  }

  static List<CurrencyWithRatesDomain> entitiesToDomain(
      List<CurrencyWithExchangeRatesViewData> list) {
    if (list.isEmpty) return [];

    return list
        .groupListsBy((view) => view.currencyId)
        .entries
        .map((entry) {
          try {
            final currency = CurrencyDomain(
              id: entry.key,
              name: entry.value.first.name,
              flag: entry.value.first.flag,
            );

            final rates = entry.value
                .map((view) => RateDomain(
                    exchange: view.exchange,
                    currencyId: view.currencyId,
                    timestamp: DateTime.fromMillisecondsSinceEpoch(
                      view.timestamp,
                    )))
                .toList();

            return CurrencyWithRatesDomain(
              currency: currency,
              rates: rates,
            );
          } catch (e) {
            return null;
          }
        })
        .whereNotNull()
        .toList();
  }
}
