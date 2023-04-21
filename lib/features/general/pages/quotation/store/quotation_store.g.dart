// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuotationStore on QuotationStoreBase, Store {
  late final _$notificationsAtom =
      Atom(name: 'QuotationStoreBase.notifications', context: context);

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
      Atom(name: 'QuotationStoreBase.isLoading', context: context);

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

  late final _$quotationsAtom =
      Atom(name: 'QuotationStoreBase.quotations', context: context);

  @override
  ObservableList<Quotation> get quotations {
    _$quotationsAtom.reportRead();
    return super.quotations;
  }

  @override
  set quotations(ObservableList<Quotation> value) {
    _$quotationsAtom.reportWrite(value, super.quotations, () {
      super.quotations = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('QuotationStoreBase.fetch', context: context);

  @override
  Future<void> fetch(List<String> symbols) {
    return _$fetchAsyncAction.run(() => super.fetch(symbols));
  }

  @override
  String toString() {
    return '''
notifications: ${notifications},
isLoading: ${isLoading},
quotations: ${quotations}
    ''';
  }
}
