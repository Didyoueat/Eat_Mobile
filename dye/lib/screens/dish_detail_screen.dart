import 'package:cached_network_image/cached_network_image.dart';
import 'package:dye/constants/colors.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/widgets/bottom_button_rect.dart';
import 'package:dye/widgets/custom_appbar.dart';
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
  //Data
  late final _dishTitle = widget.dish.title.toString();
  late final _dishWeight = "(" + widget.dish.weight.toString() + "g)";
  late final _dishDescription = widget.dish.content!.toString();
  late final _dishPrice = widget.dish.price.toString() + "원";
  final _addCardButtonString = "1개 담기";
  int _orderCount = 1;
  final _orderCountMin = 1;
  final _orderCountMax = 99;

  //Layout
  final _dishImageTopMargin = SizedBox(height: 12.h);
  final _dishImageBottomMargin = SizedBox(height: 8.h);
  final _dishImageHeight = 196.h;
  final _dishInformationSidePadding = EdgeInsets.only(left: 25.w, right: 25.w);
  final _dishInfoTitleFontWeight = FontWeight.w700;
  final _dishInfoTitleFontSize = 24.sp;
  final _dishInfoMarginBetweenTitleWeight = SizedBox(width: 8.w);
  final _dishInfoWeightFontWeight = FontWeight.w400;
  final _dishInfoWeightFontSize = 24.sp;

  final _dishInfoMarginBetweenTitleDescription = SizedBox(height: 4.h);
  final _dishInfoDescriptionFontWeight = FontWeight.w300;
  final _dishInfoDescriptionFontSize = 14.sp;

  final _dishInfoMarginBetweenDescriptionPrice = SizedBox(height: 16.h);
  final _dishInfoPriceString = "가격";
  final _dishInfoCountString = "수량";
  final _dishInfoDetailStringFontWeight = FontWeight.w500;
  final _dishInfoDetailDataFontWeight = FontWeight.w400;
  final _dishInfoDetailFontSize = 18.sp;
  final _dishInfoMarginBetweenPriceCount = SizedBox(height: 20.h);

  final _dishCountSelectionButtonRadius = 30.sp;
  final _dishCountSelectionButtonWidth = 100.w;
  final _dishCountSelectionButtonHeight = 36.h;

  final _dishInfoMarginBetweenCountReview = SizedBox(height: 28.h);

  final _contentsBottomMargin = SizedBox(height: 130.h);

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
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Stack(
        children: [
          _contents(),
          _addCartButton(),
        ],
      ),
    );
  }

  Widget _contents() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _dishImageTopMargin,
          _dishImage(),
          _dishImageBottomMargin,
          _dishInformation(),
        ],
      ),
    );
  }

  Widget _dishImage() {
    return SizedBox(
      width: double.infinity,
      height: _dishImageHeight,
      child: CachedNetworkImage(
        imageUrl: widget.dish.imageUrl,
        fit: BoxFit.cover,
        fadeOutDuration: Duration(seconds: 0),
        fadeInDuration: Duration(seconds: 0),
      ),
    );
  }

  Widget _dishInformation() {
    return Container(
      padding: _dishInformationSidePadding,
      child: Column(
        children: [
          _dishTitleContainer(),
          _dishInfoMarginBetweenTitleDescription,
          _dishDescriptionContainer(),
          _dishInfoMarginBetweenDescriptionPrice,
          _dishPriceContainer(),
          _dishInfoMarginBetweenPriceCount,
          _dishCountContainer(),
          _dishInfoMarginBetweenCountReview,
          // DottedBorder(
          //   strokeWidth: 0.5,
          //   color: Color(0xff333333),
          //   radius: Radius.circular(10),
          //   borderType: BorderType.RRect,
          //   dashPattern: const [10, 1],
          //   child: SizedBox(
          //     width: 208.w,
          //     child: Column(
          //       children: <Widget>[
          //         SizedBox(height: 16.h),
          //         Text(
          //           "- 맛 후기 -",
          //           style: TextStyle(
          //             fontWeight: FontWeight.w500,
          //             fontSize: 18.sp,
          //           ),
          //         ),
          //         Text(
          //           "(99명의 후기)",
          //           style: TextStyle(
          //             fontWeight: FontWeight.w300,
          //             fontSize: 14.sp,
          //           ),
          //         ),
          //         SizedBox(height: 12.h),
          //         Container(
          //           height: 23.h,
          //           padding: EdgeInsets.only(left: 25.w, right: 25.w),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: <Widget>[
          //               Text(
          //                 "오독함",
          //                 style: TextStyle(
          //                   height: 1.1,
          //                   fontWeight: FontWeight.w400,
          //                   fontSize: 16.sp,
          //                 ),
          //               ),
          //               SizedBox(width: 5.w),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //             ],
          //           ),
          //         ),
          //         SizedBox(height: 6.h),
          //         Container(
          //           height: 23.h,
          //           padding: EdgeInsets.only(left: 25.w, right: 25.w),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: <Widget>[
          //               Text(
          //                 "오독함",
          //                 style: TextStyle(
          //                   height: 1.1,
          //                   fontWeight: FontWeight.w400,
          //                   fontSize: 16.sp,
          //                 ),
          //               ),
          //               SizedBox(width: 5.w),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //             ],
          //           ),
          //         ),
          //         SizedBox(height: 6.h),
          //         Container(
          //           height: 23.h,
          //           padding: EdgeInsets.only(left: 25.w, right: 25.w),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: <Widget>[
          //               Text(
          //                 "오독함",
          //                 style: TextStyle(
          //                   height: 1.1,
          //                   fontWeight: FontWeight.w400,
          //                   fontSize: 16.sp,
          //                 ),
          //               ),
          //               SizedBox(width: 5.w),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //               SvgPicture.asset("assets/icons/review_circle.svg",
          //                   height: 20.h),
          //             ],
          //           ),
          //         ),
          //         SizedBox(height: 31.h),
          //       ],
          //     ),
          //   ),
          // ),
          _contentsBottomMargin,
        ],
      ),
    );
  }

  Widget _dishTitleContainer() {
    return Row(
      children: [
        Text(
          _dishTitle,
          style: TextStyle(
            fontWeight: _dishInfoTitleFontWeight,
            fontSize: _dishInfoTitleFontSize,
          ),
        ),
        _dishInfoMarginBetweenTitleWeight,
        Text(
          _dishWeight,
          style: TextStyle(
            fontWeight: _dishInfoWeightFontWeight,
            fontSize: _dishInfoWeightFontSize,
          ),
        ),
      ],
    );
  }

  Widget _dishDescriptionContainer() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        _dishDescription,
        style: TextStyle(
          fontWeight: _dishInfoDescriptionFontWeight,
          fontSize: _dishInfoDescriptionFontSize,
        ),
      ),
    );
  }

  Widget _dishPriceContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _dishInfoPriceString,
          style: TextStyle(
            fontSize: _dishInfoDetailFontSize,
            fontWeight: _dishInfoDetailStringFontWeight,
          ),
        ),
        Text(
          _dishPrice,
          style: TextStyle(
            fontSize: _dishInfoDetailFontSize,
            fontWeight: _dishInfoDetailDataFontWeight,
          ),
        ),
      ],
    );
  }

  Widget _dishCountContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _dishInfoCountString,
          style: TextStyle(
            fontSize: _dishInfoDetailFontSize,
            fontWeight: _dishInfoDetailStringFontWeight,
          ),
        ),
        _dishCountSelectionButton(),
      ],
    );
  }

  Widget _dishCountSelectionButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColorBB),
        borderRadius: BorderRadius.circular(_dishCountSelectionButtonRadius),
      ),
      width: _dishCountSelectionButtonWidth,
      height: _dishCountSelectionButtonHeight,
      child: _dishCountSelectionButtonChild(),
    );
  }

  Widget _dishCountSelectionButtonChild() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 6.w, right: 6.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _dishCountSelectionButtonMinusIcon(),
              _dishCountSelectionButtonPlusIcon(),
            ],
          ),
        ),
        Text(
          _orderCount.toString(),
          style: TextStyle(
            height: 1.2,
            fontSize: _dishInfoDetailFontSize,
            fontWeight: _dishInfoDetailDataFontWeight,
          ),
        ),
      ],
    );
  }

  Widget _dishCountSelectionButtonMinusIcon() {
    if (_orderCount <= _orderCountMin) {
      return Icon(
        Icons.remove,
        color: colorDeactivate,
      );
    }
    return InkWell(
      child: Icon(Icons.remove),
      onTap: () {
        setState(() {
          _orderCount--;
        });
      },
    );
  }

  Widget _dishCountSelectionButtonPlusIcon() {
    if (_orderCount >= _orderCountMax) {
      return Icon(
        Icons.add_outlined,
        color: colorDeactivate,
      );
    }
    return InkWell(
      child: Icon(Icons.add_outlined),
      onTap: () {
        setState(() {
          _orderCount++;
        });
      },
    );
  }
  /////////////////////////////////////////

  Widget _addCartButton() {
    return BottomButtonRect(
      mainMessage: _addCardButtonString,
      sideMessage: "7000원",
      function: () {},
    );
  }
}
