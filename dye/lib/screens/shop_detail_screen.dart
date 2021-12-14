import 'package:dye/models/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopDetailScreen extends StatefulWidget {
  final Shop shop;
  const ShopDetailScreen({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  _ShopDetailScreenState createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoNavigationBar(),
    );
  }
}
