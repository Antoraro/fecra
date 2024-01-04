import 'package:fecra/src/core/ui/extensions.dart';
import 'package:fecra/src/core/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/app_durations.dart';
import '../../../core/ui/app_sizes.dart';
import '../presentation/currency_rates_cubit.dart';

class CurrencyRatesScreen extends StatelessWidget {
  final void Function(String id) navigateToSpecific;
  final CurrencyRatesCubit cubit;
  const CurrencyRatesScreen({
    super.key,
    required this.navigateToSpecific,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.currencyRates),
      ),
      body: BlocBuilder<CurrencyRatesCubit, CurrencyRatesState>(
        bloc: cubit..init(),
        builder: (context, state) {
          return switch (state) {
            CurrencyRatesStateLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            CurrencyRatesStateContent() => CurrencyRatesScreenContent(
                cubit: cubit,
                navigateToSpecific: navigateToSpecific,
                state: state,
              ),
            _ => Center(child: Text(context.l10n.error)),
          };
        },
      ),
    );
  }
}

class CurrencyRatesScreenContent extends StatefulWidget {
  final void Function(String id) navigateToSpecific;
  final CurrencyRatesStateContent state;
  final CurrencyRatesCubit cubit;
  const CurrencyRatesScreenContent({
    super.key,
    required this.navigateToSpecific,
    required this.state,
    required this.cubit,
  });

  @override
  State<CurrencyRatesScreenContent> createState() =>
      _CurrencyRatesScreenContentState();
}

class _CurrencyRatesScreenContentState
    extends State<CurrencyRatesScreenContent> {
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    _lifecycleListener = AppLifecycleListener(
      onResume: () => widget.cubit.restartTimerAndRefreshData(),
      onPause: () => widget.cubit.cancelTimer(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSizes.p16),
      itemCount: widget.state.currencies.length,
      itemBuilder: (context, index) {
        final data = widget.state.currencies[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.p16),
          child: Card(
            elevation: AppSizes.p2,
            child: ListTile(
              key: Key(data.currency.id),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.p12),
              ),
              leading: Text(
                data.currency.flag,
                style: context.textTheme.titleLarge,
              ),
              title: Text(
                data.currency.name,
                style: context.textTheme.titleMedium,
              ),
              subtitle: AnimatedSwitcher(
                duration: AppDurations.animationDuration,
                child: Align(
                  key: ValueKey(data.rate.exchange),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    getRateString(
                        widget.state.isShortExchange, data.rate.exchange),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => widget.navigateToSpecific(data.currency.id),
            ),
          ),
        );
      },
    );
  }
}
