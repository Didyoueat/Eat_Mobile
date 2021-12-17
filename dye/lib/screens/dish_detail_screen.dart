import 'package:dye/constants/colors.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/widgets/custom_appbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  int orderCount = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 1000,
                      height: 196.h,
                      child: Image.network(
                        widget.dish.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(
                            dishContent,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14.sp),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius: BorderRadius.circular(30.sp),
                                ),
                                width: 100.w,
                                height: 36.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
