import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class ShopListTileSkeleton extends StatelessWidget {
  final int skeletonDurationSecond;
  final Color highlightColor;
  final int leftImageRatio;
  final int rightImageRatio;

  const ShopListTileSkeleton({
    Key? key,
    this.skeletonDurationSecond = 1,
    this.highlightColor = const Color(0xffbdbdbd),
    this.leftImageRatio = 3,
    this.rightImageRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tileWidth = 335.w;
    final tileHeight = 243.h;
    final titleHeight = 53.h;
    final contentsMargin = SizedBox(height: 8.h);
    final EdgeInsets outerMargin = EdgeInsets.only(left: 20.w, right: 20.w);
    final EdgeInsets innerMargin = EdgeInsets.only(left: 20.w, right: 20.w);
    final EdgeInsets innerPadding = EdgeInsets.only(top: 12.h, bottom: 12.h);

    return SkeletonLoader(
      period: Duration(seconds: skeletonDurationSecond),
      highlightColor: highlightColor,
      builder: Container(
        width: tileWidth,
        height: tileHeight,
        margin: outerMargin,
        child: Card(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            margin: innerMargin,
            padding: innerPadding,
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                titleBox(titleHeight),
                contentsMargin,
                bodyBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget contentsBox({double? h = double.infinity}) {
    return Container(color: Colors.white, height: h);
  }

  Widget bodyBox() {
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          Expanded(flex: leftImageRatio, child: contentsBox()),
          SizedBox(width: 4.w),
          Expanded(
            flex: rightImageRatio,
            child: Column(
              children: [
                Expanded(flex: 1, child: contentsBox()),
                SizedBox(height: 4.h),
                Expanded(flex: 1, child: contentsBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget titleBox(double? h) {
    return contentsBox(h: h);
  }
}
