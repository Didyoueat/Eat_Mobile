// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    json['shopId'] as String?,
    json['businessNumber'] as String?,
    json['businessName'] as String?,
    json['businessPhone'] as String?,
    json['dayoff'] as int?,
    json['address'] as String?,
    json['latitude'] as String?,
    json['longitude'] as String?,
    json['name'] as String?,
    json['phone'] as String?,
    json['origin'] as String?,
    json['content'] as String?,
    (json['imageUrl'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    json['officeHourStart'] as String?,
    json['officeHourEnd'] as String?,
    json['temporaryDayStart'] as String?,
    json['temporaryDayEnd'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    (json['dishes'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Dish.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['distance'] as String?,
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'shopId': instance.shopId,
      'businessNumber': instance.businessNumber,
      'businessName': instance.businessName,
      'businessPhone': instance.businessPhone,
      'dayoff': instance.dayoff,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'phone': instance.phone,
      'origin': instance.origin,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'officeHourStart': instance.officeHourStart,
      'officeHourEnd': instance.officeHourEnd,
      'temporaryDayStart': instance.temporaryDayStart,
      'temporaryDayEnd': instance.temporaryDayEnd,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'dishes': instance.dishes,
      'distance': instance.distance,
    };
