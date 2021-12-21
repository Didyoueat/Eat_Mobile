import 'package:dye/models/shop.dart';
import 'package:dye/screens/shop_detail_screen.dart';
import 'package:dye/screens/shop_list_screen.dart';
import 'package:dye/screens/subscribe_apply/subscribe_shop_detail_screen.dart';
import 'package:dye/widgets/custom_info_appbar.dart';
import 'package:flutter/material.dart';

class SubscribeShopListScreen extends StatefulWidget {
  final latitude;
  final longitude;
  final weekSelection;

  const SubscribeShopListScreen({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.weekSelection,
  }) : super(key: key);

  @override
  _SubscribeShopListScreenState createState() =>
      _SubscribeShopListScreenState();
}

class _SubscribeShopListScreenState extends State<SubscribeShopListScreen> {
  void navigateSubscribeShopDetail(Shop shop) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubscribeShopDetailScreen(
          shop: shop,
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
      body: ShopListScreen(
        latitude: widget.latitude,
        longitude: widget.longitude,
        onTapTile: navigateSubscribeShopDetail,
      ),
    );
  }
}
