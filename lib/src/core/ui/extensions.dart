import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';

extension BuildContextExtended on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension GapExtension on num {
  Gap get gap => Gap(toDouble());
}

extension RouteParamsExtension on String {
  String addQueryParams([Map<String, dynamic>? queryParameters]) => Uri(
      path: this,
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value.toString()),
      )).toString();
}

extension NullOrEmptyExtension on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
