import 'dart:async';

import 'package:chartification/core/core.dart';
import 'package:chartification/features/features.dart';
import 'package:mobx/mobx.dart';

part 'quotation_details_store.g.dart';

class QuotationDetailsStore = QuotationDetailsStoreBase
    with _$QuotationDetailsStore;

abstract class QuotationDetailsStoreBase with Store {
  QuotationDetailsStoreBase(this._getQuotationDetails);

  final GetQuotation _getQuotationDetails;

  final StreamController<NotificationDetails> _notificationStreamController =
      StreamController<NotificationDetails>();

  @observable
  late ObservableStream<NotificationDetails?> notifications = ObservableStream(
      _notificationStreamController.stream.asBroadcastStream());

  @observable
  bool isLoading = false;

  @observable
  Quotation? quotation;

  @action
  Future<void> fetch(String symbol) async {
    isLoading = true;
    try {
      final result =
          await _getQuotationDetails.call(QuotationParams(symbol: symbol));
      result.fold(
        (l) => _notificationStreamController.add(
          NotificationDetails.error(
            'Can\'t load quotation: $symbol',
          ),
        ),
        (r) => quotation = r,
      );
    } finally {
      isLoading = false;
    }
  }
}
