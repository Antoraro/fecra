import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/app_durations.dart';
import '../../../core/domain/use_case/wipe_database.dart';
import '../domain/use_cases/get_settings_data.dart';
import '../domain/use_cases/set_is_short_exchange_rates.dart';
import '../domain/use_cases/set_refresh_period.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  StreamSubscription? _settingsSubscription;

  final WipeDatabase _wipeDatabase;
  final GetSettingsData _getSettingsData;
  final SetIsShortExchangeRates _setIsShortExchangeRates;
  final SetRefreshPeriod _setRefreshPeriod;
  SettingsCubit(
    this._getSettingsData,
    this._setIsShortExchangeRates,
    this._setRefreshPeriod,
    this._wipeDatabase,
  ) : super(const SettingsState.loading());

  @override
  Future<void> close() async {
    await _settingsSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    await _settingsSubscription?.cancel();
    _settingsSubscription = _getSettingsData().listen((data) {
      emit(SettingsState.content(
        refreshPeriod: data.refreshPeriod,
        isShortExchangeRate: data.isShortExchangeRate,
      ));
    });
  }

  void setIsShortExchangeRate(bool value) {
    if (state is SettingsStateContent) {
      final state = this.state as SettingsStateContent;
      emit(state.copyWith(isShortExchangeRate: value));
    }
    _setIsShortExchangeRates(value);
  }

  void setRefreshPeriod(Duration value) {
    if (state is SettingsStateContent) {
      final state = this.state as SettingsStateContent;
      emit(state.copyWith(refreshPeriod: value));
    }
    _setRefreshPeriod(value.inSeconds);
  }

  Future<void> wipeDatabase() async {
    if (state is SettingsStateContent) {
      final state = this.state as SettingsStateContent;
      emit(const SettingsState.loading());
      await _wipeDatabase();
      emit(state);
    }
  }
}
