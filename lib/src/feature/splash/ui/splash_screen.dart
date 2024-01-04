import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/ui/app_colors.dart';
import '../../../core/ui/app_sizes.dart';

const _splashDuration = Duration(seconds: 2);
const _progressLeftPadding = 13.0;
const _progressTopPadding = 3.0;
const _progressSize = 160.0;

class SplashScreen extends StatefulWidget {
  final VoidCallback navigateToApp;
  const SplashScreen({super.key, required this.navigateToApp});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(_splashDuration, () {
      widget.navigateToApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Stack(
        children: [
          Center(child: Assets.icons.iclauncher.image()),
          const Positioned(
            left: _progressLeftPadding,
            top: _progressTopPadding,
            right: AppSizes.zero,
            bottom: AppSizes.zero,
            child: Center(
              child: SizedBox(
                height: _progressSize,
                width: _progressSize,
                child: CircularProgressIndicator(
                  color: AppColors.accent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
