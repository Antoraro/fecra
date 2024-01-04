import 'package:fecra/src/core/ui/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/app_colors.dart';
import '../presentation/settings_cubit.dart';
import 'widgets/settings_tile.dart';

const _refreshPeriods = [2, 5, 10, 30];

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.I.get<SettingsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        bloc: cubit..init(),
        builder: (context, state) {
          return switch (state) {
            SettingsStateLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            SettingsStateContent() =>
              SettingsContent(cubit: cubit, state: state),
            _ => Center(child: Text(context.l10n.error)),
          };
        },
      ),
    );
  }
}

class SettingsContent extends StatelessWidget {
  final SettingsCubit cubit;
  final SettingsStateContent state;
  const SettingsContent({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsTile(
          title: context.l10n.shortenExchangeRates,
          trailing: Switch(
            value: state.isShortExchangeRate,
            onChanged: (value) => cubit.setIsShortExchangeRate(value),
          ),
        ),
        SettingsTile(
          title: context.l10n.refreshPeriod,
          trailing: DropdownButton<Duration>(
            value: state.refreshPeriod,
            onChanged: (value) => cubit.setRefreshPeriod(value!),
            items: _refreshPeriods
                .map((e) => DropdownMenuItem(
                      value: Duration(seconds: e),
                      child: Text(e.toString()),
                    ))
                .toList(),
          ),
        ),
        TextButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(context.l10n.wipeDatabase),
              content: Text(context.l10n.wipeDatabaseConfirmation),
              actions: [
                TextButton(
                    onPressed: context.pop,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.mainRed,
                    ),
                    child: Text(context.l10n.cancel)),
                TextButton(
                  onPressed: () {
                    cubit.wipeDatabase();
                    context.pop();
                  },
                  child: Text(context.l10n.confirm),
                ),
              ],
            ),
          ),
          child: Text(context.l10n.wipeDatabase),
        )
      ],
    );
  }
}
