import 'package:dye/models/shop.dart';
import 'package:dye/screens/dish_detail_screen.dart';
import 'package:dye/screens/shop_detail_screen.dart';
import 'package:dye/screens/shop_list_screen.dart';
import 'package:dye/widgets/custom_info_appbar.dart';
import 'package:flutter/material.dart';

class SelectDishScreen extends StatefulWidget {
  const SelectDishScreen({Key? key}) : super(key: key);

  @override
  _SelectDishScreenState createState() => _SelectDishScreenState();
}

class _SelectDishScreenState extends State<SelectDishScreen> {
  void _f1(shop) {
    _test = ShopDetailScreen(
      shop: shop,
      onTapDish: _f2,
    );
    setState(() {});
  }

  void _f2(dish) {
    _test = DishDetailScreen(dish: dish);
    setState(() {});
  }

  late Widget _test;

  @override
  void initState() {
    _test = ShopListScreen(
      latitude: 37.55500,
      longitude: 126.97130,
      onTapTile: _f1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInfoAppBar(
        nowWeek: 0,
        weekSelection: [true, false, true, false, false, false, false],
      ),
      body: PageView(
        children: [_test],
      ),
    );
  }
}
