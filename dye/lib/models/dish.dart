import 'package:json_annotation/json_annotation.dart';
part 'dish.g.dart';

@JsonSerializable()
class Dish {
  String? dishId;
  String? shopId;
  bool? main;
  bool? thumbnail;
  String? title;
  String? content;
  String? price;
  String? count;
  String? weight;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Dish(
      this.dishId,
      this.shopId,
      this.main,
      this.thumbnail,
      this.title,
      this.content,
      this.price,
      this.count,
      this.weight,
      this.imageUrl,
      this.createdAt,
      this.updatedAt);

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
  Map<String, dynamic> toJson() => _$DishToJson(this);
}
