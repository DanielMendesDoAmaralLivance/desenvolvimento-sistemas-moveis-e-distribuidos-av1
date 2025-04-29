import 'package:hive/hive.dart';

part 'address_model.g.dart';

@HiveType(typeId: 0)
class AddressModel {
  @HiveField(0)
  late String zipCode;

  @HiveField(1)
  late String publicPlace;

  @HiveField(2)
  late String neighborhood;

  @HiveField(3)
  late String locality;

  @HiveField(4)
  late String state;

  AddressModel({
    required this.zipCode,
    required this.publicPlace,
    required this.neighborhood,
    required this.locality,
    required this.state,
  });

  AddressModel.fromJson(Map<String, dynamic> json)
    : zipCode = json["cep"],
      publicPlace = json["logradouro"],
      neighborhood = json["bairro"],
      locality = json["localidade"],
      state = json["uf"];
}
