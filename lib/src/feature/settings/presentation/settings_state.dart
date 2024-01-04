part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = SettingsStateLoading;
  const factory SettingsState.content({
    @Default(AppDurations.refreshPeriod) Duration refreshPeriod,
    @Default(false) bool isShortExchangeRate,
  }) = SettingsStateContent;
  const factory SettingsState.error() = SettingsStateError;
}
