import 'package:dye/models/dish.dart';
import 'package:dye/models/shop.dart';
import 'package:dye/screens/subscribe_apply/subscribe_dish_detail_screen.dart';
import 'package:dye/widgets/custom_info_appbar.dart';
import 'package:flutter/material.dart';

import '../shop_detail_screen.dart';

class SubscribeShopDetailScreen extends StatefulWidget {
  final Shop shop;
  final weekSelection;
  const SubscribeShopDetailScreen({
    Key? key,
    required this.shop,
    required this.weekSelection,
  }) : super(key: key);

  @override
  _SubscribeShopDetailScreenState createState() =>
      _SubscribeShopDetailScreenState();
}

class _SubscribeShopDetailScreenState extends State<SubscribeShopDetailScreen> {
  void onTapDish(Dish dish) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubscribeDishDetailScreen(
          dish: dish,
          weekSelection: widget.weekSelection,
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInfoAppBar(
        weekSelection: widget.weekSelection,
        nowWeek: 0,
      ),
      body: ShopDetailScreen(
        shop: widget.shop,
        onTapDish: onTapDish,
      ),
    );
  }
}
