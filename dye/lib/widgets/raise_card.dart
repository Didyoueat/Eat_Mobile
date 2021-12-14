import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RaiseCard extends StatelessWidget {
  final Color? cardColor;
  final double? cardHeight;
  final Widget widget;
  final double _elevation = 5;

  const RaiseCard(
    this.widget, {
    Key? key,
    this.cardColor,
    this.cardHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double defaultCardHeight = 128.h;

    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.sp)),
      shadowColor: Color(0x33aaaaaa),
      color: cardColor ?? Colors.white,
      elevation: _elevation,
      child: Container(
        alignment: Alignment.center,
        width: 1000,
        height: cardHeight ?? defaultCardHeight,
        child: widget,
      ),
    );
  }
}
