import 'package:dye/models/shop.dart';

import 'dish.dart';

class DishCart {
  Shop? shop;
  Dish dish;
  int count;

  DishCart(this.dish, this.count);
}
