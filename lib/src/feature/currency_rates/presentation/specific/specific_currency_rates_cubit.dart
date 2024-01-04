import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../settings/domain/use_cases/get_settings_data.dart';
import '../../domain/models/currency_with_rates_domain.dart';
import '../../domain/use_cases/get_specific_currency_rates.dart';

part 'specific_currency_rates_cubit.freezed.dart';
part 'specific_currency_rates_state.dart';

class SpecificCurrencyRatesCubit extends Cubit<SpecificCurrencyRatesState> {
  StreamSubscription? _ratesSubscription;
  StreamSubscription? _settingsSubscription;

  final GetSpecificCurrencyRates _getSpecificCurrencyRates;
  final GetSettingsData _getSettingsData;
  SpecificCurrencyRatesCubit(
      this._getSpecificCurrencyRates, this._getSettingsData)
      : super(const SpecificCurrencyRatesState.loading());

  @override
  Future<void> close() async {
    await _settingsSubscription?.cancel();
    await _ratesSubscription?.cancel();
    super.close();
  }

  Future<void> init(String? id) async {
    if (id == null) {
      emit(const SpecificCurrencyRatesState.error());
      return;
    }

    try {
      _updateSettings();
      _updateRates(id);
    } catch (e) {
      emit(const SpecificCurrencyRatesState.error());
    }
  }

  Future<void> _updateRates(String id) async {
    final stream = await _getSpecificCurrencyRates(id);

    await _ratesSubscription?.cancel();
    _ratesSubscription = stream.listen((data) {
      if (data == null) {
        emit(const SpecificCurrencyRatesState.error());
        return;
      }
      final lineData =
          data.rates.take(15).toList().reversed.map((e) => e.exchange).toList();

      if (state is SpecificCurrencyRatesStateContent) {
        emit((state as SpecificCurrencyRatesStateContent).copyWith(
          data: data,
          lineData: lineData,
        ));
      } else {
        emit(SpecificCurrencyRatesState.content(
          data: data,
          lineData: lineData,
        ));
      }
    });
  }

  Future<void> _updateSettings() async {
    await _settingsSubscription?.cancel();
    _settingsSubscription = _getSettingsData().listen((settings) {
      if (state is SpecificCurrencyRatesStateContent) {
        emit((state as SpecificCurrencyRatesStateContent).copyWith(
          isShortExchange: settings.isShortExchangeRate,
        ));
      } else {
        emit(SpecificCurrencyRatesState.content(
          isShortExchange: settings.isShortExchangeRate,
        ));
      }
    });
  }
}
