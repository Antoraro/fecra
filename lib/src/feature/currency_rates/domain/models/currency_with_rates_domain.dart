import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'currency_domain.dart';
import 'rate_domain.dart';

@immutable
class CurrencyWithRatesDomain extends Equatable {
  final CurrencyDomain currency;
  final List<RateDomain> rates;
  const CurrencyWithRatesDomain({required this.currency, required this.rates});

  @override
  List<Object?> get props => [currency, rates];
}
