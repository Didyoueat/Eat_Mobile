import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RaiseCard extends StatelessWidget {
  final Color? cardColor;
  final double? cardWidth;
  final double? cardHeight;
  final Widget child;
  final double _elevation = 5;

  const RaiseCard({
    Key? key,
    required this.child,
    this.cardColor,
    this.cardWidth,
    this.cardHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double defaultCardWidth = double.infinity;
    final double defaultCardHeight = 128.h;

    return SizedBox(
      width: cardWidth ?? defaultCardWidth,
      height: cardHeight ?? defaultCardHeight,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.sp),
        ),
        shadowColor: Color(0x33aaaaaa),
        color: cardColor ?? Colors.white,
        elevation: _elevation,
        child: Container(
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
