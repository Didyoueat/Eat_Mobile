class Dish {
  int? dishId;
  int? shopId;
  bool? main;
  bool? thumbnail;
  String? title;
  String? content;
  int? price;
  int? count;
  int? weight;
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

  Dish.fromJson(Map<String, dynamic> json) {
    dishId = json['dishId'];
    shopId = json['shopId'];
    main = json['main'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    content = json['content'];
    price = json['price'];
    count = json['count'];
    weight = json['weight'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dishId'] = dishId;
    data['shopId'] = shopId;
    data['main'] = main;
    data['thumbnail'] = thumbnail;
    data['title'] = title;
    data['content'] = content;
    data['price'] = price;
    data['count'] = count;
    data['weight'] = weight;
    data['imageUrl'] = imageUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
