import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dye/constants/colors.dart';

class BottomButton extends StatelessWidget {
  final font = "Godo";
  final String message;
  final bool isActive;
  final VoidCallback function;

  const BottomButton(
    this.message,
    this.isActive,
    this.function, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonHeight = 98.h;
    final buttonTopRadius = 15.w;

    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 1000,
        height: buttonHeight,
        child: TextButton(
          child: AutoSizeText(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: font,
            ),
            maxLines: 1,
          ),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(buttonTopRadius),
                  topRight: Radius.circular(buttonTopRadius)),
            ),
            primary: Colors.white,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20.h),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: isActive ? mainColor : buttonInactive,
          ),
          onPressed: isActive ? function : null,
        ),
      ),
    );
  }
}
