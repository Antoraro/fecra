import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class CurrencyDomain extends Equatable {
  final String id;
  final String name;
  final String flag;

  const CurrencyDomain({
    required this.id,
    required this.name,
    required this.flag,
  });

  @override
  List<Object?> get props => [id, name, flag];
}
