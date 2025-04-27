import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:hive/hive.dart';

class AddressLocalRepository {
  static const String boxName = 'searched_addresses';

  Future<List<AddressModel>> list() async {
    final box = await _openBox();

    return box.values.toList();
  }

  Future<int> create(AddressModel address) async {
    final box = await _openBox();

    return await box.add(address);
  }

  Future<Box<AddressModel>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<AddressModel>(boxName);
    }

    return Hive.box<AddressModel>(boxName);
  }
}
