class Routes {
  /// route names
  static const splash = 'splash';
  static const currencyRates = 'currency_rates';
  static const specific = 'specific';
  static const settings = 'settings';

  /// routes map
  static const rootSplash = '/$splash';

  static const rootCurrencyRates = '/$currencyRates';
  static const currencyRateSpecific = '$rootCurrencyRates/$specific';

  static const rootSettings = '/$settings';
}
