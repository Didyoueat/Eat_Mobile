import 'dart:developer';

import 'package:dye/constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PentagonPainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  const PentagonPainter(
      {this.strokeColor = mainColor,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getPath(size.width, size.height), paint);
  }

  Path getPath(double x, double y) {
    final radius = 10.sp;
    final topSideRadian = (math.pi - math.atan((x / 2) / (y / 3)));
    final topSideLengthGap =
        radius * math.tan((math.pi / 2) - (topSideRadian / 2));
    final yGap = (radius * math.sin(((math.pi / 2) - (topSideRadian / 2)) * 2));
    final xGap =
        radius - (radius * math.cos(((math.pi / 2) - (topSideRadian / 2)) * 2));
    final topCenterHalfTheta = math.atan((y / 3) / (x / 2));
    final topCenterHypotenuse = 10 / math.cos(topCenterHalfTheta);

    final topLeftStart = Offset(0, y / 3 + topSideLengthGap);
    final topLeftEnd = Offset(0 + xGap, y / 3 + topSideLengthGap - yGap);
    final topRightStart = Offset(x - xGap, y / 3 + topSideLengthGap - yGap);
    final topRightEnd = Offset(x, y / 3 + topSideLengthGap);
    final topCenterOffset = Offset(x / 2, topCenterHypotenuse);

    Path path = Path()
      ..moveTo(topRightStart.dx, topRightStart.dy)
      ..arcToPoint(topRightEnd, radius: Radius.circular(radius))
      ..lineTo(x, y - radius)
      ..arcToPoint(Offset(x - radius, y), radius: Radius.circular(radius))
      ..lineTo(0 + radius, y)
      ..arcToPoint(Offset(0, y - radius), radius: Radius.circular(radius))
      ..lineTo(0, y / 3 + topSideLengthGap)
      ..lineTo(topLeftStart.dx, topLeftStart.dy)
      ..arcToPoint(topLeftEnd, radius: Radius.circular(radius))
      ..arcTo(Rect.fromCircle(center: topCenterOffset, radius: radius),
          math.pi * 1.5 - topCenterHalfTheta, topCenterHalfTheta * 2, false)
      ..close();
    return path;
  }

  @override
  bool shouldRepaint(PentagonPainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
