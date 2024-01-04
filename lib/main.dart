import 'dart:io';

import 'package:fecra/src/core/ui/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'src/core/data/remote/app_http_overrides.dart';
import 'src/core/presentation/app_bloc_observer.dart';
import 'src/core/presentation/get_it.dart';
import 'src/core/ui/navigation/navigation.dart';
import 'src/core/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();

  final router = getAppRouter();

  Bloc.observer = AppBlocObserver();

  HttpOverrides.global = AppHttpOverrides();

  runApp(MyApp(router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp(this.router, {super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme(context),
        onGenerateTitle: (context) => context.l10n.appTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
  }
}
