import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dye/widgets/raise_card.dart';
import 'package:dye/constants/colors.dart';

class ShopListTile extends StatefulWidget {
  final String title;
  final String star;
  final String address;
  final String distance;
  final String urlThumbNail1;
  final String urlThumbNail2;
  final String urlThumbNail3;
  final bool like;

  const ShopListTile({
    Key? key,
    required this.title,
    required this.address,
    required this.distance,
    required this.like,
    required this.urlThumbNail1,
    required this.urlThumbNail2,
    required this.urlThumbNail3,
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

  @override
  void initState() {
    super.initState();
    _subTitleString =
        "${widget.star} ∙ ${widget.address} ∙ ${widget.distance}KM";
  }

  @override
  Widget build(BuildContext context) {
    return _body(tileWidth, tileHeight);
  }

  Widget _body(double tileWidth, double tileHeight) {
    return RaiseCard(
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
      widget.title,
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
      child: widget.like
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
      child: _thumbnailImage(widget.urlThumbNail1),
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
      child: _thumbnailImage(widget.urlThumbNail2),
    );
  }

  Widget _bottomSubThumbnail() {
    return Expanded(
      flex: 1,
      child: _thumbnailImage(widget.urlThumbNail3),
    );
  }
}
