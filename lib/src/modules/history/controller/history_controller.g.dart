// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HistoryControllerBase.isLoading', context: context);

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

  late final _$hasErrorAtom =
      Atom(name: '_HistoryControllerBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$addressesAtom =
      Atom(name: '_HistoryControllerBase.addresses', context: context);

  @override
  ObservableList<AddressModel> get addresses {
    _$addressesAtom.reportRead();
    return super.addresses;
  }

  @override
  set addresses(ObservableList<AddressModel> value) {
    _$addressesAtom.reportWrite(value, super.addresses, () {
      super.addresses = value;
    });
  }

  late final _$listAddressesAsyncAction =
      AsyncAction('_HistoryControllerBase.listAddresses', context: context);

  @override
  Future<void> listAddresses() {
    return _$listAddressesAsyncAction.run(() => super.listAddresses());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
addresses: ${addresses}
    ''';
  }
}
