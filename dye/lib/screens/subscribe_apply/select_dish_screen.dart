import 'dart:io';
import 'package:dye/models/dish.dart';
import 'package:dye/models/dish_cart.dart';
import 'package:dye/models/shop.dart';
import 'package:dye/screens/dish_detail_screen.dart';
import 'package:dye/screens/shop_detail_screen.dart';
import 'package:dye/screens/shop_list_screen.dart';
import 'package:dye/screens/subscribe_apply/dish_cart_screen.dart';
import 'package:dye/widgets/cart_floating_button.dart';
import 'package:dye/widgets/custom_info_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const shopList = '/';
const shopDetail = '/shopDetail';
const dishDetail = '/dishDetail';

class SelectDishScreen extends StatefulWidget {
  final List<bool> daysOption;
  const SelectDishScreen({
    Key? key,
    required this.daysOption,
  }) : super(key: key);

  @override
  _SelectDishScreenState createState() => _SelectDishScreenState();
}

class _SelectDishScreenState extends State<SelectDishScreen> {
  late Shop _nowShop;
  late Dish _nowDish;
  late int _nowDay;
  late final List<bool> _daysOption = widget.daysOption;
  final List<List<DishCart>> _cartList = [];

  final _navigatorKey = GlobalKey<NavigatorState>();

  //String
  final List<String> _weekName = const ["월", "화", "수", "목", "금", "토", "일"];
  final String _backPressDialogTitle = "나갈겨?";
  final String _backPressDialogNegative = "아니오";
  final String _backPressDialogPositive = "예";
  final String _cartWarningDialogTitle = "하루에 한 가게의 반찬만 담을 수 있습니다.";
  final String _cartWarningDialogContents = "요일의 장바구니가 초기화됩니다.\n반찬을 담으시겠습니까?";
  final String _cartWarningDialogNegative = "아니요";
  final String _cartWarningDialogPositive = "예";

  @override
  void initState() {
    super.initState();
    _initVar();
  }

  void _initVar() {
    for (int i = 0; i < 7; i++) {
      _cartList.add([]);
    }
    _nowDay = _daysOption.indexOf(true);
  }

  @override
  Widget build(BuildContext context) {
    return _home();
  }

  Widget _home() {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
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
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 45 && details.delta.dy > -45) {
      if (Platform.isIOS &&
          details.delta.dx > 0 &&
          details.globalPosition.dx < 100 &&
          _navigatorKey.currentState!.canPop() == false) {
        _onBackPressed();
      }
    }
  }

  bool _onBackPressed() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_backPressDialogTitle),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(_backPressDialogNegative),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(_backPressDialogPositive),
            ),
          ],
        );
      },
    );
    return false;
  }

  Widget _scaffold() {
    return Scaffold(
      appBar: CustomInfoAppBar(
        nowWeek: _nowDay,
        daysOption: _daysOption,
        cartList: _cartList,
        onTapCircleButton: _onTapAppBarCircleButton,
      ),
      floatingActionButton: CartFloatingButton(
        onPressed: _onTapFloatingButton,
        totalCount: getTotalDishCount(),
      ),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: shopList,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  void _onTapFloatingButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DishCartScreen(
          cartList: _cartList,
          onTapMinusButton: (
            int day,
          ) {},
          onTapPlusButton: () {},
          onTapAddDishButton: (dayNum) {
            _nowDay = dayNum;
            setState(() {});
            _navigatorKey.currentState!.popUntil((route) {
              if (!_navigatorKey.currentState!.canPop()) return true;
              return false;
            });
            Navigator.pop(context);
          },
          onTapSubscribeButton: () {},
        ),
      ),
    );
  }

  void _onTapAppBarCircleButton(i) {
    _nowDay = i;
    setState(() {});
  }

  MaterialPageRoute _onGenerateRoute(RouteSettings setting) {
    late Widget page;
    if (setting.name == shopList) {
      page = ShopListScreen(
        latitude: 37.55500,
        longitude: 126.97130,
        onTapTile: _onTapTileInShopList,
      );
    } else if (setting.name == shopDetail) {
      page = ShopDetailScreen(
        shop: _nowShop,
        onTapDish: _onTapDishInShopDetail,
      );
    } else if (setting.name == dishDetail) {
      page = DishDetailScreen(
        dish: _nowDish,
        onTapCartButton: _onTapCartButtonInDishDetail,
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
  }

  void _onTapTileInShopList(shop) {
    _nowShop = shop;
    _navigatorKey.currentState!.pushNamed(shopDetail);
  }

  void _onTapDishInShopDetail(dish) {
    _nowDish = dish;
    _navigatorKey.currentState!.pushNamed(dishDetail);
  }

  void _onTapCartButtonInDishDetail(Dish dish, int count) async {
    if (_isSameShop(dish) == true) {
      bool result = await _showCartWarningDialog();
      if (!result) return;
    }
    bool flag = false;
    for (int i = 0; i < _cartList[_nowDay].length; i++) {
      if (_cartList[_nowDay][i].dish.dishId == dish.dishId) {
        _cartList[_nowDay][i].count += count;
        flag = true;
        break;
      }
    }
    if (!flag) {
      _cartList[_nowDay].add(DishCart(dish, count));
    }
    setState(() {});
    _navigatorKey.currentState!.pop();
  }

  bool _isSameShop(Dish dish) {
    bool flag = false;
    _cartList[_nowDay].forEach((e) {
      if (e.dish.shopId != dish.shopId) {
        flag = true;
        return;
      }
    });
    return flag;
  }

  Future<bool> _showCartWarningDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_cartWarningDialogTitle),
          content: Text(_weekName[_nowDay] + _cartWarningDialogContents),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(_cartWarningDialogNegative),
            ),
            TextButton(
              onPressed: () {
                _cartList[_nowDay].clear();
                Navigator.of(context).pop(true);
              },
              child: Text(_cartWarningDialogPositive),
            ),
          ],
        );
      },
    );
  }

  int getTotalDishCount() {
    int total = 0;
    for (var map in _cartList) {
      map.forEach((e) {
        total += e.count;
      });
    }
    return total;
  }
}

// _navigatorKey.currentState!.pushNamed(shopDetail);
// _navigatorKey.currentState!.push(MaterialPageRoute(
//     builder: (context) => ShopDetailScreen(shop: shop)));
// 함수를 push로 호출할 수 있지만, depth가 생긴다.
// Navigator.pop(context);
// 여기 익명함수는 ShopListScreen 밖의 함수이기 때문에 Navigator은 default로 인식한다.
// Navigator.of(context).pop();
