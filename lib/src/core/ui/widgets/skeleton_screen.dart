import 'package:fecra/src/core/ui/extensions.dart';
import 'package:flutter/material.dart';

class SkeletonScreen extends StatelessWidget {
  final String title;
  final VoidCallback? navigateBack;
  const SkeletonScreen({
    super.key,
    required this.title,
    this.navigateBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            navigateBack != null ? BackButton(onPressed: navigateBack) : null,
        title: Text(title, style: context.textTheme.bodyLarge),
      ),
      body: Center(
        child: Text(title, style: context.textTheme.bodyLarge),
      ),
    );
  }
}
