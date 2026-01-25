import 'package:flutter_daily_practice/features/home/domain/entities/geocode.dart';

class GeoModel extends Geo {
  GeoModel({super.lat, super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(lat: json['lat'], lng: json['lng']);
  }
}
