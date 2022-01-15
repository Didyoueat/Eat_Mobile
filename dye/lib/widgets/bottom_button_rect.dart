import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dye/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomButtonRect extends StatelessWidget {
  final font = "Godo";
  final String mainMessage;
  final String? sideMessage;
  final String? svgAsset;
  final bool isActive;
  final VoidCallback function;
  final mainContentsPadding = 10.0;
  final primaryColor = Colors.white;
  final buttonHighlightColor = const Color(0x22000000);

  const BottomButtonRect({
    Key? key,
    required this.mainMessage,
    required this.function,
    this.sideMessage,
    this.svgAsset = "assets/icons/cart.svg",
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonHeight = 52.h;
    const buttonTopRadius = 10.0;
    const buttonElevation = 6.0;
    final mainMessageMaxWidth = 210.w;
    final mainMessageFontSize = 18.sp;
    final sideMessageFontSize = 14.sp;
    final childTopPadding = 20.h;
    final borderRadius = BorderRadius.all(Radius.circular(buttonTopRadius));
    final buttonMargin = EdgeInsets.only(bottom: 42.h, left: 16.w, right: 16.w);
    final sidePadding = EdgeInsets.only(right: 16.w);

    return Container(
      alignment: Alignment.bottomCenter,
      margin: buttonMargin,
      child: Material(
        elevation: buttonElevation,
        borderRadius: borderRadius,
        child: Ink(
          width: double.infinity,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: isActive ? mainColor : buttonInactive,
            borderRadius: borderRadius,
          ),
          child: InkWell(
            onTap: isActive ? function : null,
            borderRadius: borderRadius,
            highlightColor: buttonHighlightColor,
            splashColor: Colors.transparent,
            child: _body(childTopPadding, mainMessageMaxWidth,
                mainMessageFontSize, sideMessageFontSize, sidePadding),
          ),
        ),
      ),
    );
  }

  Widget _body(final childTopPadding, final messageWidth,
      final mainMessageFontSize, sideMessageFontSize, sidePadding) {
    List<Widget> _contents = [];
    List<Widget> _centerList = [];

    if (svgAsset != null) {
      _centerList.add(_leading());
    }
    _centerList.add(_title(primaryColor, messageWidth, mainMessageFontSize));
    _contents.add(
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
      alignment: Alignment.centerRight,
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
      alignment: Alignment.center,
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

  Widget _leading() {
    return Container(
      padding: EdgeInsets.only(right: mainContentsPadding),
      child: Center(
        child: SvgPicture.asset(svgAsset!, color: primaryColor),
      ),
    );
  }
}
