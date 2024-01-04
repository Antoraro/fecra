import 'package:fecra/src/core/ui/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/app_sizes.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final Widget trailing;
  const SettingsTile({super.key, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.p2,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.p12),
        ),
        title: Text(
          title,
          style: context.textTheme.titleMedium,
        ),
        trailing: trailing,
      ),
    );
  }
}
