import 'package:cached_network_image/cached_network_image.dart';
import 'package:dye/widgets/shop_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  _ShopListScreenState createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  // late Image myImage;
  late CachedNetworkImageProvider theImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // precacheImage(myImage.image, context);

    // theImage = CachedNetworkImageProvider(
    //     "https://postfiles.pstatic.net/MjAyMTEyMDdfMjYz/MDAxNjM4ODAzMDUzNjQ2.VaKUblEZy9KQCaBNkkFSKveZji_EbtN7tvDE4djMjwcg.LfaQSbsCHnVntF_XFi0xwhrInAFVZbmYMHURYiXu12Mg.JPEG.singj1963/%EB%A9%94%EB%B0%80%EC%A0%84%EB%B3%91.jpg?type=w773");
    // await precacheImage(theImage, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ShopListTile(
          title: "동찬이네",
          address: "신림동",
          distance: "0.5",
          urlThumbNail1:
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMjYz/MDAxNjM4ODAzMDUzNjQ2.VaKUblEZy9KQCaBNkkFSKveZji_EbtN7tvDE4djMjwcg.LfaQSbsCHnVntF_XFi0xwhrInAFVZbmYMHURYiXu12Mg.JPEG.singj1963/%EB%A9%94%EB%B0%80%EC%A0%84%EB%B3%91.jpg?type=w773",
          urlThumbNail2:
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTYg/MDAxNjM4ODAzMDUzNDg3.BMiG8SFjIh98yT-oEqnalzFwjIIeh5UMXF14E6os6cIg.p3lkvZ_vf_S7CnxX5MlDQeA7ohiJbc8CFkhfwMbYkesg.PNG.singj1963/%EC%98%A4%EC%9D%B4%EC%86%8C%EB%B0%95%EC%9D%B4.png?type=w773",
          urlThumbNail3:
              "https://postfiles.pstatic.net/MjAyMTEyMDdfMTgx/MDAxNjM4ODAzMDUzNTU2.rlNvZTIDppDkvlDQDE1C1FhZz-x12ciuf6DS7w7HYaMg.QN82fGrldvzV95kGytJrKbzZ8ibMJLDG8f5MA6yewSYg.PNG.singj1963/%EB%AC%B4%EB%A7%90%EB%9E%AD%EC%9D%B4.png?type=w773",
          star: "1.0",
          like: false,
        ),
      ),
    );
  }
}
