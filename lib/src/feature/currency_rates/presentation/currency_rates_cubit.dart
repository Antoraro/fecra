import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/app_durations.dart';
import '../../settings/domain/use_cases/get_settings_data.dart';
import '../domain/models/latest_currency_rate_domain.dart';
import '../domain/use_cases/get_latest_currency_rates.dart';

part 'currency_rates_cubit.freezed.dart';
part 'currency_rates_state.dart';

class CurrencyRatesCubit extends Cubit<CurrencyRatesState> {
  Timer? _timer;
  StreamSubscription? _latestRatesSubscription;
  StreamSubscription? _settingsSubscription;

  Duration _refreshPeriod = AppDurations.refreshPeriod;

  final GetSettingsData _getSettingsData;
  final GetLatestCurrencyRates _getLatestCurrencyRates;
  CurrencyRatesCubit(this._getLatestCurrencyRates, this._getSettingsData)
      : super(const CurrencyRatesState.loading());

  @override
  Future<void> close() async {
    cancelTimer();
    await _settingsSubscription?.cancel();
    await _latestRatesSubscription?.cancel();
    super.close();
  }

  Future<void> init() async {
    try {
      _updateSettingsData();
      _updateLatestCurrencyRates();
      _restartTimer();
    } catch (e) {
      cancelTimer();
      emit(const CurrencyRatesState.error());
    }
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  void restartTimerAndRefreshData() {
    _getLatestCurrencyRates();

    _restartTimer();
  }

  void _restartTimer() {
    cancelTimer();
    _timer = Timer.periodic(
      _refreshPeriod,
      (timer) => _getLatestCurrencyRates(),
    );
  }

  Future<void> _updateLatestCurrencyRates() async {
    final stream = await _getLatestCurrencyRates();

    await _latestRatesSubscription?.cancel();
    _latestRatesSubscription = stream.listen((currencies) {
      if (state is CurrencyRatesStateContent) {
        emit((state as CurrencyRatesStateContent).copyWith(
          currencies: currencies,
        ));
      } else {
        emit(CurrencyRatesState.content(currencies: currencies));
      }
    });
  }

  Future<void> _updateSettingsData() async {
    await _settingsSubscription?.cancel();
    _settingsSubscription = _getSettingsData().listen((settings) {
      _refreshPeriod = settings.refreshPeriod;

      if (state is CurrencyRatesStateContent) {
        emit((state as CurrencyRatesStateContent).copyWith(
          isShortExchange: settings.isShortExchangeRate,
        ));
      } else {
        emit(CurrencyRatesState.content(
          isShortExchange: settings.isShortExchangeRate,
        ));
      }

      restartTimerAndRefreshData();
    });
  }
}
