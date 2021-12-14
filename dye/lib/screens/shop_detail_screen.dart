import 'package:dye/models/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      /*Todo
      * 앱바를 customAppbar라는 클래스를 만들어서 앱바 밑에 줄 안생기게 해야함.
       */
      body: SafeArea(
        bottom: false,
        child: CupertinoNavigationBar(
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              getAppbarIcon(context, "assets/icons/home(unselected).svg"),
              getAppbarIcon(context, "assets/icons/call.svg"),
              getAppbarIcon(context, "assets/icons/share.svg"),
              getAppbarIcon(context, "assets/icons/like(selected).svg"),
            ],
          ),
          leading: getAppbarIcon(context, "assets/icons/back.svg"),
        ),
      ),
    );
  }

  Widget getAppbarIcon(BuildContext context, String asset) {
    return IconButton(
      icon: SvgPicture.asset(asset),
      onPressed: () {
        Navigator.pop(context);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
