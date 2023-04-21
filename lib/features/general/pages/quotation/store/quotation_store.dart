import 'dart:async';

import 'package:chartification/core/core.dart';
import 'package:chartification/features/features.dart';
import 'package:mobx/mobx.dart';

part 'quotation_store.g.dart';

class QuotationStore = QuotationStoreBase with _$QuotationStore;

abstract class QuotationStoreBase with Store {
  QuotationStoreBase(this._getQuotation);

  final GetQuotation _getQuotation;

  final StreamController<NotificationDetails> _notificationStreamController =
      StreamController<NotificationDetails>();

  @observable
  late ObservableStream<NotificationDetails?> notifications = ObservableStream(
      _notificationStreamController.stream.asBroadcastStream());

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Quotation> quotations = ObservableList<Quotation>();

  @action
  Future<void> fetch(List<String> symbols) async {
    isLoading = true;
    try {
      final results = await Future.wait(
        symbols.map(
          (symbol) => _getQuotation.call(QuotationParams(symbol: symbol)),
        ),
      );
      final List<String> errorSymbols = [];
      for (final result in results.asMap().entries) {
        result.value.fold(
          (l) => errorSymbols.add(symbols[result.key]),
          (r) => quotations.add(r),
        );
      }
      if (errorSymbols.isNotEmpty) {
        _notificationStreamController.add(
          NotificationDetails.error(
            'Can\'t load quotations: ${errorSymbols.join(', ')}',
          ),
        );
      }
    } finally {
      isLoading = false;
    }
  }
}
