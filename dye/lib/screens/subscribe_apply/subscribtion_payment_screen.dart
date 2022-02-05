import 'package:dye/constants/colors.dart';
import 'package:dye/models/dish_cart.dart';
import 'package:dye/widgets/raise_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SubscribePaymentScreen extends StatefulWidget {
  const SubscribePaymentScreen({
    Key? key,
    required this.cartList,
  }) : super(key: key);

  final List<List<DishCart>> cartList;
  final title = "결제하기";
  @override
  _SubscribePaymentScreenState createState() => _SubscribePaymentScreenState();
}

class _SubscribePaymentScreenState extends State<SubscribePaymentScreen> {
  //String
  final _totalPriceString = "총 결제 금액";
  final _priceUnit = "원";

  //Asset
  final _walletAsset = "assets/icons/pay.svg";
  final _backButtonAsset = "assets/icons/back.svg";

  //margin padding
  final _appBarTitleMargin = SizedBox(width: 8.w);
  final _appBarBackMargin = EdgeInsets.only(left: 13.w);
  final _bodyTopMargin = SizedBox(height: 16.h);
  final _bodySidePadding = EdgeInsets.only(left: 16.w, right: 16.w);
  final _priceContainerHeightMargin = SizedBox(height: 8.h);
  final _totalPriceSidePadding = EdgeInsets.only(left: 16.w, right: 16.w);
  final _priceSidePadding = EdgeInsets.only(left: 20.w, right: 20.w);

  //Controller

  //Data
  late final List<List<DishCart>> _cartList = widget.cartList;
  final List<String> _weekName = const ["월", "화", "수", "목", "금", "토", "일"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: CupertinoNavigationBar(
          middle: _appBarMiddleWidget(),
          automaticallyImplyLeading: false,
        ),
        body: _body(),
      ),
    );
  }

  Widget _appBarMiddleWidget() {
    return Material(
      child: Stack(
        children: [
          _appbarTitle(),
          _appbarLeading(),
        ],
      ),
    );
  }

  Widget _appbarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(_walletAsset),
        _appBarTitleMargin,
        Text(
          widget.title,
          style: TextStyle(
            height: 1.2,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Widget _appbarLeading() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: _appBarBackMargin,
        child: SvgPicture.asset(_backButtonAsset),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        padding: _bodySidePadding,
        child: Column(
          children: [
            _bodyTopMargin,
            _priceContainer(),
            SizedBox(height: 16.h),
            _paymentType(),
            SizedBox(height: 10.h),
            _deliveryAddress(),
            SizedBox(height: 10.h),
            _deliveryTime(),
            SizedBox(height: 10.h),
            _messageShop(),
            SizedBox(height: 10.h),
            _messageDelivery(),
            SizedBox(height: 150.h),
          ],
        ),
      ),
    );
  }

  Widget _paymentType() {
    return _deliveryInfoContainer(
      title: "결제 방식",
      child: Center(
        child: Text(
          "신용/체크카드",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  Widget _deliveryAddress() {
    return _deliveryInfoContainer(
      title: "배송 주소",
      child: Center(
        child: Text(
          "101호",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  Widget _deliveryTime() {
    return _deliveryInfoContainer(
      title: "배송 희망 시간",
      child: Center(
        child: Text(
          "오전",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  Widget _messageShop() {
    return _deliveryInfoTextField(title: "가게 사장님께 전하고 싶은 말");
  }

  Widget _messageDelivery() {
    return _deliveryInfoTextField(title: "배달 기사님께 전하고 싶은 말");
  }

  Widget _deliveryInfoContainer(
      {required String title, required Widget child}) {
    return RaiseCard(
      cardColor: colorBeige,
      cardHeight: 110.h,
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$title:",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: double.infinity,
              height: 36.h,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: borderColorAA),
                borderRadius: BorderRadius.circular(5),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget _deliveryInfoTextField(
      {required String title,
      TextEditingController? controller,
      String? initValue}) {
    return RaiseCard(
      cardColor: colorBeige,
      cardHeight: 110.h,
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$title:",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 36.h,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 13), //here your padding
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColorAA),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColorAA),
                  ),
                  focusColor: Colors.red,
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceContainer() {
    return Column(
      children: <Widget>[
        _totalPriceContainer(),
        _priceContainerHeightMargin,
        _dishesPriceContainer(),
      ],
    );
  }

  Widget _totalPriceContainer() {
    return Container(
      padding: _totalPriceSidePadding,
      child: _priceForm(
        title: Text(
          _totalPriceString,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        price: Text(
          _getAllPrice().toString() + _priceUnit,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _dishesPriceContainer() {
    List<Widget> list = [];
    for (int i = 0; i < 7; i++) {
      if (_cartList[i].isNotEmpty) {
        list.add(_weekContainer(i));
      }
      for (var _dishes in _cartList[i]) {
        list.add(_dishContainer(_dishes));
      }
      if (_cartList[i].isNotEmpty) {
        list.add(_priceContainerHeightMargin);
      }
    }

    return Container(
      padding: _priceSidePadding,
      child: Column(children: list),
    );
  }

  Widget _weekContainer(int i) {
    return _priceForm(
      title: Text(
        "[" + _weekName[i] + "요일]",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      price: Text(
        _getDayPrice(i).toString() + _priceUnit,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _dishContainer(DishCart _dish) {
    String _dishName = "${_dish.dish.title}  (${_dish.dish.weight}g)";
    String _dishPrice =
        (_dish.dish.price * _dish.count).toString() + _priceUnit;

    if (_dish.count != 1) {
      _dishName += "  x  ${_dish.count}";
    }

    return _priceForm(
      title: Text(
        _dishName,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Color(0xff868686),
        ),
      ),
      price: Text(
        _dishPrice,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Color(0xff868686),
        ),
      ),
    );
  }

  Widget _priceForm({required Widget title, required Widget price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[title, price],
    );
  }

  int _getDayPrice(int i) {
    int _price = 0;
    for (var _dish in _cartList[i]) {
      _price += _dish.dish.price * _dish.count;
    }
    return _price;
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
