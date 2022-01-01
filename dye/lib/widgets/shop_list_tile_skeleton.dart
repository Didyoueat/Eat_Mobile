import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class ShopListTileSkeleton extends StatelessWidget {
  const ShopListTileSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      period: Duration(seconds: 1),
      highlightColor: Colors.grey[400]!,
      builder: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Card(
          color: Colors.transparent,
          child: Container(
            width: 335.w,
            height: 243.h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        // color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 65.w,
                              height: 20.h,
                              color: Colors.white,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.h),
                              width: 150.w,
                              height: 23.h,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(top: 7.h, right: 18.w),
                      child: Container(
                        // color: Colors.white,
                        child: SvgPicture.asset(
                            "assets/icons/like(unselected).svg"),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 8.h),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 3, child: Container(color: Colors.white)),
                        SizedBox(width: 4.w),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(color: Colors.white)),
                              SizedBox(height: 4.h),
                              Expanded(
                                  flex: 1,
                                  child: Container(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
