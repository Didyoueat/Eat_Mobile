import 'package:flutter/material.dart';

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  _ShopListScreenState createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  // late Image myImage;
  // late CachedNetworkImageProvider theImage;

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
      body: SafeArea(child: Container()),
    );
  }
}
