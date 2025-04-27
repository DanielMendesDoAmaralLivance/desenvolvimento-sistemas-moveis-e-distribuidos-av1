import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/shared/components/address_list/address_list_item.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class AddressList extends StatelessWidget {
  final ObservableList<AddressModel> addresses;

  const AddressList({super.key, required this.addresses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: addresses.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return AddressListItem(address: addresses[index]);
      },
    );
  }
}
