import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 44.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 19.w),
            child: _leading(context),
          ),
          _sortButtonList(),
        ],
      ),
    );
  }

  Widget _leading(context) {
    return InkWell(
      child: SvgPicture.asset("assets/icons/back.svg"),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _sortButtonList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          child: SvgPicture.asset("assets/icons/home(unselected).svg"),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
        ),
        SizedBox(
          width: 12.w,
        ),
        InkWell(
          child: SvgPicture.asset("assets/icons/call.svg"),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
        ),
        SizedBox(
          width: 12.w,
        ),
        InkWell(
          child: SvgPicture.asset("assets/icons/share.svg"),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
        ),
        SizedBox(
          width: 12.w,
        ),
        InkWell(
          child: SvgPicture.asset("assets/icons/like(selected).svg"),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
        ),
        SizedBox(
          width: 12.w,
        ),
      ],
    );
  }
}
