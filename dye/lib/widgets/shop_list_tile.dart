import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/models/shop.dart';
import 'package:dye/utils/unit_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dye/widgets/raise_card.dart';
import 'package:dye/constants/colors.dart';

class ShopListTile extends StatefulWidget {
  final Shop shop;
  final String star;

  const ShopListTile({
    Key? key,
    required this.shop,
    this.star = "5.0",
  }) : super(key: key);

  @override
  _ShopListTileState createState() => _ShopListTileState();
}

class _ShopListTileState extends State<ShopListTile> {
  final tileWidth = 335.w;
  final tileHeight = 243.h;
  final cardInnerPadding = EdgeInsets.only(top: 12.h, bottom: 12.h);
  final String _titleFontFamily = "Godo";
  final _titleSize = 18.sp;
  final _subTitleSize = 16.sp;
  final _subTitleFontWeight = FontWeight.w300;
  late final String _subTitleString;
  final _starAssets = "assets/icons/star.svg";
  final _starWidth = 16.66.w;
  final _starHeight = 16.66.h;
  final _marginBetweenStarSubtitle = SizedBox(width: 4.w);
  final _likeAssetsSelected = "assets/icons/like(selected).svg";
  final _likeAssetsUnSelected = "assets/icons/like(unselected).svg";
  final _likeButtonPadding = EdgeInsets.only(right: 18.w);
  final _marginBetweenTitleContents = SizedBox(height: 8.h);
  final _marginBetweenMainThumbSubThumb = SizedBox(width: 4.w);
  final _marginBetweenSubThumbTopBottom = SizedBox(height: 4.h);

  final _thumbnailList = <String>[];

  @override
  void initState() {
    super.initState();
    _setSubTitleString();
    _setThumbnailList();
  }

  void _setSubTitleString() {
    String _address = getDong(widget.shop.address);
    String _distance = getDistance(widget.shop.distance);
    _subTitleString = "${widget.star} ∙ $_address ∙ ${_distance}KM";
  }

  void _setThumbnailList() {
    for (Dish dish in widget.shop.dishes) {
      if (dish.main == true) {
        _thumbnailList.add(dish.imageUrl);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _body(tileWidth, tileHeight);
  }

  Widget _body(double tileWidth, double tileHeight) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      child: RaiseCard(
        cardWidth: tileWidth,
        cardHeight: tileHeight,
        child: Container(
          padding: cardInnerPadding,
          child: Column(
            children: <Widget>[
              _header(),
              _marginBetweenTitleContents,
              _contentsBlock(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _titleBlock(),
        _likeButton(),
      ],
    );
  }

  Widget _titleBlock() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _title(),
        _subTitle(),
      ],
    );
  }

  Widget _title() {
    return AutoSizeText(
      widget.shop.businessName,
      maxLines: 1,
      style: TextStyle(
        fontSize: _titleSize,
        fontFamily: _titleFontFamily,
      ),
    );
  }

  Widget _subTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          _starAssets,
          color: mainColor,
          width: _starWidth,
          height: _starHeight,
        ),
        _marginBetweenStarSubtitle,
        Text(
          _subTitleString,
          style: TextStyle(
            fontSize: _subTitleSize,
            fontWeight: _subTitleFontWeight,
          ),
        ),
      ],
    );
  }

  Widget _likeButton() {
    return Container(
      alignment: Alignment.topRight,
      padding: _likeButtonPadding,
      child: widget.shop.like
          ? SvgPicture.asset(_likeAssetsSelected)
          : SvgPicture.asset(_likeAssetsUnSelected),
    );
  }

  Widget _contentsBlock() {
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          _mainThumbnail(),
          _marginBetweenMainThumbSubThumb,
          _subThumbnail(),
        ],
      ),
    );
  }

  Widget _thumbnailImage(url) {
    return Container(
      height: double.infinity,
      color: colorBeige,
      child: CachedNetworkImage(
        imageUrl: url,
        errorWidget: (context, url, error) =>
            Icon(Icons.warning_amber_outlined),
        fit: BoxFit.cover,
        fadeOutDuration: Duration(seconds: 0),
        fadeInDuration: Duration(seconds: 0),
      ),
    );
  }

  Widget _mainThumbnail() {
    return Expanded(
      flex: 3,
      child: _thumbnailImage(_thumbnailList[0]),
    );
  }

  Widget _subThumbnail() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          _topSubThumbnail(),
          _marginBetweenSubThumbTopBottom,
          _bottomSubThumbnail(),
        ],
      ),
    );
  }

  Widget _topSubThumbnail() {
    return Expanded(
      flex: 1,
      child: _thumbnailImage(_thumbnailList[1]),
    );
  }

  Widget _bottomSubThumbnail() {
    return Expanded(
      flex: 1,
      child: _thumbnailImage(_thumbnailList[2]),
    );
  }
}
