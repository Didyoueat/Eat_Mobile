import 'package:dye/models/dish.dart';
import 'package:dye/screens/dish_detail_screen.dart';
import 'package:dye/widgets/custom_info_appbar.dart';
import 'package:flutter/material.dart';

class SubscribeDishDetailScreen extends StatefulWidget {
  final Dish dish;
  final weekSelection;
  const SubscribeDishDetailScreen({
    Key? key,
    required this.dish,
    required this.weekSelection,
  }) : super(key: key);

  @override
  _SubscribeDishDetailScreenState createState() =>
      _SubscribeDishDetailScreenState();
}

class _SubscribeDishDetailScreenState extends State<SubscribeDishDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomInfoAppBar(
        weekSelection: widget.weekSelection,
        nowWeek: 0,
      ),
      body: DishDetailScreen(dish: widget.dish),
    );
  }
}
