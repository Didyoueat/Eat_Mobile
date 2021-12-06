import 'package:flutter/material.dart';
import 'package:dye/constants/colors.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double? borderWidth;
  final BorderStyle? borderStyle;
  final String? tooltip;
  final Color? backgroundColor;

  const CircleButton({
    Key? key,
    required this.onTap,
    this.child,
    this.width,
    this.height,
    this.borderColor,
    this.borderWidth,
    this.borderStyle,
    this.tooltip,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip ?? '',
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: widget.width ?? 40,
          height: widget.height ?? 40,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.borderColor ?? Color(borderColorGray),
              style: widget.borderStyle ?? BorderStyle.solid,
              width: widget.borderWidth ?? 1,
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
