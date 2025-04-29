// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

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
      Atom(name: '_HomeControllerBase.hasError', context: context);

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

  late final _$lastAddressSearchedAtom =
      Atom(name: '_HomeControllerBase.lastAddressSearched', context: context);

  @override
  AddressModel? get lastAddressSearched {
    _$lastAddressSearchedAtom.reportRead();
    return super.lastAddressSearched;
  }

  @override
  set lastAddressSearched(AddressModel? value) {
    _$lastAddressSearchedAtom.reportWrite(value, super.lastAddressSearched, () {
      super.lastAddressSearched = value;
    });
  }

  late final _$hasErrorOnSearchAddressAtom = Atom(
      name: '_HomeControllerBase.hasErrorOnSearchAddress', context: context);

  @override
  bool get hasErrorOnSearchAddress {
    _$hasErrorOnSearchAddressAtom.reportRead();
    return super.hasErrorOnSearchAddress;
  }

  @override
  set hasErrorOnSearchAddress(bool value) {
    _$hasErrorOnSearchAddressAtom
        .reportWrite(value, super.hasErrorOnSearchAddress, () {
      super.hasErrorOnSearchAddress = value;
    });
  }

  late final _$errorMessageOnSearchAddressAtom = Atom(
      name: '_HomeControllerBase.errorMessageOnSearchAddress',
      context: context);

  @override
  String? get errorMessageOnSearchAddress {
    _$errorMessageOnSearchAddressAtom.reportRead();
    return super.errorMessageOnSearchAddress;
  }

  @override
  set errorMessageOnSearchAddress(String? value) {
    _$errorMessageOnSearchAddressAtom
        .reportWrite(value, super.errorMessageOnSearchAddress, () {
      super.errorMessageOnSearchAddress = value;
    });
  }

  late final _$addressesAtom =
      Atom(name: '_HomeControllerBase.addresses', context: context);

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

  late final _$searchAddressAsyncAction =
      AsyncAction('_HomeControllerBase.searchAddress', context: context);

  @override
  Future<void> searchAddress(String zipCode) {
    return _$searchAddressAsyncAction.run(() => super.searchAddress(zipCode));
  }

  late final _$listAddressesAsyncAction =
      AsyncAction('_HomeControllerBase.listAddresses', context: context);

  @override
  Future<void> listAddresses() {
    return _$listAddressesAsyncAction.run(() => super.listAddresses());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
lastAddressSearched: ${lastAddressSearched},
hasErrorOnSearchAddress: ${hasErrorOnSearchAddress},
errorMessageOnSearchAddress: ${errorMessageOnSearchAddress},
addresses: ${addresses}
    ''';
  }
}
