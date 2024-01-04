import 'package:drift/drift.dart';

import '../../../../core/data/database/database.dart';

class CurrencyRatesDao {
  final AppDb _appDb;
  CurrencyRatesDao(this._appDb);

  Stream<List<CurrencyWithExchangeRatesViewData>> getAllCurrencies() {
    return _appDb.getAllCurrencies().watch();
  }

  Stream<List<CurrencyWithExchangeRatesViewData>> getCurrencyById(String key) {
    return _appDb.getCurrencyByKey(key).watch();
  }

  Future<void> insertCurrencies(List<CurrencyEntity> currencies) async {
    await _appDb.batch((batch) {
      for (var currency in currencies) {
        batch.insert(
          _appDb.currencyEntity,
          CurrencyEntityCompanion.insert(
            currencyKey: currency.currencyKey,
            name: currency.name,
            flag: currency.flag,
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  Stream<List<ExchangeRateWithCurrencyViewData>> getAllExchangeRates() {
    return _appDb.getAllExchangeRates().watch();
  }

  Future<void> insertExchangeRates(List<ExchangeRateEntity> rates) async {
    await _appDb.batch((batch) {
      for (var rate in rates) {
        batch.insert(
          _appDb.exchangeRateEntity,
          ExchangeRateEntityCompanion.insert(
            timestamp: rate.timestamp,
            currencyId: rate.currencyId,
            exchange: rate.exchange,
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }
}
