import '../models/currency_rates_dto.dart';

abstract class CurrencyRatesApi {
  Future<CurrencyRatesDTO> getCurrencyRates();
}
