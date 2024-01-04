import '../../../../core/data/data_loader.dart';
import '../../data/repositories/currency_rates_repository.dart';
import '../models/currency_with_rates_domain.dart';

class GetSpecificCurrencyRates with DataLoader<CurrencyWithRatesDomain?> {
  final CurrencyRatesRepository _currencyRatesRepository;
  GetSpecificCurrencyRates(this._currencyRatesRepository);

  Future<Stream<CurrencyWithRatesDomain?>> call(String id) =>
      dataStreamOrError(() => _currencyRatesRepository.getCurrencyRates(id));
}
