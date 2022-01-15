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
  Shop defaultShop = Shop.fromJson({
    "shopId": 374,
    "businessNumber": "17-1234-0375",
    "businessName": "서울역버스환승센터",
    "businessPhone": "02-1234-0375",
    "dayOff": 237,
    "address": "서울특별시 강남구 도곡 374로",
    "latitude": 37.555,
    "longitude": 126.973,
    "name": "",
    "origin": null,
    "content": null,
    "imageUrl": null,
    "officeHour": null,
    "temporaryDayStart": null,
    "temporaryDayEnd": null,
    "createdAt": "2021-12-10T03:14:11.551Z",
    "updatedAt": "2021-12-10T03:14:11.551Z",
    "deletedAt": null,
    "dishes": [],
    "distance": 113
  });

  void _f1(shop) {
    // testShop(shop);
    defaultShop = shop;
    pageController.jumpTo(0);
  }

  void _f2(dish) {}

  Future<void> testShop(shop) async {
    defaultShop = shop;
  }

  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInfoAppBar(
        nowWeek: 0,
        weekSelection: [true, false, true, false, false, false, false],
      ),
      body: PageView(
        controller: pageController,
        children: [
          ShopListScreen(
            latitude: 37.55500,
            longitude: 126.97130,
            onTapTile: _f1,
          ),
          ShopDetailScreen(shop: defaultShop),
        ],
      ),
    );
  }
}
