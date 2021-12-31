import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dye/widgets/raise_card.dart';
import 'package:dye/constants/colors.dart';

class ShopListTileSkeleton extends StatelessWidget {
  const ShopListTileSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: SvgPicture.asset("assets/icons/like(unselected).svg"),
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
                  Expanded(flex: 3, child: Container(color: Colors.white)),
                  SizedBox(width: 4.w),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1, child: Container(color: Colors.white)),
                        SizedBox(height: 4.h),
                        Expanded(
                            flex: 1, child: Container(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
