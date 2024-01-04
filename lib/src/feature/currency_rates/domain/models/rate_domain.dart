import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class RateDomain extends Equatable {
  final String currencyId;
  final double exchange;
  final DateTime timestamp;

  const RateDomain({
    required this.currencyId,
    required this.exchange,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [currencyId, exchange, timestamp];
}
