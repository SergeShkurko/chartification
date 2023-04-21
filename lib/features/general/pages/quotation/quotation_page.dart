import 'package:chartification/core/core.dart';
import 'package:chartification/features/features.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class QuotationPage extends StatefulWidget {
  const QuotationPage({super.key});

  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  static const companies = [
    _Company(symbol: 'AAPL', color: Colors.grey),
    _Company(symbol: 'AMZN', color: Colors.orange),
    _Company(symbol: 'GOOG', color: Colors.lime),
    _Company(symbol: 'MSFT', color: Colors.red),
    _Company(symbol: 'META', color: Colors.blue),
  ];

  final symbols = companies.map((c) => c.symbol).toList();

  late final store = context.read<QuotationStore>()..fetch(symbols);

  String touchedSymbol = '';

  void onSectionPressed(
    Map<Quotation, PieChartSectionData> sections,
    FlTouchEvent event,
    PieTouchResponse? pieTouchResponse,
  ) {
    setState(() {
      if (!event.isInterestedForInteractions ||
          (pieTouchResponse?.touchedSection?.touchedSectionIndex ?? -1) == -1) {
        touchedSymbol = '';
        return;
      }
      final touchedSectionIndex =
          pieTouchResponse!.touchedSection!.touchedSectionIndex;
      touchedSymbol = sections.keys.elementAt(touchedSectionIndex).symbol;
      if (event is FlLongPressEnd || event is FlTapUpEvent) {
        context.goNamed(Routes.details.name, params: {'symbol': touchedSymbol});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) => reaction(
        (_) => store.notifications.value,
        (details) => showNotification(context, details!),
      ),
      child: Parent(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.space32),
          child: Center(
            child: Observer(builder: (context) {
              if (store.isLoading) {
                return const CircularProgressIndicator();
              }

              if (store.quotations.isEmpty) {
                return buildErrorState();
              }

              return buildSuccessState();
            }),
          ),
        ),
      ),
    );
  }

  Widget buildErrorState() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Strings.of(context)!.cannotFetch,
            textAlign: TextAlign.center,
          ),
          const SpacerV(value: Dimens.space16),
          ButtonText(
            title: Strings.of(context)!.refreshNow,
            onPressed: () => store.fetch(symbols),
          ),
        ],
      );

  Widget buildSuccessState() {
    final capitalizationSum =
        store.quotations.fold(0, (acc, q) => acc += q.capitalization);
    final capitalizationPercent = capitalizationSum * 0.01;
    final sections = showingSections(store.quotations, capitalizationPercent);

    return Column(
      children: <Widget>[
        Expanded(
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (event, pieTouchResponse) =>
                    onSectionPressed(sections, event, pieTouchResponse),
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: 90,
              sections: sections.values.toList(),
            ),
          ),
        ),
        Column(
          children: sections.keys.map((q) {
            final company = companies.firstWhere((c) => c.symbol == q.symbol);
            final percents = q.capitalization / capitalizationPercent;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Indicator(
                color: company.color,
                text: '${q.symbol} (${percents.toStringAsFixed(1)}%)',
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Map<Quotation, PieChartSectionData> showingSections(
    ObservableList<Quotation> quotations,
    double capitalizationPercent,
  ) {
    final result = <Quotation, PieChartSectionData>{};

    const shadows = [Shadow(color: Colors.black, blurRadius: 4)];

    for (final quotation in quotations) {
      final isTouched = quotation.symbol == touchedSymbol;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 115.0 : 100.0;

      final company = companies.firstWhere((c) => c.symbol == quotation.symbol);
      final percents = quotation.capitalization / capitalizationPercent;

      result[quotation] = PieChartSectionData(
        color: company.color,
        value: percents.toDouble(),
        title: '${quotation.symbol}\n(${percents.toStringAsFixed(1)}%)',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          shadows: shadows,
        ),
      );
    }

    return result;
  }
}

class _Company {
  final String symbol;
  final Color color;

  const _Company({
    required this.symbol,
    required this.color,
  });
}
