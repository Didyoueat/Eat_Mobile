import 'package:dye/models/dish.dart';

class Shop {
  int shopId;
  String businessNumber;
  String businessName;
  String businessPhone;
  int dayOff;
  String address;
  double latitude;
  double longitude;
  String name;
  String? phone;
  String? origin;
  String? content;
  List<String?>? imageUrl;
  String? officeHour;
  String? temporaryDayStart;
  String? temporaryDayEnd;
  List<Dish> dishes;
  int distance;

  Shop(
    this.shopId,
    this.businessNumber,
    this.businessName,
    this.businessPhone,
    this.dayOff,
    this.address,
    this.latitude,
    this.longitude,
    this.name,
    this.phone,
    this.origin,
    this.content,
    this.imageUrl,
    this.officeHour,
    this.temporaryDayStart,
    this.temporaryDayEnd,
    this.dishes,
    this.distance,
  );

  Shop.fromJson(Map<String, dynamic> json)
      : shopId = json['shopId'],
        businessNumber = json['businessNumber'],
        businessName = json['businessName'],
        businessPhone = json['businessPhone'],
        dayOff = json['dayOff'],
        address = json['address'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        name = json['name'],
        phone = json['phone'],
        origin = json['origin'],
        content = json['content'],
        imageUrl = json['imageUrl'],
        officeHour = json['officeHour'],
        temporaryDayStart = json['temporaryDayStart'],
        temporaryDayEnd = json['temporaryDayEnd'],
        dishes = <Dish>[],
        distance = json['distance'] {
    if (json['dishes'] != null) {
      dishes = <Dish>[];
      json['dishes'].forEach((v) {
        dishes.add(Dish.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shopId'] = shopId;
    data['businessNumber'] = businessNumber;
    data['businessName'] = businessName;
    data['businessPhone'] = businessPhone;
    data['dayOff'] = dayOff;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['name'] = name;
    data['phone'] = phone;
    data['origin'] = origin;
    data['content'] = content;
    data['imageUrl'] = imageUrl;
    data['officeHour'] = officeHour;
    data['temporaryDayStart'] = temporaryDayStart;
    data['temporaryDayEnd'] = temporaryDayEnd;
    if (dishes.isNotEmpty) {
      data['dishes'] = dishes.map((v) => v.toJson()).toList();
    }
    data['distance'] = distance;
    return data;
  }
}
