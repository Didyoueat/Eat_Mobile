// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      json['dishId'] as String?,
      json['shopId'] as String?,
      json['main'] as bool?,
      json['thumbnail'] as bool?,
      json['title'] as String?,
      json['content'] as String?,
      json['price'] as String?,
      json['count'] as String?,
      json['weight'] as String?,
      json['imageUrl'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'dishId': instance.dishId,
      'shopId': instance.shopId,
      'main': instance.main,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'content': instance.content,
      'price': instance.price,
      'count': instance.count,
      'weight': instance.weight,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
