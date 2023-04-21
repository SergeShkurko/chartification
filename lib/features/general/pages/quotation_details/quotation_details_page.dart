import 'package:chartification/core/core.dart';
import 'package:chartification/features/features.dart';
import 'package:chartification/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class QuotationDetailsPage extends StatefulWidget {
  const QuotationDetailsPage({
    required this.symbol,
    super.key,
  });

  final String symbol;

  @override
  State<QuotationDetailsPage> createState() => _QuotationDetailsPageState();
}

class _QuotationDetailsPageState extends State<QuotationDetailsPage> {
  late final store = context.read<QuotationDetailsStore>()
    ..fetch(widget.symbol);

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) => reaction(
        (_) => store.notifications.value,
        (details) => showNotification(context, details!),
      ),
      child: Parent(
        appBar: AppBar(),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.space32),
          child: Center(
            child: Observer(builder: (context) {
              if (store.isLoading) {
                return const CircularProgressIndicator();
              }

              if (store.quotation == null) {
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
            onPressed: () => store.fetch(widget.symbol),
          ),
        ],
      );

  Widget buildSuccessState() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTextRow(Strings.of(context)!.name, store.quotation!.name),
          const SpacerV(value: Dimens.space16),
          _buildTextRow(
              Strings.of(context)!.description, store.quotation!.description),
          const SpacerV(value: Dimens.space16),
          _buildTextRow(Strings.of(context)!.symbol, store.quotation!.symbol),
          const SpacerV(value: Dimens.space16),
          _buildTextRow(
            Strings.of(context)!.capitalization,
            '${store.quotation!.capitalization}\$',
          ),
        ],
      );

  Widget _buildTextRow(String name, String value) => RichText(
        text: TextSpan(
          style: Typographies.body1.copyWith(color: context.palette.foreground),
          children: <TextSpan>[
            TextSpan(
              text: '$name: ',
              style: Typographies.body2.copyWith(color: Palette.accent),
            ),
            TextSpan(text: value),
          ],
        ),
      );
}
