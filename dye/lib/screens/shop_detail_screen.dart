import 'package:auto_size_text/auto_size_text.dart';
import 'package:dye/constants/colors.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/models/shop.dart';
import 'package:dye/utils/unit_converter.dart';
import 'package:dye/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopDetailScreen extends StatefulWidget {
  final Shop shop;
  const ShopDetailScreen({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  _ShopDetailScreenState createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(color: Colors.blue, child: CustomAppBar()),
              titleContainer(),
              SizedBox(height: 28.h),
              Text(
                "밑반찬",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: "Godo",
                ),
              ),
              SizedBox(height: 18.h),
              Container(
                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                child: GridView.builder(
                  itemCount: widget.shop.dishCount,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 12,
                    childAspectRatio: 92 / 138,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Dish dish = widget.shop.dishes[index];
                    return Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: Image.network(
                              dish.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                            width: 92.w,
                            height: 92.h,
                          ),
                          SizedBox(height: 8.h),
                          AutoSizeText(
                            dish.title!,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.sp),
                          ),
                          AutoSizeText(
                            dish.price.toString() + "원",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 13.sp),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleContainer() {
    return Container(
      width: 327.w,
      height: 113.h,
      margin: EdgeInsets.only(top: 4.h),
      child: Stack(
        children: [
          SizedBox(
            width: 327.w,
            height: 113.h,
            child: SvgPicture.asset(
              "assets/test_r2.svg",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(bottom: 19.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 250.w,
                  child: AutoSizeText(
                    widget.shop.businessName!.trim(),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: "Godo",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.h,
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
                        text: "5.0",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w300),
                        children: <TextSpan>[
                          TextSpan(text: " ∙ "),
                          TextSpan(text: getDong(widget.shop.address)),
                          TextSpan(text: " ∙ "),
                          TextSpan(
                            text: getDistance(widget.shop.distance!),
                          ),
                          TextSpan(text: "KM"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}