import 'package:flutter/material.dart';

class CustomVisibility extends StatelessWidget {
  const CustomVisibility({
    Key? key,
    required this.child,
    this.visible = true,
  }) : super(key: key);

  final Widget child;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: child,
      maintainState: true,
      maintainSize: true,
      maintainAnimation: true,
      visible: visible,
    );
  }
}
