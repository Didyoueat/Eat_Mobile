import 'package:cached_network_image/cached_network_image.dart';
import 'package:dye/constants/colors.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/models/dish_cart.dart';
import 'package:dye/widgets/raise_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishCartScreen extends StatefulWidget {
  const DishCartScreen({
    Key? key,
    required this.cartList,
    required this.onTapMinusButton,
    required this.onTapPlusButton,
    required this.onTapAddDishButton,
    required this.onTapSubscribeButton,
  }) : super(key: key);

  final List<List<DishCart>> cartList;
  final Function onTapMinusButton;
  final Function onTapPlusButton;
  final Function onTapAddDishButton;
  final Function onTapSubscribeButton;

  final title = "장바구니";

  @override
  _DishCartScreenState createState() => _DishCartScreenState();
}

class _DishCartScreenState extends State<DishCartScreen> {
  //Data
  late final List<List<DishCart>> _cartList = widget.cartList;
  int _orderCount = 1;
  final List<String> _weekName = const ["월", "화", "수", "목", "금", "토", "일"];

  //asset
  final _cartAsset = "assets/icons/cart.svg";
  final _backButtonAsset = "assets/icons/back.svg";
  final _plusAsset = "assets/icons/plus.svg";

  //String
  final _defaultCardString = "반찬 추가하기";

  //Size
  final _plusImageWidth = 40.w;
  final _dishCountSelectionButtonRadius = 30.sp;
  final _dishCountSelectionButtonWidth = 84.w;
  final _dishCountSelectionButtonHeight = 36.h;
  final _dishInfoDetailFontSize = 18.sp;
  final _dishInfoDetailDataFontWeight = FontWeight.w400;

  //MarginPadding
  final _appBarTitleMargin = SizedBox(width: 8.w);
  final _appBarBackMargin = EdgeInsets.only(left: 13.w);
  final _weekInfoSidePadding = EdgeInsets.only(left: 26.w, right: 26.w);
  final _dishCardSidePadding = EdgeInsets.only(left: 16.w, right: 16.w);

  //Style
  final _dishInfoTextStyle =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700);
  final _dishInfoPriceStyle =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: mainColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: _appBarMiddleWidget(),
        automaticallyImplyLeading: false,
      ),
      body: _body(),
    );
  }

  Widget _appBarMiddleWidget() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(_cartAsset),
            _appBarTitleMargin,
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        Container(
          padding: _appBarBackMargin,
          child: SvgPicture.asset(_backButtonAsset),
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        SizedBox(height: 32.h),
        _dayCart(0),
        SizedBox(height: 17.h),
        _dayCart(1),
      ],
    );
  }

  Widget _dayCart(int i) {
    return Column(
      children: <Widget>[
        _dishCartInfo(i),
        SizedBox(height: 4.h),
        _dishCardList(i),
      ],
    );
  }

  Widget _dishCartInfo(int i) {
    return Container(
      padding: _weekInfoSidePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "${_weekName[i]}요일 반찬",
            style: _dishInfoTextStyle,
          ),
          Text(
            "${_getPrice(_cartList[i])}원",
            style: _dishInfoPriceStyle,
          ),
        ],
      ),
    );
  }

  int _getPrice(List<DishCart> _dishes) {
    int _price = 0;
    _dishes.forEach((e) {
      _price += (e.dish.price * e.count);
    });
    return _price;
  }

  Widget _dishCardList(int i) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 26.w, right: 26.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _dishCards(),
        ),
      ),
    );
  }

  List<Widget> _dishCards() {
    List<Widget> _list = [];

    _list.add(
      Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Container(
          width: 198.w,
          height: 150.h,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: mainColor),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Container(
            padding: _dishCardSidePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16.h),
                Text(
                  "엄마의 밥상",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: <Widget>[
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "반찬이름",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "000원 (00g)",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 11.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dishCountSelectionButton(),
                    Text(
                      "0000원",
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    _list.add(_defaultCard());
    return _list;
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
    if (_orderCount <= 0) {
      return Icon(
        Icons.remove,
        color: colorDeactivate,
      );
    }
    return InkWell(
      child: Icon(Icons.remove),
      onTap: () => widget.onTapMinusButton(),
    );
  }

  Widget _dishCountSelectionButtonPlusIcon() {
    if (_orderCount >= 99) {
      return Icon(
        Icons.add_outlined,
        color: colorDeactivate,
      );
    }
    return InkWell(
      child: Icon(Icons.add_outlined),
      onTap: () => widget.onTapPlusButton(),
    );
  }

  Widget _defaultCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: InkWell(
        onTap: () => widget.onTapAddDishButton(2),
        child: Container(
          width: 198.w,
          height: 150.h,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: mainColor),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: _defaultCardContents(),
        ),
      ),
    );
  }

  Widget _defaultCardContents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          _plusAsset,
          width: _plusImageWidth,
          color: mainColor,
        ),
        SizedBox(height: 8.h),
        Text(
          _defaultCardString,
          style: TextStyle(
            color: mainColor,
            height: 1.2,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
