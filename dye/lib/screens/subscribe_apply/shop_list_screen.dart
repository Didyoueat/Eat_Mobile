import 'dart:developer';

import 'package:dye/models/shop.dart';
import 'package:dye/widgets/locate_based_shop_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShopListScreen extends StatefulWidget {
  final latitude;
  final longitude;
  const ShopListScreen({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  _ShopListScreenState createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  late List<Shop> shopList = [];
  final radius = 500;

  Future<List<Shop>> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'http://54.180.122.1:5000/v0/shops/around?latitude=${widget.latitude}&longitude=${widget.longitude}&radius=$radius'));

    if (response.statusCode == 200) {
      List<Shop> temp = [];

      for (Map<String, dynamic> shop in json.decode(response.body)['shops']) {
        temp.add(Shop.fromJson(shop));
        log(temp.last.shopId.toString());
      }
      setState(() {});
      return temp;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    //여기에다가 shoplist를 초기화해주고 싶은데 async가 안됨
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    shopList = await fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: LocateBasedShopList(
            isInSubscribe: true,
            list: shopList,
            onPressLocationButton: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('지역을 바꾸는 함수가 실행될거임'),
                  duration: Duration(milliseconds: 700),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
