class AddressModel {
  late String zipCode;
  late String publicPlace;
  late String neighborhood;
  late String locality;
  late String state;

  AddressModel({
    required this.zipCode,
    required this.publicPlace,
    required this.neighborhood,
    required this.locality,
    required this.state,
  });

  AddressModel.fromJson(Map<String, dynamic> json)
    : zipCode = json["cep"] ?? '',
      publicPlace = json["logradouro"] ?? '',
      neighborhood = json["bairro"] ?? '',
      locality = json["localidade"] ?? '',
      state = json["uf"] ?? '';
}
