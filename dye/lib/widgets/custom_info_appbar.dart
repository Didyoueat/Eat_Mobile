import 'package:dye/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'circle_button.dart';

class CustomInfoAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomInfoAppBar({
    Key? key,
    required this.daysOption,
    required this.nowWeek,
  })  : preferredSize = Size.fromHeight(72.h),
        super(key: key);

  @override
  final Size preferredSize;
  final List<bool> daysOption;
  final int nowWeek;
  final List<String> _weekName = const ["월", "화", "수", "목", "금", "토", "일"];
  final circleWidth = 36.w;
  final circleHeight = 36.h;
  final padding = 12.w;
  final List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _weekButtons(),
          _appbarDivider(),
        ],
      ),
    );
  }

  Widget _weekButtons() {
    for (int i = 0; i < 7; i++) {
      if (daysOption[i] == true) {
        list.add(
          Column(
            children: [
              CircleButton(
                width: circleWidth,
                height: circleHeight,
                onTap: () {},
                child: Text(
                  _weekName[i],
                  style: TextStyle(color: textColorGray),
                ),
              ),
              Visibility(
                visible: (i == nowWeek) ? true : false,
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                child: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  width: 15.h,
                  color: mainColor,
                ),
              ),
            ],
          ),
        );
      }
      if (daysOption[i] == true) list.add(SizedBox(width: padding));
    }
    list.removeAt(list.length - 1);

    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: list,
      ),
    );
  }

  Widget _appbarDivider() => Container(
        height: 1,
        color: Color(0xffcccccc),
      );
}
