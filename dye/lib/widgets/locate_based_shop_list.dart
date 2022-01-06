import 'dart:developer';

import 'package:dye/constants/colors.dart';
import 'package:dye/models/shop.dart';
import 'package:dye/utils/unit_converter.dart';
import 'package:dye/widgets/shop_list_tile.dart';
import 'package:dye/widgets/shop_list_tile_skeleton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class LocateBasedShopList extends StatefulWidget {
  final List<Shop> list;
  final bool isInSubscribe;
  final String nowLocation;
  final VoidCallback onPressLocationButton;
  final Function onTapTile;
  const LocateBasedShopList({
    Key? key,
    required this.list,
    required this.isInSubscribe,
    required this.onTapTile,
    required this.onPressLocationButton,
    this.nowLocation = "서울시 관악구 신림동",
  }) : super(key: key);

  @override
  _LocateBasedShopListState createState() => _LocateBasedShopListState();
}

class _LocateBasedShopListState extends State<LocateBasedShopList> {
  final _skeletonLength = 5;
  final _loadingDuration = Duration(milliseconds: 1000);
  late final _listCount = _isLoading ? _skeletonLength : widget.list.length + 1;
  late final double _listCacheExtent = widget.list.length + 5;
  Widget _listSeparator(context, idx) => SizedBox(height: 15.h);
  final _subscribeTitleString = "우리동네 반찬가게에요!\n끌리는 반찬가게에 들어가보세요.";
  final _subscribeTitleSize = 18.sp;
  final _subscribeTitleFontFamily = "Godo";
  final _bodyMargin = EdgeInsets.only(top: 36.h);
  final List<bool> _selectSortButton = [false, false, false];
  final List<String> _titleSortButton = ["평점순", "거리순", "단골집"];
  final _buttonHeaderHeight = 28.h;
  final _buttonHeaderMargin = EdgeInsets.only(left: 20.w, right: 20.w);
  final _buttonHeaderPadding = EdgeInsets.only(left: 4.w, right: 4.w);
  final _buttonBorderRadius = BorderRadius.circular(10);
  final _locationButtonPadding = EdgeInsets.only(left: 8.w, right: 8.w);
  final _locationButtonIconAsset = "assets/icons/location.svg";
  final _locationButtonIconWidth = 16.w;
  final _locationButtonIconHeight = 16.h;
  final _locationButtonTextSize = 13.sp;
  final _sortButtonPadding = EdgeInsets.fromLTRB(8.w, 5.h, 8.w, 5.h);
  final _sortButtonGapMargin = EdgeInsets.only(left: 4.w, right: 4.w);
  final _sortButtonTextSize = 12.sp;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLoading();
    _initValues();
  }

  void _initValues() {
    _selectSortButton[0] = true;
  }

  Future<void> fetchLoading() async {
    await Future.delayed(_loadingDuration, () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _bodyMargin,
      child: ListView.separated(
        itemCount: _listCount,
        cacheExtent: _listCacheExtent,
        separatorBuilder: _listSeparator,
        itemBuilder: (BuildContext context, int position) {
          if (widget.isInSubscribe && position == 0) {
            return _subscribeTitle();
          }

          if (widget.isInSubscribe) {
            position--;
          }

          if (position == 0) {
            return _buttonHeader();
          }
          position--;

          return listTile(position);
        },
      ),
    );
  }

  Widget _subscribeTitle() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        _subscribeTitleString,
        style: TextStyle(
          fontSize: _subscribeTitleSize,
          color: Colors.black,
          fontFamily: _subscribeTitleFontFamily,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buttonHeader() {
    return Container(
      height: _buttonHeaderHeight,
      margin: _buttonHeaderMargin,
      padding: _buttonHeaderPadding,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          locationButton(),
          sortButtonList(),
        ],
      ),
    );
  }

  Widget locationButton() {
    return InkWell(
      onTap: widget.onPressLocationButton,
      child: Container(
        padding: _locationButtonPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: _buttonBorderRadius,
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              _locationButtonIconAsset,
              width: _locationButtonIconWidth,
              height: _locationButtonIconHeight,
              color: Colors.white,
              alignment: Alignment.center,
            ),
            Text(
              widget.nowLocation,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.1,
                fontSize: _locationButtonTextSize,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sortButtonList() {
    List<Widget> list = [];

    for (int i = 0; i < 3; i++) {
      var colorChecker = _selectSortButton[i];

      Widget widget = InkWell(
        onTap: () {
          for (int k = 0; k < _selectSortButton.length; k++) {
            _selectSortButton[k] = false;
          }
          _selectSortButton[i] = true;
          setState(() {});

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('리스트가 소팅되는걸 구현할거임'),
              duration: Duration(milliseconds: 300),
            ),
          );
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          padding: _sortButtonPadding,
          margin: i == 1 ? _sortButtonGapMargin : null,
          decoration: BoxDecoration(
            border: Border.all(color: colorChecker ? mainColor : textColorGray),
            borderRadius: _buttonBorderRadius,
          ),
          child: Text(
            _titleSortButton[i],
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.0,
              fontSize: _sortButtonTextSize,
              color: colorChecker ? mainColor : textColorGray,
            ),
          ),
        ),
      );

      list.add(widget);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }

  Widget listTile(int position) {
    if (!_isLoading) {
      return InkWell(
        onTap: () => widget.onTapTile(widget.list[position]),
        child: ShopListTile(
          shop: widget.list[position],
        ),
      );
    } else {
      return ShopListTileSkeleton();
    }
  }
}
