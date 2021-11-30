import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//void main() => runApp(const subsc);

class ApplySubscribeSettings extends StatefulWidget {
  const ApplySubscribeSettings({Key? key}) : super(key: key);

  @override
  _ApplySubscribeSettingsState createState() => _ApplySubscribeSettingsState();
}

class _ApplySubscribeSettingsState extends State<ApplySubscribeSettings> {
  final name = "성수";
  double cardHeight = 128.h;
  final outlinedButtonStyle = OutlinedButton.styleFrom(
      primary: Color(0xffAAAAAA),
      padding: EdgeInsets.fromLTRB(38.w, 0, 38.w, 0),
      splashFactory: NoSplash.splashFactory,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("정기배송 구독 신청서"),
        // leading: CupertinoNavigationBarBackButton(
        //     onPressed: () => Navigator.of(context).pop())
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(24, 32, 24, 0),
          child: Column(
            children: [
              _titleText(name),
              SizedBox(
                height: 32.h,
              ),
              Card(
                shadowColor: Color(0x55aaaaaa),
                elevation: 10,
                child: Container(
                  width: 1000,
                  padding: EdgeInsets.fromLTRB(22.w, 20.h, 22.w, 20.h),
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(
                        "Q1. 원하는 정기배송 유형을 선택해주세요!",
                        maxLines: 1,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Text(
                        "이거 텍스트 수정 => 피그마 댓글 어케달지 모르니 그냥 이렇게 함",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 10.sp, color: Color(0xff868686)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          OutlinedButton(
                              style: outlinedButtonStyle,
                              onPressed: () {},
                              child: Text("직접 선택")),
                          SizedBox(
                            width: 12.w,
                          ),
                          OutlinedButton(
                              style: outlinedButtonStyle,
                              onPressed: () {},
                              child: Text("랜덤 추천")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleText(String name) {
    return Container(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: name,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontFamily: "Godo",
              fontWeight: FontWeight.bold,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: "님에게 딱맞는 반찬을 배송하기 위해\n몇가지 물어볼거에요!",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
      ),
    );
  }
}
