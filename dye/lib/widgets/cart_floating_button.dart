import 'package:dye/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

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
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/cart.svg",
            width: 27.2.w,
            height: 27.2.h,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
