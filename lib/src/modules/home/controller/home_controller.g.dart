// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
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

  late final _$searchAddressAsyncAction =
      AsyncAction('_HomeControllerBase.searchAddress', context: context);

  @override
  Future<void> searchAddress(String zipCode) {
    return _$searchAddressAsyncAction.run(() => super.searchAddress(zipCode));
  }

  @override
  String toString() {
    return '''
lastAddressSearched: ${lastAddressSearched}
    ''';
  }
}
