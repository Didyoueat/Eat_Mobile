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
  final List<bool> selectSortButton = [false, false, false];
  final List<String> titleSortButton = ["평점순", "거리순", "단골집"];
  bool isLoading = true;

  //TODO
  Future<void> fetchLoading() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  void initState() {
    selectSortButton[0] = true;
    super.initState();
    fetchLoading();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return ListView.separated(
      itemCount: widget.list.length + 1,
      cacheExtent: 100,
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
      itemBuilder: (BuildContext context, int position) {
        final tileWidth = 335.w;
        final tileHeight = 243.h;

        if (widget.isInSubscribe && position == 0) {
          return Container(
            margin: EdgeInsets.only(top: 29.h),
            alignment: Alignment.center,
            child: EasyRichText(
              "우리동네 반찬가게에요!\n끌리는 반찬가게에 들어가보세요.",
              defaultStyle: TextStyle(
                  fontSize: 18.sp, color: Colors.black, fontFamily: "Godo"),
              textAlign: TextAlign.center,
            ),
          );
        }
        position--;

        if (position == 0) {
          return Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: _getListHeader());
        }
        position--;

        return listTile(position, tileWidth, tileHeight);
      },
    );
  }

  Widget listTile(int position, double tileWidth, double tileHeight) {
    if (!isLoading) {
      return Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        child: InkWell(
          onTap: () => widget.onTapTile(widget.list[position]),
          child: SizedBox(
            width: tileWidth,
            height: tileHeight,
            child: getTile(position),
          ),
        ),
      );
    } else {
      return ShopListTileSkeleton();
    }
  }

  Widget _getListHeader() {
    return Container(
      height: 28.h,
      padding: EdgeInsets.only(left: 4.w, right: 4.w),
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

  Widget getTile(int position) {
    return ShopListTile(
      title:
          position == 0 ? "동찬이네" : widget.list[position].businessName ?? "동찬이네",
      address: getDong(widget.list[position].address) ?? "신림동",
      distance: getDistance(widget.list[position].distance!)!,
      like: true,
      urlThumbNail1: widget.list[position].dishes[0].imageUrl.toString(),
      urlThumbNail2: widget.list[position].dishes[1].imageUrl.toString(),
      urlThumbNail3: widget.list[position].dishes[2].imageUrl.toString(),
    );
  }

  Widget sortButtonList() {
    List<Widget> list = [];

    for (int i = 0; i < 3; i++) {
      var colorChecker = selectSortButton[i];
      list.add(
        InkWell(
          onTap: () {
            for (int k = 0; k < selectSortButton.length; k++) {
              selectSortButton[k] = false;
            }
            selectSortButton[i] = true;
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
            padding: EdgeInsets.fromLTRB(8.w, 5.h, 8.w, 5.h),
            margin: i == 1 ? EdgeInsets.only(left: 4.w, right: 4.w) : null,
            decoration: BoxDecoration(
              border:
                  Border.all(color: colorChecker ? mainColor : textColorGray),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              titleSortButton[i],
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.0,
                fontSize: 12.sp,
                color: colorChecker ? mainColor : textColorGray,
              ),
            ),
          ),
        ),
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
  }

  Widget locationButton() {
    return InkWell(
      onTap: widget.onPressLocationButton,
      child: Container(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/location.svg",
              width: 16.w,
              height: 16.h,
              color: Colors.white,
              alignment: Alignment.center,
            ),
            Text(
              widget.nowLocation,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.1,
                fontSize: 13.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
