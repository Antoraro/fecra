import 'package:fecra/src/core/ui/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../feature/currency_rates/ui/currency_rates_screen.dart';
import '../../../feature/currency_rates/ui/specific/specific_currency_rates_screen.dart';
import '../../../feature/home/ui/home_screen.dart';
import '../../../feature/settings/ui/settings_screen.dart';
import '../../../feature/splash/ui/splash_screen.dart';
import 'route_params.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter getAppRouter() => GoRouter(
      debugLogDiagnostics: kDebugMode,
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.rootSplash,
      routes: <RouteBase>[
        GoRoute(
          path: Routes.rootSplash,
          pageBuilder: (context, state) => defaultTransition(
            context: context,
            state: state,
            child: SplashScreen(
              navigateToApp: () => context.go(Routes.rootCurrencyRates),
            ),
          ),
        ),
        // The tab bar shell
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) => defaultTransition(
            context: context,
            state: state,
            child: HomeScreen(
              child: child,
              navigateToScreen: (path) => context.go(path),
            ),
          ),
          routes: [
            GoRoute(
              path: Routes.rootCurrencyRates,
              pageBuilder: (context, state) => defaultTransition(
                context: context,
                state: state,
                child: CurrencyRatesScreen(
                  cubit: GetIt.I(),
                  navigateToSpecific: (String id) => context.push(Routes
                      .currencyRateSpecific
                      .addQueryParams({RouteParams.id: id})),
                ),
              ),
              routes: [
                GoRoute(
                  path: Routes.specific,
                  pageBuilder: (context, state) => defaultTransition(
                    context: context,
                    state: state,
                    child: SpecificCurrencyRatesScreen(
                      id: state.uri.queryParameters[RouteParams.id],
                      navigateBack: () => context.pop(),
                    ),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: Routes.rootSettings,
              pageBuilder: (context, state) => defaultTransition(
                context: context,
                state: state,
                child: const SettingsScreen(),
              ),
            ),
          ],
        ),
      ],
    );

CustomTransitionPage defaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage noTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        child,
  );
}
