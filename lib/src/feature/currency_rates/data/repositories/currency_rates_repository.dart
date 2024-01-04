import '../../../../core/data/data_wrapper.dart';
import '../../domain/models/currency_with_rates_domain.dart';

abstract class CurrencyRatesRepository {
  Future<DataWrapper<Stream<CurrencyWithRatesDomain?>>> getCurrencyRates(
      String currencyId);
  Future<DataWrapper<Stream<List<CurrencyWithRatesDomain>>>> getAllCurrencies();
}
