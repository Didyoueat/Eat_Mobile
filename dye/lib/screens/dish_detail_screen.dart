import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dye/constants/colors.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/widgets/bottom_button_fill.dart';
import 'package:dye/widgets/bottom_button_rect.dart';
import 'package:dye/widgets/custom_appbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishDetailScreen extends StatefulWidget {
  final Dish dish;
  const DishDetailScreen({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  _DishDetailScreenState createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  late final dishTitle = widget.dish.title!.toString();
  late final dishWeight = widget.dish.weight!.toString();
  late final dishContent = widget.dish.content!.toString();
  late final dishPrice = widget.dish.price.toString();
  final reviewCount = 99;
  int orderCount = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 1000,
                          height: 196.h,
                          child: CachedNetworkImage(
                            imageUrl: widget.dish.imageUrl!,
                            fit: BoxFit.cover,
                            fadeOutDuration: Duration(seconds: 0),
                            fadeInDuration: Duration(seconds: 0),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    dishTitle,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.sp),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text("(${dishWeight}g)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24.sp)),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  dishContent,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14.sp),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "가격",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    dishPrice + "원",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "수량",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: borderColorBB),
                                      borderRadius:
                                          BorderRadius.circular(30.sp),
                                    ),
                                    width: 100.w,
                                    height: 36.h,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        orderCount <= 1
                                            ? Icon(
                                                Icons.remove,
                                                color: Color(0x33333333),
                                              )
                                            : InkWell(
                                                child: Icon(Icons.remove),
                                                onTap: () {
                                                  setState(() {
                                                    if (orderCount > 1) {
                                                      orderCount--;
                                                    }
                                                  });
                                                },
                                              ),
                                        Text(
                                          orderCount.toString(),
                                          style: TextStyle(
                                            height: 1.2,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        orderCount >= 99
                                            ? Icon(
                                                Icons.add_outlined,
                                                color: Color(0x33333333),
                                              )
                                            : InkWell(
                                                child: Icon(Icons.add_outlined),
                                                onTap: () {
                                                  setState(() {
                                                    if (orderCount < 99) {
                                                      orderCount++;
                                                    }
                                                  });
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 28.h),
                              DottedBorder(
                                strokeWidth: 0.5,
                                color: Color(0xff333333),
                                radius: Radius.circular(10),
                                borderType: BorderType.RRect,
                                dashPattern: const [10, 1],
                                child: SizedBox(
                                  width: 208.w,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 16.h),
                                      Text(
                                        "- 맛 후기 -",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      Text(
                                        "($reviewCount명의 후기)",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      Container(
                                        height: 23.h,
                                        padding: EdgeInsets.only(
                                            left: 25.w, right: 25.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "오독함",
                                              style: TextStyle(
                                                height: 1.1,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Container(
                                        height: 23.h,
                                        padding: EdgeInsets.only(
                                            left: 25.w, right: 25.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "오독함",
                                              style: TextStyle(
                                                height: 1.1,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Container(
                                        height: 23.h,
                                        padding: EdgeInsets.only(
                                            left: 25.w, right: 25.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "오독함",
                                              style: TextStyle(
                                                height: 1.1,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                            SvgPicture.asset(
                                                "assets/icons/review_circle.svg",
                                                height: 20.h),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 31.h),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 153.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomButtonRect(
                    mainMessage: "1개 담기",
                    sideMessage: "7000원",
                    function: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
