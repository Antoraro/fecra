part of 'currency_rates_cubit.dart';

@freezed
class CurrencyRatesState with _$CurrencyRatesState {
  const factory CurrencyRatesState.loading() = CurrencyRatesStateLoading;
  const factory CurrencyRatesState.content({
    @Default([]) List<LatestCurrencyRateDomain> currencies,
    @Default(false) bool isShortExchange,
  }) = CurrencyRatesStateContent;
  const factory CurrencyRatesState.error() = CurrencyRatesStateError;
}
