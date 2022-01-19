class SubscribeFormDto {
  int shopId;
  int weekLabel;
  String receiver;
  String address;
  int deliveryCost;
  String? toShop;
  String? toDelivery;
  List<DishInSubscribeFormDto> dishes;

  SubscribeFormDto({
    required this.shopId,
    required this.weekLabel,
    required this.receiver,
    required this.address,
    required this.deliveryCost,
    this.toShop,
    this.toDelivery,
    required this.dishes,
  });

  SubscribeFormDto.fromJson(Map<String, dynamic> json)
      : shopId = json['shopId'],
        weekLabel = json['weekLabel'],
        receiver = json['reciever'],
        address = json['address'],
        deliveryCost = json['deliveryCost'],
        toShop = json['toShop'],
        toDelivery = json['toDelivery'],
        dishes = [] {
    if (json['dishes'] != null) {
      dishes = <DishInSubscribeFormDto>[];
      json['dishes'].forEach((v) {
        dishes.add(DishInSubscribeFormDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['shopId'] = shopId;
    data['weekLabel'] = weekLabel;
    data['receiver='] = receiver;
    data['address'] = address;
    data['deliveryCost'] = deliveryCost;
    data['toShop'] = toShop;
    data['toDelivery'] = toDelivery;
    if (dishes.isNotEmpty) {
      data['dishes'] = dishes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DishInSubscribeFormDto {
  int dishId;
  int orderCount;

  DishInSubscribeFormDto({
    required this.dishId,
    required this.orderCount,
  });

  DishInSubscribeFormDto.fromJson(Map<String, dynamic> json)
      : dishId = json['dishId'],
        orderCount = json['orderCount'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dishId'] = dishId;
    data['orderCount'] = orderCount;
    return data;
  }
}
