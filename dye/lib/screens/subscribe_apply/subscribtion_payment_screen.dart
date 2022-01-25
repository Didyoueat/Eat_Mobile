import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SubscribePaymentScreen extends StatefulWidget {
  const SubscribePaymentScreen({Key? key}) : super(key: key);

  final title = "결제하기";
  @override
  _SubscribePaymentScreenState createState() => _SubscribePaymentScreenState();
}

class _SubscribePaymentScreenState extends State<SubscribePaymentScreen> {
  //Asset
  final _walletAsset = "assets/icons/pay.svg";
  final _backButtonAsset = "assets/icons/back.svg";

  //margin padding
  final _appBarTitleMargin = SizedBox(width: 8.w);
  final _appBarBackMargin = EdgeInsets.only(left: 13.w);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: _appBarMiddleWidget(),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
    );
  }

  Widget _appBarMiddleWidget() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(_walletAsset),
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
}
