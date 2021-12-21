import 'package:dye/models/shop.dart';
import 'package:dye/screens/shop_detail_screen.dart';
import 'package:dye/screens/shop_list_screen.dart';
import 'package:flutter/material.dart';

class SubscribeShopListScreen extends StatefulWidget {
  final latitude;
  final longitude;

  const SubscribeShopListScreen({
    Key? key,
    required this.latitude,
    required this.longitude,
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
        builder: (context) => ShopDetailScreen(shop: shop),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ShopListScreen(
      latitude: widget.latitude,
      longitude: widget.longitude,
      onTapTile: navigateSubscribeShopDetail,
    );
  }
}
