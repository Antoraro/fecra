import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/app_durations.dart';

@immutable
class SettingsData {
  final Duration refreshPeriod;
  final bool isShortExchangeRate;

  const SettingsData(this.refreshPeriod, this.isShortExchangeRate);

  factory SettingsData.basic() =>
      const SettingsData(AppDurations.refreshPeriod, false);
}
