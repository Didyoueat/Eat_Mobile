import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dye/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomButtonFill extends StatelessWidget {
  final font = "Godo";
  final String mainMessage;
  final String? sideMessage;
  final String? svgAsset;
  final bool isActive;
  final VoidCallback function;
  final mainContentsPadding = 10.0;

  const BottomButtonFill({
    Key? key,
    required this.mainMessage,
    required this.function,
    this.sideMessage,
    this.isActive = true,
    this.svgAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonHeight = 98.h;
    final buttonTopRadius = 15.w;
    final childTopPadding = 20.h;
    final primaryColor = Colors.white;

    return Container(
      alignment: Alignment.bottomCenter,
      child: Material(
        child: Ink(
          width: double.infinity,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(buttonTopRadius),
              topRight: Radius.circular(buttonTopRadius),
            ),
          ),
          child: InkWell(
            onTap: function,
            // onTap: () {},
            onLongPress: null,

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(buttonTopRadius),
              topRight: Radius.circular(buttonTopRadius),
            ),
            highlightColor: Color(0x22000000),
            splashColor: Colors.transparent,
            child: _body(childTopPadding, primaryColor),
          ),
        ),
      ),
    );
  }

  Widget _body(final childTopPadding, final primaryColor) {
    List<Widget> _contents = [];
    List<Widget> _centerList = [];

    if (svgAsset != null) {
      _centerList.add(_leading(primaryColor));
    }
    _centerList.add(_title(primaryColor));
    _contents.add(
      Container(
        padding: EdgeInsets.only(top: childTopPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _centerList,
        ),
      ),
    );
    if (sideMessage != null) {
      _contents.add(_side(primaryColor));
    }
    return Stack(children: _contents);
  }

  Container _side(primaryColor) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AutoSizeText(
            sideMessage!,
            style: TextStyle(
                color: primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  AutoSizeText _title(primaryColor) {
    return AutoSizeText(
      mainMessage,
      style: TextStyle(
        color: primaryColor,
        fontSize: 18.sp,
        fontFamily: font,
      ),
    );
  }

  Container _leading(primaryColor) {
    return Container(
      child: SvgPicture.asset(svgAsset!, color: primaryColor),
      padding: EdgeInsets.only(right: mainContentsPadding),
    );
  }
}
