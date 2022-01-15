import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dye/constants/colors.dart';
import 'package:dye/models/dish.dart';
import 'package:dye/models/shop.dart';
import 'package:dye/screens/dish_detail_screen.dart';
import 'package:dye/utils/unit_converter.dart';
import 'package:dye/widgets/custom_appbar.dart';
import 'package:dye/widgets/custom_info_appbar.dart';
import 'package:dye/widgets/pentagon_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopDetailScreen extends StatelessWidget {
  late final _context;

  final Shop shop;
  final Function? onTapDish;

  final mainDishList = <Dish>[];
  final sideDishList = <Dish>[];

  final _titleContainerWidth = 327.w;
  final _titleContainerHeight = 113.h;
  final _titleContainerTopMargin = EdgeInsets.only(top: 12.h);
  final _titleContainerInnerPadding = EdgeInsets.only(bottom: 19.h);
  final _titleContainerTitleMaxWidth = 250.w;
  final _titleContainerTitleFontSize = 24.sp;
  final _titleContainerTitleFontFamily = "Godo";
  final _titleContainerTitleSubtitleGap = SizedBox(height: 10.h);
  final _titleContainerStarAsset = "assets/icons/star.svg";
  final _titleContainerStarWidth = 16.66.w;
  final _titleContainerStarHeight = 16.66.h;
  final _titleContainerStarMargin = EdgeInsets.only(right: 4.w);
  late final _titleContainerTitleText;
  late final _titleContainerSubtitleText;
  final _titleContainerSubtitleFontSize = 16.sp;
  final _titleContainerSubtitleFontFamily = FontWeight.w300;

  final _dishTitleTopMargin = SizedBox(height: 28.h);
  final _dishTitleBottomMargin = SizedBox(height: 18.h);

  final sideDishTitle = "밑반찬";
  final mainDishTitle = "메인 반찬";
  final _dishTitleFontSize = 20.sp;
  final _dishTitleFontFamily = "Godo";

  final _dividerWidth = 172.w;

  final _sideDishGridViewMarginBottom = SizedBox(height: 24.h);
  final _mainDishGridViewMarginBottom = SizedBox(height: 100.h);
  final _dishGridViewSideMargin = EdgeInsets.only(left: 30.w, right: 30.w);
  final _dishGridviewRowCount = 3;
  final _dishGridViewHeightMargin = 12.h;
  final _dishGridViewWidthMargin = 20.w;
  late final _dishGridViewChildRatio = _dishTileWidth / _dishTileHeight;

  final _dishTileWidth = 92.w;
  final _dishTileHeight = 138.h;
  final _dishTileThumbnailRadius = BorderRadius.circular(30.sp);
  final _dishTileThumbnailWidth = 92.w;
  final _dishTileThumbnailHeight = 92.h;
  final _dishTileNameTextStyle =
      TextStyle(height: 1.5, fontWeight: FontWeight.w400, fontSize: 12.sp);
  final _dishTilePriceTextStyle =
      TextStyle(height: 1.3, fontWeight: FontWeight.w700, fontSize: 13.sp);
  final _dishTilePriceUnit = "원";

  ShopDetailScreen({
    Key? key,
    required this.shop,
    this.onTapDish,
  }) : super(key: key);

  void initDishes() {
    for (Dish dish in shop.dishes) {
      if (dish.main == true) {
        mainDishList.add(dish);
      } else {
        sideDishList.add(dish);
      }
    }
  }

  void initText() {
    _titleContainerTitleText = shop.businessName.trim();
    _titleContainerSubtitleText = "5.0" +
        " ∙ " +
        getDong(shop.address) +
        " ∙ " +
        getDistance(shop.distance) +
        "KM";
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    initText();
    initDishes();

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleContainer(),
              _dishTitleTopMargin,
              _dishTitle(sideDishTitle),
              _dishTitleBottomMargin,
              _dishGridView(sideDishList),
              _sideDishGridViewMarginBottom,
              _divider(),
              _dishTitleTopMargin,
              _dishTitle(mainDishTitle),
              _dishTitleBottomMargin,
              _dishGridView(mainDishList),
              _mainDishGridViewMarginBottom,
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() => Container(
        color: Color(0xFFBBBBBB),
        width: _dividerWidth,
        height: 1,
      );

  Widget _dishTitle(text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: _dishTitleFontSize, fontFamily: _dishTitleFontFamily),
    );
  }

  Widget titleContainer() {
    return Container(
      width: _titleContainerWidth,
      height: _titleContainerHeight,
      margin: _titleContainerTopMargin,
      child: CustomPaint(
        painter: PentagonPainter(),
        child: Container(
          padding: _titleContainerInnerPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _titleBlock(),
              _titleContainerTitleSubtitleGap,
              _subtitleBlock(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleBlock() {
    return SizedBox(
      width: _titleContainerTitleMaxWidth,
      child: AutoSizeText(
        _titleContainerTitleText,
        maxLines: 1,
        style: TextStyle(
          fontSize: _titleContainerTitleFontSize,
          fontFamily: _titleContainerTitleFontFamily,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _subtitleBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _subtitleStarIcon(),
        _subtitleText(),
      ],
    );
  }

  Widget _subtitleStarIcon() {
    return Container(
      margin: _titleContainerStarMargin,
      child: SvgPicture.asset(
        _titleContainerStarAsset,
        color: mainColor,
        width: _titleContainerStarWidth,
        height: _titleContainerStarHeight,
      ),
    );
  }

  Widget _subtitleText() {
    return Text(
      _titleContainerSubtitleText,
      style: TextStyle(
        fontSize: _titleContainerSubtitleFontSize,
        fontWeight: _titleContainerSubtitleFontFamily,
      ),
    );
  }

  Widget _dishGridView(List<Dish> dishList) {
    return Container(
      margin: _dishGridViewSideMargin,
      child: GridView.builder(
        itemCount: dishList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _dishGridviewRowCount,
          mainAxisSpacing: _dishGridViewHeightMargin,
          crossAxisSpacing: _dishGridViewWidthMargin,
          childAspectRatio: _dishGridViewChildRatio,
        ),
        itemBuilder: (BuildContext context, int index) {
          Dish dish = dishList[index];
          return _dishTile(dish);
        },
      ),
    );
  }

  Widget _dishTile(Dish dish) {
    return SizedBox(
      width: _dishTileWidth,
      height: _dishTileHeight,
      child: InkWell(
        onTap: () {
          _onTapDish(dish);
        },
        child: _dishTileBody(dish),
      ),
    );
  }

  Widget _dishTileBody(Dish dish) {
    final String _dishName = dish.title.trim();
    final String _dishPrice = dish.price.toString() + _dishTilePriceUnit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dishTileThumbnail(dish),
        _dishTileContents(_dishName, _dishPrice),
      ],
    );
  }

  Widget _dishTileThumbnail(Dish dish) {
    return ClipRRect(
      borderRadius: _dishTileThumbnailRadius,
      child: CachedNetworkImage(
        width: _dishTileThumbnailWidth,
        height: _dishTileThumbnailHeight,
        imageUrl: dish.imageUrl,
        fit: BoxFit.cover,
        fadeOutDuration: Duration(seconds: 0),
        fadeInDuration: Duration(seconds: 0),
      ),
    );
  }

  Column _dishTileContents(String _dishName, String _dishPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _dishTileText(_dishName, _dishTileNameTextStyle),
        _dishTileText(_dishPrice, _dishTilePriceTextStyle),
      ],
    );
  }

  Widget _dishTileText(_text, _textStyle) {
    return Container(
      height: 19.h,
      alignment: Alignment.bottomCenter,
      child: AutoSizeText(
        _text,
        textAlign: TextAlign.center,
        style: _textStyle,
      ),
    );
  }

  void _onTapDish(Dish dish) {
    if (onTapDish == null) {
      Navigator.push(
        _context,
        MaterialPageRoute(builder: (context) => DishDetailScreen(dish: dish)),
      );
    } else {
      onTapDish!(dish);
    }
  }
}
