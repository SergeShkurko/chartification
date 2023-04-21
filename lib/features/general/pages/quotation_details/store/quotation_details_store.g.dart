// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuotationDetailsStore on QuotationDetailsStoreBase, Store {
  late final _$notificationsAtom =
      Atom(name: 'QuotationDetailsStoreBase.notifications', context: context);

  @override
  ObservableStream<NotificationDetails?> get notifications {
    _$notificationsAtom.reportRead();
    return super.notifications;
  }

  @override
  set notifications(ObservableStream<NotificationDetails?> value) {
    _$notificationsAtom.reportWrite(value, super.notifications, () {
      super.notifications = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'QuotationDetailsStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$quotationAtom =
      Atom(name: 'QuotationDetailsStoreBase.quotation', context: context);

  @override
  Quotation? get quotation {
    _$quotationAtom.reportRead();
    return super.quotation;
  }

  @override
  set quotation(Quotation? value) {
    _$quotationAtom.reportWrite(value, super.quotation, () {
      super.quotation = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('QuotationDetailsStoreBase.fetch', context: context);

  @override
  Future<void> fetch(String symbol) {
    return _$fetchAsyncAction.run(() => super.fetch(symbol));
  }

  @override
  String toString() {
    return '''
notifications: ${notifications},
isLoading: ${isLoading},
quotation: ${quotation}
    ''';
  }
}
