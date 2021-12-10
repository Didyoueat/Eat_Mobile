import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dye/widgets/raise_card.dart';
import 'package:dye/constants/colors.dart';

class ShopListTile extends StatefulWidget {
  final String title;
  final String star;
  final String address;
  final String distance;
  final String urlThumbNail1;
  final String urlThumbNail2;
  final String urlThumbNail3;
  final bool like;

  const ShopListTile({
    Key? key,
    required this.title,
    required this.address,
    required this.distance,
    required this.like,
    required this.urlThumbNail1,
    required this.urlThumbNail2,
    required this.urlThumbNail3,
    this.star = "5.0",
  }) : super(key: key);

  @override
  _ShopListTileState createState() => _ShopListTileState();
}

class _ShopListTileState extends State<ShopListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      child: RaiseCard(
        Container(
          padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: "Godo",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                            color: mainColor,
                            width: 16.66.w,
                            height: 16.66.h,
                          ),
                          SizedBox(width: 4.w),
                          Text.rich(
                            TextSpan(
                              text: widget.star,
                              style: TextStyle(fontSize: 16.sp),
                              children: <TextSpan>[
                                TextSpan(text: " ∙ "),
                                TextSpan(text: widget.address),
                                TextSpan(text: " ∙ "),
                                TextSpan(text: widget.distance),
                                TextSpan(text: "KM"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(top: 2.5.h, right: 18.w),
                    child: widget.like
                        ? SvgPicture.asset("assets/icons/like(selected).svg")
                        : SvgPicture.asset("assets/icons/like(unselected).svg"),
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
                        flex: 3,
                        child: Container(
                          color: colorBeige,
                          child: Image.network(
                            widget.urlThumbNail1,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: colorBeige,
                                child: Image.network(
                                  widget.urlThumbNail2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: colorBeige,
                                child: Image.network(
                                  widget.urlThumbNail3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
    );
  }
}
