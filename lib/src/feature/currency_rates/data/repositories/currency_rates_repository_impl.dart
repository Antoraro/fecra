import '../../../../core/data/data_wrapper.dart';
import '../../../../core/data/datachef_flows.dart';
import '../../../../core/data/preferences/preferences.dart';
import '../../../../core/data/remote/last_fetched_dao.dart';
import '../../../../core/data/remote/remote_datastore.dart';
import '../../../../core/domain/use_case/get_current_date_time.dart';
import '../../domain/models/currency_with_rates_domain.dart';
import '../dao/currency_rates_dao.dart';
import '../mappers/currency_mapper.dart';
import '../models/currency_rates_dto.dart';
import '../remote/currency_rates_api.dart';
import 'currency_rates_repository.dart';

class CurrencyRatesRepositoryImpl
    with RemoteDatastore
    implements CurrencyRatesRepository {
  final GetCurrentDateTime _getCurrentDateTime;
  final CurrencyRatesApi _currencyRatesApi;
  final CurrencyRatesDao _currencyRatesDao;
  final LastFetchedDao _lastFetchedDao;
  final AppPreferences _appPreferences;
  const CurrencyRatesRepositoryImpl(
    this._getCurrentDateTime,
    this._currencyRatesDao,
    this._currencyRatesApi,
    this._lastFetchedDao,
    this._appPreferences,
  );

  @override
  Future<DataWrapper<Stream<CurrencyWithRatesDomain?>>> getCurrencyRates(
          String currencyId) async =>
      getDataFlowAsCold(
        lastFetched:
            await _lastFetchedDao.getLastFetched(const LastFetchedKeyRates()),
        setLastFetched: (time) =>
            _lastFetchedDao.setLastFetched(const LastFetchedKeyRates(), time),
        getFromLocalSource: () => _currencyRatesDao
            .getCurrencyById(currencyId)
            .map((list) =>
                CurrencyRatesMapper.entitiesToDomain(list).firstOrNull),
        getFromRemoteSource: () =>
            getFromRemoteSource(() => _currencyRatesApi.getCurrencyRates()),
        setToLocalSource: _setToLocalSource,
        getCurrentDateTime: _getCurrentDateTime.call,
        getCacheDuration: () =>
            Duration(seconds: _appPreferences.getRefreshPeriod()),
        getThrottleDuration: () =>
            Duration(seconds: _appPreferences.getRefreshPeriod()),
      );

  @override
  Future<DataWrapper<Stream<List<CurrencyWithRatesDomain>>>>
      getAllCurrencies() async => getDataFlowAsCold(
            lastFetched: await _lastFetchedDao
                .getLastFetched(const LastFetchedKeyCurrencies()),
            setLastFetched: (time) => _lastFetchedDao.setLastFetched(
                const LastFetchedKeyCurrencies(), time),
            getFromLocalSource: () => _currencyRatesDao
                .getAllCurrencies()
                .map((list) => CurrencyRatesMapper.entitiesToDomain(list)),
            getFromRemoteSource: () =>
                getFromRemoteSource(() => _currencyRatesApi.getCurrencyRates()),
            setToLocalSource: _setToLocalSource,
            getCurrentDateTime: _getCurrentDateTime.call,
            getCacheDuration: () =>
                Duration(seconds: _appPreferences.getRefreshPeriod()),
            getThrottleDuration: () =>
                Duration(seconds: _appPreferences.getRefreshPeriod()),
          );

  Future<void> _setToLocalSource(CurrencyRatesDTO dto) async {
    final currencies =
        CurrencyRatesMapper.currencyDtoToEntities(dto.currencies);
    final rates =
        CurrencyRatesMapper.rateDtoToEntities(dto.timestamp, dto.currencies);

    if (currencies.isNotEmpty) {
      await _currencyRatesDao.insertCurrencies(currencies);
    }
    if (rates.isNotEmpty) {
      await _currencyRatesDao.insertExchangeRates(rates);
    }
  }
}
