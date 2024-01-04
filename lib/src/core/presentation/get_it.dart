import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../feature/currency_rates/data/dao/currency_rates_dao.dart';
import '../../feature/currency_rates/data/remote/currency_rates_api.dart';
import '../../feature/currency_rates/data/repositories/currency_rates_repository.dart';
import '../../feature/currency_rates/data/repositories/currency_rates_repository_impl.dart';
import '../../feature/currency_rates/domain/use_cases/get_all_currencies.dart';
import '../../feature/currency_rates/domain/use_cases/get_latest_currency_rates.dart';
import '../../feature/currency_rates/domain/use_cases/get_specific_currency_rates.dart';
import '../../feature/currency_rates/presentation/currency_rates_cubit.dart';
import '../../feature/currency_rates/presentation/specific/specific_currency_rates_cubit.dart';
import '../../feature/settings/domain/use_cases/get_settings_data.dart';
import '../../feature/settings/domain/use_cases/set_is_short_exchange_rates.dart';
import '../../feature/settings/domain/use_cases/set_refresh_period.dart';
import '../../feature/settings/presentation/settings_cubit.dart';
import '../data/app_durations.dart';
import '../data/database/database.dart';
import '../data/preferences/preferences.dart';
import '../data/preferences/preferences_impl.dart';
import '../data/remote/auth_interceptor.dart';
import '../data/remote/fecra_api.dart';
import '../data/remote/last_fetched_dao.dart';
import '../domain/use_case/get_current_date_time.dart';
import '../domain/use_case/wipe_database.dart';

Dio _getDio(GetIt getIt) {
  final dio = Dio(BaseOptions(
    contentType: Headers.jsonContentType,
    connectTimeout: AppDurations.connectionTimeout,
    receiveTimeout: AppDurations.connectionTimeout,
  ));

  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(PrettyDioLogger());

  return dio;
}

Future<void> _appDb(GetIt getIt) async {
  final isolate = await createDbIsolate();

  getIt.registerSingleton(AppDb(await isolate.connect(singleClientMode: true)));
}

void _coreProviders(GetIt getIt, AppPreferences prefs) {
  getIt.registerSingleton(prefs);
}

void _coreUseCases(GetIt getIt) {
  getIt.registerSingleton(GetCurrentDateTime());
  getIt.registerSingleton(WipeDatabase(getIt()));
}

void _daos(GetIt getIt) {
  getIt.registerSingleton(LastFetchedDao(getIt()));
  getIt.registerSingleton(CurrencyRatesDao(getIt()));
}

void _apis(GetIt getIt) {
  getIt.registerSingleton(FecraApi(_getDio(getIt), baseUrl: baseUrl));
  getIt.registerSingleton<CurrencyRatesApi>(getIt<FecraApi>());
}

void _repositories(GetIt getIt) {
  getIt.registerSingleton<CurrencyRatesRepository>(CurrencyRatesRepositoryImpl(
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
  ));
}

void _usecases(GetIt getIt) {
  getIt.registerSingleton(GetAllCurrencies(getIt()));
  getIt.registerSingleton(GetLatestCurrencyRates(getIt()));
  getIt.registerSingleton(GetSpecificCurrencyRates(getIt()));
  getIt.registerSingleton(GetSettingsData(getIt()));
  getIt.registerSingleton(SetIsShortExchangeRates(getIt()));
  getIt.registerSingleton(SetRefreshPeriod(getIt()));
}

void _blocs(GetIt getIt) {
  getIt.registerSingleton(CurrencyRatesCubit(getIt(), getIt()));
  getIt.registerSingleton(SpecificCurrencyRatesCubit(getIt(), getIt()));
  getIt.registerSingleton(SettingsCubit(
    getIt(),
    getIt(),
    getIt(),
    getIt(),
  ));
}

Future<void> initGetIt() async {
  final getIt = GetIt.instance;
  final prefs = await AppPreferencesImpl.instance();

  _coreProviders(getIt, prefs);
  await _appDb(getIt);
  _coreUseCases(getIt);
  _daos(getIt);
  _apis(getIt);
  _repositories(getIt);
  _usecases(getIt);
  _blocs(getIt);
}
