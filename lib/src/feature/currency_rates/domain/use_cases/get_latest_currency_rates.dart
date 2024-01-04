import 'package:collection/collection.dart';

import '../../../../core/data/data_loader.dart';
import '../../../../core/domain/errors.dart';
import '../models/latest_currency_rate_domain.dart';
import 'get_all_currencies.dart';

class GetLatestCurrencyRates with DataLoader<List<LatestCurrencyRateDomain>> {
  final GetAllCurrencies _getAllCurrencies;
  GetLatestCurrencyRates(this._getAllCurrencies);

  Future<Stream<List<LatestCurrencyRateDomain>>> call() async {
    try {
      final currenciesStream = await _getAllCurrencies().onError(
        (error, stackTrace) {
          return Future.error(error ?? UnknownError(), stackTrace);
        },
      );

      return currenciesStream.map((currencies) {
        return currencies
            .map((currency) {
              final rate = currency.rates.firstOrNull;
              if (rate == null) return null;

              return LatestCurrencyRateDomain(
                currency: currency.currency,
                rate: currency.rates.first,
              );
            })
            .whereNotNull()
            .toList();
      });
    } catch (e) {
      return Future.error(e);
    }
  }
}
