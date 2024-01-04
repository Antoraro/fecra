import '../../../../core/data/data_loader.dart';
import '../../data/repositories/currency_rates_repository.dart';
import '../models/currency_with_rates_domain.dart';

class GetAllCurrencies with DataLoader<List<CurrencyWithRatesDomain>> {
  final CurrencyRatesRepository _currencyRatesRepository;
  GetAllCurrencies(this._currencyRatesRepository);

  Future<Stream<List<CurrencyWithRatesDomain>>> call() =>
      dataStreamOrError(() => _currencyRatesRepository.getAllCurrencies());
}
