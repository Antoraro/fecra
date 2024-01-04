import '../../../../core/data/preferences/preferences.dart';

class SetRefreshPeriod {
  final AppPreferences _prefs;
  SetRefreshPeriod(this._prefs);

  Future<void> call(int value) => _prefs.setRefreshPeriod(value);
}
