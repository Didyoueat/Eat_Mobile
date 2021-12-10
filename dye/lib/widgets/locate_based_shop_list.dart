import 'package:dye/models/shop.dart';
import 'package:dye/widgets/shop_list_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class LocateBasedShopList extends StatelessWidget {
  final List<Shop> list;

  const LocateBasedShopList({
    Key? key,
    required this.list,
  }) : super(key: key);

  String? getDong(String? str) {
    if (str == null) {
      return ("");
    }
    final temp = str.split(" ");
    return temp[1];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int position) {
        final tileWidth = 300.w;
        final tileHeight = 243.h;
        return SizedBox(
          width: tileWidth,
          height: tileHeight,
          child: ShopListTile(
            title: list[position].businessName ?? "동찬이네",
            address: getDong(list[position].address) ?? "신림동",
            distance: (list[position].distance! * (1 / 1000))
                .toStringAsFixed(1)
                .toString(),
            like: true,
            urlThumbNail1: list[position].dishes[0].imageUrl.toString(),
            urlThumbNail2: list[position].dishes[1].imageUrl.toString(),
            urlThumbNail3: list[position].dishes[2].imageUrl.toString(),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20.h,
        );
      },
    );
  }
}
