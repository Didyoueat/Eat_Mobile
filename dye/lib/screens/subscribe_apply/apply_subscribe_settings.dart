import 'package:dye/widgets/bottom_complete_button.dart';
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
  final textColorGray = 0xffaaaaaa;
  final borderColorGray = 0x55aaaaaa;
  final mainColor = 0xffff5439;

  bool q1Selection = false;
  var outlinedButtonStyle1 = OutlinedButton.styleFrom();

  _ApplySubscribeSettingsState() {
    changeQ1ButtonStatus();
  }

  void changeQ1ButtonStatus() {
    outlinedButtonStyle1 = OutlinedButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      primary: q1Selection ? Color(mainColor) : Color(textColorGray),
      padding: EdgeInsets.fromLTRB(38.w, 0, 38.w, 0),
      splashFactory: NoSplash.splashFactory,
      side: BorderSide(
          color: q1Selection ? Color(mainColor) : Color(textColorGray),
          width: 1,
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeQ1ButtonStatus();

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("정기배송 구독 신청서"),
        // leading: CupertinoNavigationBarBackButton(
        //     onPressed: () => Navigator.of(context).pop())
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                children: [
                  _titleText(name),
                  SizedBox(
                    height: 32.h,
                  ),
                  _questionCard(_question1()),
                  SizedBox(height: 28.h),
                  _questionCard(_question2()),
                  SizedBox(height: 28.h),
                  _questionCard(_noticeCard(), 0xfffff6E4),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 1000.w,
                  height: 98.h,
                  alignment: Alignment.topCenter,
                  child:
                      bottomCompleteButton("이제 반찬을 골라볼까요?", () {}, mainColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _question1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Q1. 원하는 ",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: "정기배송 유형",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "을 선택해주세요!",
              )
            ],
          ),
        ),
        Text(
          "이거 텍스트 수정 => 피그마 댓글 어케달지 모르니 그냥 이렇게 함",
          maxLines: 1,
          style: TextStyle(fontSize: 10.sp, color: Color(0xff868686)),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                style: outlinedButtonStyle1,
                onPressed: () {
                  setState(() {
                    if (!q1Selection) {
                      q1Selection = true;
                    }
                  });
                },
                child: Text("직접 선택")),
            SizedBox(
              width: 12.w,
            ),
            OutlinedButton(
                style: outlinedButtonStyle1,
                onPressed: () {},
                child: Text("랜덤 추천")),
          ],
        ),
      ],
    );
  }

  Widget _question2() {
    return Container(
      margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Q2. 배송을 원하는 ",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: "요일",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "을 선택해주세요!",
                )
              ],
            ),
          ),
          Text(
            "(원하는 요일을 모두 선택해주세요)",
            maxLines: 1,
            style: TextStyle(fontSize: 10.sp, color: Color(0xff868686)),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _weekWidget("월"),
              SizedBox(width: 8.w),
              _weekWidget("화"),
              SizedBox(width: 8.w),
              _weekWidget("수"),
              SizedBox(width: 8.w),
              _weekWidget("목"),
              SizedBox(width: 8.w),
              _weekWidget("금"),
              SizedBox(width: 8.w),
              _weekWidget("토"),
              SizedBox(width: 8.w),
              _weekWidget("일"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weekWidget(String week) {
    double circleSize = 36.w;

    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: 36, maxWidth: 45, minHeight: 36, maxHeight: 45),
      child: Container(
        width: circleSize,
        height: circleSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Color(borderColorGray), width: 1.sp),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            week,
            style: TextStyle(color: Color(textColorGray)),
          ),
        ),
      ),
    );
  }

  Widget _noticeCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: name,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: "님이 구독하신 반찬은",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "2021년 11월 29일 월요일 ",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Color(mainColor),
            ),
            children: const <TextSpan>[
              TextSpan(
                text: "부터",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "매주 ",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: "월, 수, 금",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "에 배송 예정입니다!",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _questionCard(Widget question, [var cardColor = 0xffffffff]) {
    double cardHeight = 128.h;

    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0.sp)),
      shadowColor: Color(0x33aaaaaa),
      color: Color(cardColor),
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        width: 1000,
        height: cardHeight,
        child: question,
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
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
