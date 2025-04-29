import 'package:fast_location/src/modules/home/model/address_model.dart';
// import 'package:fast_location/src/shared/storage/app_boxes.dart';
import 'package:hive_flutter/adapters.dart';

class AppLocalStorage {
  static Future<void> setupHive() async {
    await Hive.initFlutter();

    _registerAdapters();

    // await _clearBox<AddressModel>(AppBoxes.searchedAddresses);
  }

  static Future<Box<T>> openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }

    return Hive.box<T>(boxName);
  }

  static void _registerAdapters() {
    Hive.registerAdapter(AddressModelAdapter());
  }

  // Used to clear box data, when needed.
  // ignore: unused_element
  static Future<void> _clearBox<T>(String boxName) async {
    var box = await openBox<T>(boxName);
    await box.deleteAll(box.keys);
  }
}
