import 'package:dye/constants/colors.dart';
import 'package:dye/main.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/models/dish_cart.dart';
import 'package:dye/widgets/custom_visibility.dart';
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
    required this.cartList,
    required this.onTapCircleButton,
  })  : preferredSize = Size.fromHeight(60.h),
        super(key: key);

  @override
  final Size preferredSize;
  final List<bool> daysOption;
  final int nowWeek;
  final Function onTapCircleButton;
  final List<List<DishCart>> cartList;

  final List<String> _weekName = const ["월", "화", "수", "목", "금", "토", "일"];
  final _weekButtonWidth = 36.w;
  final _weekButtonHeight = 44.h;
  final _circleHeight = 36.h;
  final _circleTextSize = 1.3;
  final _buttonMargin = 12.w;
  final _cartInfoContainerHeight = 17.h;
  final _cartInfoContainerRadius = 5.0;
  final _cartInfoTextSize = 12.sp;
  final _cartInfoTextHeight = 1.26;
  final _appBarBottomPadding = EdgeInsets.only(bottom: 8.h);
  final List<Widget> _weekButtonList = [];

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
    _setWeekButtons();
    return Container(
      padding: _appBarBottomPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _weekButtonList,
      ),
    );
  }

  void _setWeekButtons() {
    for (int i = 0; i < 7; i++) {
      if (daysOption[i] == true) {
        _weekButtonList.add(_weekButton(i));
        _weekButtonList.add(SizedBox(width: _buttonMargin));
      }
    }
    _weekButtonList.removeAt(_weekButtonList.length - 1);
  }

  Widget _weekButton(int i) {
    return SizedBox(
      width: _weekButtonWidth,
      height: _weekButtonHeight,
      child: Stack(
        children: [
          _circleButton(i),
          _cartInfoContainer(i),
        ],
      ),
    );
  }

  Widget _circleButton(int i) {
    return Container(
      alignment: Alignment.topCenter,
      child: CircleButton(
        height: _circleHeight,
        onTap: () => onTapCircleButton(i),
        borderColor: (i == nowWeek) ? mainColor : null,
        child: Text(
          _weekName[i],
          style: TextStyle(
            color: (i == nowWeek) ? mainColor : borderColorAA,
            height: _circleTextSize,
          ),
        ),
      ),
    );
  }

  Widget _cartInfoContainer(int i) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: CustomVisibility(
        visible: (cartList[i].isEmpty) ? false : true,
        child: Container(
          height: _cartInfoContainerHeight,
          decoration: BoxDecoration(
            color: (i == nowWeek) ? mainColor : borderColorAA,
            borderRadius: BorderRadius.circular(_cartInfoContainerRadius),
          ),
          child: Center(
            child: Text(
              // cartList[i].length.toString(),
              getDishCount(i),
              style: TextStyle(
                color: Colors.white,
                fontSize: _cartInfoTextSize,
                height: _cartInfoTextHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getDishCount(int i) {
    int dishCount = 0;
    cartList[i].forEach((e) {
      dishCount += e.count;
    });
    return dishCount.toString();
  }

  Widget _appbarDivider() => Container(
        height: 1,
        color: Color(0xffcccccc),
      );
}
