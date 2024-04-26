class AddressModel {
  int? addressId;
  int? addressUserId;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;
  String? addressName;

  AddressModel(
      {this.addressId,
      this.addressUserId,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang,
      this.addressName});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = addressId;
    data['address_user_id'] = addressUserId;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_lang'] = addressLang;
    data['address_name'] = addressName;
    return data;
  }
}