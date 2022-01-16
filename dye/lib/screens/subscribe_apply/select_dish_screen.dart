import 'dart:developer';
import 'dart:io';
import 'package:dye/models/dish.dart';
import 'package:dye/models/shop.dart';
import 'package:dye/screens/dish_detail_screen.dart';
import 'package:dye/screens/shop_detail_screen.dart';
import 'package:dye/screens/shop_list_screen.dart';
import 'package:dye/widgets/custom_info_appbar.dart';
import 'package:flutter/cupertino.dart';
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
  late Shop nowShop;
  late Dish nowDish;

  final _navigatorKey = GlobalKey<NavigatorState>();

  bool _onBackPressed() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("나갈겨?"),
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
    return _home();
  }

  Widget _home() {
    // return Builder(builder: (context) {
    //   return WillPopScope(
    //     onWillPop: () {
    //       if (Platform.isIOS) {
    //         // if (_navigatorKey.currentState!.canPop() == false) {
    //         //   return Future(() => true);
    //         // }
    //         // Navigator.pop(context);
    //         return Future(() => true);
    //       } else if (Platform.isAndroid) {
    //         if (_navigatorKey.currentState!.canPop() == false) {
    //           return Future(() => true);
    //         }
    //         _navigatorKey.currentState!.maybePop();
    //         return Future(() => false);
    //       }
    //       return Future(() => _onBackPressed());
    //     },
    //     child: _scaffold(),
    //   );
    // });
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dy < 45 && details.delta.dy > -45) {
          if (Platform.isIOS &&
              details.delta.dx > 0 &&
              details.globalPosition.dx < 100 &&
              _navigatorKey.currentState!.canPop() == false) {
            _onBackPressed();
          }
        }
      },
      child: WillPopScope(
        onWillPop: () {
          if (Platform.isIOS) {
            return Future(() => true);
          } else if (Platform.isAndroid) {
            if (_navigatorKey.currentState!.canPop() == false) {
              return Future(() => true);
            }
            _navigatorKey.currentState!.maybePop();
            return Future(() => false);
          }
          return Future(() => _onBackPressed());
        },
        child: _scaffold(),
      ),
    );
    // if (Platform.isIOS) {
    //   return GestureDetector(
    //       onPanUpdate: (details) {
    //         // Swiping in right direction.
    //         if (details.delta.dx > 0) {
    //           if (_navigatorKey.currentState!.canPop())
    //             _navigatorKey.currentState!.pop();
    //         }
    //
    //         // Swiping in left direction.
    //         if (details.delta.dx < 0) {}
    //       },
    //       child: _scaffold());
    // } else {
    //   return WillPopScope(
    //     onWillPop: () {
    //       if (Platform.isIOS) {
    //         // if (_navigatorKey.currentState!.canPop() == false) {
    //         //   return Future(() => true);
    //         // }
    //         // Navigator.pop(context);
    //         return Future(() => true);
    //       } else if (Platform.isAndroid) {
    //         if (_navigatorKey.currentState!.canPop() == false) {
    //           return Future(() => true);
    //         }
    //         _navigatorKey.currentState!.maybePop();
    //         return Future(() => false);
    //       }
    //       return Future(() => _onBackPressed());
    //     },
    //     child: _scaffold(),
    //   );
    // }
  }

  Widget _scaffold() {
    return Scaffold(
      appBar: CustomInfoAppBar(
        nowWeek: 0,
        weekSelection: const [true, false, true, false, false, false, false],
      ),
      body: Stack(
        children: [
          Navigator(
            key: _navigatorKey,
            initialRoute: shopList,
            onGenerateRoute: (setting) {
              late Widget page;
              if (setting.name == shopList) {
                page = ShopListScreen(
                  latitude: 37.55500,
                  longitude: 126.97130,
                  onTapTile: (shop) {
                    nowShop = shop;
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
                  shop: nowShop,
                  onTapDish: (dish) {
                    nowDish = dish;
                    _navigatorKey.currentState!.pushNamed(dishDetail);
                  },
                );
              } else if (setting.name == dishDetail) {
                page = DishDetailScreen(dish: nowDish);
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
        ],
      ),
    );
  }
}
