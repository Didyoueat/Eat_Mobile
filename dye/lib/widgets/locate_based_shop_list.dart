import 'package:auto_size_text/auto_size_text.dart';
import 'package:dye/constants/colors.dart';
import 'package:dye/models/shop.dart';
import 'package:dye/widgets/circle_button.dart';
import 'package:dye/widgets/shop_list_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocateBasedShopList extends StatelessWidget {
  final List<Shop> list;
  final bool isInSubscribe;

  const LocateBasedShopList({
    Key? key,
    required this.list,
    required this.isInSubscribe,
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
      itemCount: list.length + 1,
      cacheExtent: 100,
      itemBuilder: (BuildContext context, int position) {
        final tileWidth = 335.w;
        final tileHeight = 243.h;

        if (position == 0) {
          return _getListHeader();
        }

        position--;
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

  Widget _getListHeader() {
    return Container(
      height: 28.h,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Container(), Row()],
      ),
    );
  }
}
