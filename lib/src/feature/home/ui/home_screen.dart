import 'package:fecra/src/core/ui/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/navigation/routes.dart';

class RootScreen {
  final String label;
  final Widget icon;
  final String location;

  const RootScreen(
    this.label,
    this.icon,
    this.location,
  );
}

class HomeScreen extends StatefulWidget {
  final void Function(String path) navigateToScreen;
  final Widget child;
  const HomeScreen({
    super.key,
    required this.child,
    required this.navigateToScreen,
  });

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<RootScreen> get _screens => [
        RootScreen(
          context.l10n.currencyRates,
          const Icon(Icons.currency_exchange),
          Routes.rootCurrencyRates,
        ),
        RootScreen(
          context.l10n.settings,
          const Icon(Icons.settings),
          Routes.rootSettings,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => _onItemTapped(index, context),
        currentIndex: _selectedIndex,
        items: List.generate(
          _screens.length,
          (index) {
            final screen = _screens[index];
            return BottomNavigationBarItem(
              icon: screen.icon,
              label: screen.label,
            );
          },
        ),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    widget.navigateToScreen(_screens[index].location);
  }
}
