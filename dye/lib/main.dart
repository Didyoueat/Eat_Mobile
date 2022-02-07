import 'package:dye/models/shop.dart';
import 'package:dye/screens/subscribe_apply/apply_subscribe_settings_screen.dart';
import 'package:dye/screens/subscribe_apply/subscribtion_payment_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!);
        },
        theme: ThemeData(
          fontFamily: "Noto_Sans_KR",
          primarySwatch: Colors.blue,
          primaryColor: Color(0xffff5439),
        ),
        // home: const ApplySubscribeSettings(),
        home: ApplySubscribeSettings(),
      ),
    );
  }
}
