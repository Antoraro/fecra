import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fecra/src/core/ui/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../../../core/ui/app_sizes.dart';
import '../../../../core/ui/utils.dart';
import '../../presentation/specific/specific_currency_rates_cubit.dart';

const _maxHeaderHeight = 200.0;
const _chartSmoothingFactor = 0.2;

class SpecificCurrencyRatesScreen extends StatelessWidget {
  final _format = DateFormat('dd-MM-yyyy – kk:mm:ss');

  final VoidCallback navigateBack;
  final String? id;
  SpecificCurrencyRatesScreen({
    super.key,
    required this.navigateBack,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecificCurrencyRatesCubit, SpecificCurrencyRatesState>(
      bloc: GetIt.I()..init(id),
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: _maxHeaderHeight,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  title: switch (state) {
                    SpecificCurrencyRatesStateContent() => ListTile(
                        contentPadding: const EdgeInsets.only(
                          left: AppSizes.p56,
                        ),
                        dense: true,
                        leading: Text(
                          state.data?.currency.flag ?? '',
                          style: context.textTheme.titleLarge,
                        ),
                        title: Text(
                          state.data?.currency.name ?? '',
                          style: context.textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          getRateString(state.isShortExchange,
                              state.data?.rates.firstOrNull?.exchange),
                          style: context.textTheme.bodySmall,
                        ),
                      ),
                    _ => const SizedBox.shrink(),
                  },
                  background: switch (state) {
                    SpecificCurrencyRatesStateContent() => Padding(
                        padding: const EdgeInsets.only(top: AppSizes.p32),
                        child: Sparkline(
                          lineColor: Theme.of(context).primaryColor,
                          enableThreshold: true,
                          data: state.lineData,
                          lineWidth: AppSizes.borderWidthThick,
                          useCubicSmoothing: true,
                          cubicSmoothingFactor: _chartSmoothingFactor,
                        ),
                      ),
                    _ => const SizedBox.shrink(),
                  },
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: navigateBack,
                ),
              ),
              switch (state) {
                SpecificCurrencyRatesStateLoading() => const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator())),
                SpecificCurrencyRatesStateContent() => SliverList.builder(
                    itemCount: state.data?.rates.length ?? 0,
                    itemBuilder: (context, index) {
                      final rate = state.data!.rates[index];
                      return ListTile(
                        title: Text(getRateString(
                            state.isShortExchange, rate.exchange)),
                        subtitle: Text(
                          _format.format(rate.timestamp),
                        ),
                      );
                    },
                  ),
                _ => SliverToBoxAdapter(
                    child: Center(child: Text(context.l10n.error))),
              },
            ],
          ),
        );
      },
    );
  }
}
