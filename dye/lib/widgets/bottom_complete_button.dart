import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bottomCompleteButton(
    String str, VoidCallback function, final mainColor) {
  final buttonHeight = 98.h;
  final buttonTopRadius = 15.w;

  return SizedBox(
    width: 1000,
    height: buttonHeight,
    child: TextButton(
      child: AutoSizeText(
        str,
        style: TextStyle(fontSize: 18.sp, fontFamily: "Godo"),
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
        backgroundColor: Color(mainColor),
      ),
      onPressed: function,
    ),
  );
}
