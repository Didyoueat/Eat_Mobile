import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(72.h),
        super(key: key);
  @override
  final Size preferredSize;

  final _appbarWidth = double.infinity;
  final _appbarHeight = 44.h;
  final _leadingMargin = EdgeInsets.only(left: 19.w);
  final _trailingMargin = EdgeInsets.only(right: 16.w);
  final _trailingGap = SizedBox(width: 12.w);
  final _backAsset = "assets/icons/back.svg";
  final _homeAsset = "assets/icons/home(unselected).svg";
  final _callAsset = "assets/icons/call.svg";
  final _shareAsset = "assets/icons/share.svg";
  final _likeAsset = "assets/icons/like(selected).svg";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _appbarWidth,
      height: _appbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _leading(context),
          _trailing(),
        ],
      ),
    );
  }

  Widget _leading(context) {
    return Container(
      margin: _leadingMargin,
      child: _button(_backAsset, () => Navigator.pop(context)),
    );
  }

  Widget _trailing() {
    return Container(
      margin: _trailingMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _button(_homeAsset, () {}),
          _trailingGap,
          _button(_callAsset, () {}),
          _trailingGap,
          _button(_shareAsset, () {}),
          _trailingGap,
          _button(_likeAsset, () {}),
        ],
      ),
    );
  }

  InkWell _button(asset, onTap) {
    return InkWell(
      child: SvgPicture.asset(asset),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
    );
  }
}
