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
  final buttonHighlightColor = const Color(0x22000000);

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
    final mainMessageMaxWidth = 210.w;
    final mainMessageFontSize = 18.sp;
    final sideMessageFontSize = 14.sp;
    final sidePadding = EdgeInsets.only(top: 20.h, right: 16.w);
    final primaryColor = Colors.white;

    return Container(
      alignment: Alignment.bottomCenter,
      child: Material(
        child: Ink(
          width: double.infinity,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: isActive ? mainColor : buttonInactive,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(buttonTopRadius),
              topRight: Radius.circular(buttonTopRadius),
            ),
          ),
          child: InkWell(
            onTap: isActive ? function : null,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(buttonTopRadius),
              topRight: Radius.circular(buttonTopRadius),
            ),
            highlightColor: buttonHighlightColor,
            splashColor: Colors.transparent,
            child: _body(childTopPadding, primaryColor, mainMessageMaxWidth,
                mainMessageFontSize, sideMessageFontSize, sidePadding),
          ),
        ),
      ),
    );
  }

  Widget _body(final childTopPadding, final primaryColor, final messageWidth,
      final mainMessageFontSize, sideMessageFontSize, sidePadding) {
    List<Widget> _contents = [];
    List<Widget> _centerList = [];

    if (svgAsset != null) {
      _centerList.add(_leading(primaryColor));
    }
    _centerList.add(_title(primaryColor, messageWidth, mainMessageFontSize));
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
      _contents.add(_side(
        primaryColor,
        sideMessageFontSize,
        sidePadding,
      ));
    }
    return Stack(children: _contents);
  }

  Widget _side(primaryColor, sideMessageFontSize, sidePadding) {
    return Container(
      alignment: Alignment.topRight,
      padding: sidePadding,
      child: AutoSizeText(
        sideMessage!,
        style: TextStyle(
            color: primaryColor,
            fontSize: sideMessageFontSize,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _title(primaryColor, width, mainMessageFontSize) {
    return Container(
      alignment: Alignment.topCenter,
      child: AutoSizeText(
        mainMessage,
        maxLines: 1,
        style: TextStyle(
          color: primaryColor,
          height: 1.2,
          fontSize: mainMessageFontSize,
          fontFamily: font,
        ),
      ),
    );
  }

  Widget _leading(primaryColor) {
    return Container(
      alignment: Alignment.topCenter,
      child: SvgPicture.asset(svgAsset!, color: primaryColor),
      padding: EdgeInsets.only(right: mainContentsPadding),
    );
  }
}
