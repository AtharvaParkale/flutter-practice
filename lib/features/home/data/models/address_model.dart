import 'package:flutter_daily_practice/features/home/data/models/comapany_model.dart';
import 'package:flutter_daily_practice/features/home/data/models/geocode_model.dart';
import 'package:flutter_daily_practice/features/home/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel({
    super.city,
    super.street,
    super.zipcode,
    super.geo,
    super.suite,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['geo'] != null ? GeoModel.fromJson(json['geo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo != null ? (geo as GeoModel).toJson() : null,
    };
  }
}
