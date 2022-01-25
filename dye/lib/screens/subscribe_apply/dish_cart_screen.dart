import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dye/constants/colors.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/models/dish_cart.dart';
import 'package:dye/widgets/bottom_button_fill.dart';
import 'package:dye/widgets/raise_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishCartScreen extends StatefulWidget {
  const DishCartScreen({
    Key? key,
    required this.cartList,
    required this.daysOption,
    required this.onTapMinusButton,
    required this.onTapPlusButton,
    required this.onTapAddDishButton,
    required this.onTapSubscribeButton,
    required this.onTapCancelButton,
  }) : super(key: key);

  final List<List<DishCart>> cartList;
  final List<bool> daysOption;
  final Function onTapMinusButton;
  final Function onTapPlusButton;
  final Function onTapAddDishButton;
  final Function onTapSubscribeButton;
  final Function onTapCancelButton;

  final title = "장바구니";

  @override
  _DishCartScreenState createState() => _DishCartScreenState();
}

class _DishCartScreenState extends State<DishCartScreen> {
  //Data
  late final List<List<DishCart>> _cartList = widget.cartList;
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
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: _appBarBackMargin,
            child: SvgPicture.asset(_backButtonAsset),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: _dayCartsList(),
          ),
        ),
        BottomButtonFill(
          mainMessage: "반찬 구독하기",
          sideMessage: _getAllPrice().toString() + "원",
          function: () {},
        ),
      ],
    );
  }

  List<Widget> _dayCartsList() {
    List<Widget> _list = [];

    _list.add(SizedBox(height: 32.h));
    for (int i = 0; i < 7; i++) {
      if (widget.daysOption[i]) {
        _list.add(_dayCart(i));
        _list.add(SizedBox(height: 16.h));
      }
    }
    _list.removeLast();
    _list.add(SizedBox(height: 120.h));
    return _list;
  }

  Widget _dayCart(int i) {
    return Column(
      children: <Widget>[
        _dishCartInfo(i),
        SizedBox(height: 4.h),
        _dishCardListView(i),
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
    for (var e in _dishes) {
      _price += (e.dish.price * e.count);
    }
    return _price;
  }

  Widget _dishCardListView(int i) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 26.w, right: 26.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _dishCardList(i),
        ),
      ),
    );
  }

  List<Widget> _dishCardList(int dayIndex) {
    List<Widget> _list = [];

    for (int i = 0; i < _cartList[dayIndex].length; i++) {
      _list.add(_dishCard(dayIndex, i));
    }
    _list.add(_defaultCard(dayIndex));
    return _list;
  }

  Widget _dishCard(int dayIndex, int dishIndex) {
    return Card(
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
        child: _dishCardContents(dayIndex, dishIndex),
      ),
    );
  }

  Widget _dishCardContents(int dayIndex, int dishIndex) {
    return Stack(
      children: [
        _cancelButton(dayIndex, dishIndex),
        Container(
          padding: _dishCardSidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.h),
              _dishCardContentsShopName(dayIndex, dishIndex),
              SizedBox(height: 4.h),
              _dishCardContentsDishInfo(dayIndex, dishIndex),
              SizedBox(height: 11.h),
              _dishCardContentsPriceCount(dayIndex, dishIndex),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cancelButton(int dayIndex, int dishIndex) {
    return Container(
      margin: EdgeInsets.only(top: 12.h, right: 12.w),
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () async {
          await widget.onTapCancelButton(dayIndex, dishIndex);
          setState(() {});
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Icon(
          Icons.close,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _dishCardContentsShopName(int dayIndex, int dishIndex) {
    return Text(
      _cartList[dayIndex][dishIndex].shop!.businessName.toString(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _dishCardContentsDishInfo(int dayIndex, int dishIndex) {
    return Row(
      children: <Widget>[
        _dishCardContentsDishInfoImage(dayIndex, dishIndex),
        SizedBox(width: 8.w),
        _dishCardContentsDishInfoTexts(dayIndex, dishIndex),
      ],
    );
  }

  Widget _dishCardContentsDishInfoImage(int dayIndex, int dishIndex) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(
        imageUrl: _cartList[dayIndex][dishIndex].dish.imageUrl,
        fit: BoxFit.cover,
        fadeOutDuration: Duration(seconds: 0),
        fadeInDuration: Duration(seconds: 0),
      ),
    );
  }

  Widget _dishCardContentsDishInfoTexts(int dayIndex, int dishIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _cartList[dayIndex][dishIndex].dish.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          _cartList[dayIndex][dishIndex].dish.price.toString() +
              "원 (" +
              _cartList[dayIndex][dishIndex].dish.weight.toString() +
              "g)",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Widget _dishCardContentsPriceCount(int dayIndex, int dishIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dishCountSelectionButton(dayIndex, dishIndex),
        Container(
          alignment: Alignment.bottomRight,
          width: 70.w,
          child: AutoSizeText(
            (_cartList[dayIndex][dishIndex].dish.price *
                        _cartList[dayIndex][dishIndex].count)
                    .toString() +
                "원",
            maxLines: 1,
            style: TextStyle(
              height: 1.2,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _dishCountSelectionButton(int dayIndex, int dishIndex) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColorBB),
        borderRadius: BorderRadius.circular(_dishCountSelectionButtonRadius),
      ),
      width: _dishCountSelectionButtonWidth,
      height: _dishCountSelectionButtonHeight,
      child: _dishCountSelectionButtonChild(dayIndex, dishIndex),
    );
  }

  Widget _dishCountSelectionButtonChild(int dayIndex, int dishIndex) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 6.w, right: 6.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _dishCountSelectionButtonMinusIcon(dayIndex, dishIndex),
              _dishCountSelectionButtonPlusIcon(dayIndex, dishIndex),
            ],
          ),
        ),
        Text(
          _cartList[dayIndex][dishIndex].count.toString(),
          style: TextStyle(
            height: 1.2,
            fontSize: _dishInfoDetailFontSize,
            fontWeight: _dishInfoDetailDataFontWeight,
          ),
        ),
      ],
    );
  }

  Widget _dishCountSelectionButtonMinusIcon(int dayIndex, int dishIndex) {
    if (_cartList[dayIndex][dishIndex].count <= 1) {
      return Icon(
        Icons.remove,
        color: colorDeactivate,
      );
    }
    return InkWell(
      child: Icon(Icons.remove),
      onTap: () {
        widget.onTapMinusButton(dayIndex, dishIndex);
        setState(() {});
      },
    );
  }

  Widget _dishCountSelectionButtonPlusIcon(int dayIndex, int dishIndex) {
    if (_cartList[dayIndex][dishIndex].count >= 99) {
      return Icon(
        Icons.add_outlined,
        color: colorDeactivate,
      );
    }
    return InkWell(
      child: Icon(Icons.add_outlined),
      onTap: () {
        widget.onTapPlusButton(dayIndex, dishIndex);
        setState(() {});
      },
    );
  }

  Widget _defaultCard(int _dayIndex) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: InkWell(
        onTap: () => widget.onTapAddDishButton(_dayIndex),
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

  int _getAllPrice() {
    int _price = 0;
    for (var _dayList in _cartList) {
      for (var _dish in _dayList) {
        _price += _dish.dish.price * _dish.count;
      }
    }
    return _price;
  }
}
