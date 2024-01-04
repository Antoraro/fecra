part of 'specific_currency_rates_cubit.dart';

@freezed
class SpecificCurrencyRatesState with _$SpecificCurrencyRatesState {
  const factory SpecificCurrencyRatesState.loading() =
      SpecificCurrencyRatesStateLoading;
  const factory SpecificCurrencyRatesState.content({
    CurrencyWithRatesDomain? data,
    @Default([]) List<double> lineData,
    @Default(false) bool isShortExchange,
  }) = SpecificCurrencyRatesStateContent;
  const factory SpecificCurrencyRatesState.error() =
      SpecificCurrencyRatesStateError;
}
