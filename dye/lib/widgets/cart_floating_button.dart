import 'package:dye/constants/colors.dart';
import 'package:dye/main.dart';
import 'package:dye/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({
    Key? key,
    required this.onPressed,
    required this.totalCount,
  }) : super(key: key);

  final VoidCallback onPressed;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68.w,
      height: 68.h,
      child: FloatingActionButton(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        backgroundColor: mainColor,
        elevation: 5,
        onPressed: onPressed,
        child: Stack(
          children: [
            _cartIcon(),
            (totalCount == 0) ? Container() : _countContainer(),
          ],
        ),
      ),
    );
  }

  Widget _cartIcon() {
    return Center(
      child: Container(
        margin:
            (totalCount == 0) ? null : EdgeInsets.only(right: 9.w, top: 15.h),
        child: SvgPicture.asset(
          "assets/icons/cart.svg",
          width: 27.2.w,
          height: 27.2.h,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _countContainer() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 19.w, bottom: 19.h),
        width: 29.w,
        height: 29.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            totalCount.toString(),
            style: TextStyle(
              color: mainColor,
              fontSize: 18.sp,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
