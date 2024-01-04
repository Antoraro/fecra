import 'package:rxdart/rxdart.dart';

import '../../../../core/data/preferences/preferences.dart';
import '../models/settings_data.dart';

class GetSettingsData {
  final AppPreferences _prefs;
  GetSettingsData(this._prefs);

  Stream<SettingsData> call() => CombineLatestStream.combine2(
      _prefs.refreshPeriodStream,
      _prefs.isShortExchangeStream,
      (refreshPeriod, isShortExchangeRates) =>
          SettingsData(Duration(seconds: refreshPeriod), isShortExchangeRates));
}
