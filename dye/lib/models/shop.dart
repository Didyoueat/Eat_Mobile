import 'package:dye/models/dish.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shop.g.dart';

@JsonSerializable()
class Shop {
  String? shopId;
  String? businessNumber;
  String? businessName;
  String? businessPhone;
  int? dayoff;
  String? address;
  String? latitude;
  String? longitude;
  String? name;
  String? phone;
  String? origin;
  String? content;
  List<String?>? imageUrl;
  String? officeHourStart;
  String? officeHourEnd;
  String? temporaryDayStart;
  String? temporaryDayEnd;
  String? createdAt;
  String? updatedAt;
  List<Dish?>? dishes;
  String? distance;

  Shop(
      this.shopId,
      this.businessNumber,
      this.businessName,
      this.businessPhone,
      this.dayoff,
      this.address,
      this.latitude,
      this.longitude,
      this.name,
      this.phone,
      this.origin,
      this.content,
      this.imageUrl,
      this.officeHourStart,
      this.officeHourEnd,
      this.temporaryDayStart,
      this.temporaryDayEnd,
      this.createdAt,
      this.updatedAt,
      this.dishes,
      this.distance);

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
