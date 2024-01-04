import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'currency_domain.dart';
import 'rate_domain.dart';

@immutable
class LatestCurrencyRateDomain extends Equatable {
  final CurrencyDomain currency;
  final RateDomain rate;
  const LatestCurrencyRateDomain({required this.currency, required this.rate});

  @override
  List<Object?> get props => [currency, rate];
}
