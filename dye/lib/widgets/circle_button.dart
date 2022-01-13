import 'package:flutter/material.dart';
import 'package:dye/constants/colors.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final double width;
  final double height;
  final Color? borderColor;
  final double borderWidth;
  final BorderStyle borderStyle;
  final String tooltip;
  final Color backgroundColor;

  const CircleButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.width = 40,
    this.height = 40,
    this.borderColor = borderColorGray,
    this.borderWidth = 1,
    this.borderStyle = BorderStyle.solid,
    this.tooltip = "",
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.borderColor ?? borderColorGray,
              style: widget.borderStyle,
              width: widget.borderWidth,
            ),
          ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
