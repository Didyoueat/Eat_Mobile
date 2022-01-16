import 'package:dye/models/shop.dart';
import 'package:dye/screens/dish_detail_screen.dart';
import 'package:dye/screens/shop_detail_screen.dart';
import 'package:dye/screens/shop_list_screen.dart';
import 'package:dye/widgets/custom_info_appbar.dart';
import 'package:flutter/material.dart';

const shopList = '/';
const shopDetail = '/shopDetail';
const dishDetail = '/dishDetail';

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

  final _navigatorKey = GlobalKey<NavigatorState>();

  bool _onBackPressed() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("밥 안먹을겨?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("아니오"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text("예"),
            ),
          ],
        );
      },
    );

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => _onBackPressed());
      },
      child: Scaffold(
        appBar: CustomInfoAppBar(
          nowWeek: 0,
          weekSelection: const [true, false, true, false, false, false, false],
        ),
        body: Navigator(
          key: _navigatorKey,
          initialRoute: shopList,
          onGenerateRoute: (setting) {
            late Widget page;
            if (setting.name == shopList) {
              page = ShopListScreen(
                latitude: 37.55500,
                longitude: 126.97130,
                onTapTile: (shop) {
                  defaultShop = shop;
                  _navigatorKey.currentState!.pushNamed(shopDetail);
                  // _navigatorKey.currentState!.push(MaterialPageRoute(
                  //     builder: (context) => ShopDetailScreen(shop: shop)));
                  // 함수를 push로 호출할 수 있지만, depth가 생긴다.
                  // Navigator.pop(context);
                  // 여기 익명함수는 ShopListScreen 밖의 함수이기 때문에 Navigator은 default로 인식한다.
                  // Navigator.of(context).pop();
                },
              );
            } else if (setting.name == shopDetail) {
              page = ShopDetailScreen(
                shop: defaultShop,
                onTapDish: (dish) {
                  _navigatorKey.currentState!.pop();
                  // Navigator.of(context).pop();
                  // Navigator.pop(context);
                },
              );
            } else {
              throw Exception('Unknown route: ${setting.name}');
            }

            return MaterialPageRoute<dynamic>(
              builder: (context) {
                return page;
              },
              settings: setting,
            );
          },
        ),
      ),
    );
  }
}
