import 'package:dye/widgets/circle_button.dart';

import 'package:dye/widgets/bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dye/constants/colors.dart';

//void main() => runApp(const subsc);

class ApplySubscribeSettings extends StatefulWidget {
  const ApplySubscribeSettings({Key? key}) : super(key: key);

  @override
  _ApplySubscribeSettingsState createState() => _ApplySubscribeSettingsState();
}

class _ApplySubscribeSettingsState extends State<ApplySubscribeSettings> {
  final name = "성수";
  final List<bool> _q1Selection = [false, false];
  final List<bool> _q2Selection = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final List<String> _weekName = ["월", "화", "수", "목", "금", "토", "일"];

  @override
  Widget build(BuildContext context) {
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
                  child: BottomButton(
                    "이제 반찬을 골라볼까요?",
                    true,
                    () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle getQ1ButtonStatus(int position) {
    return OutlinedButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      primary: _q1Selection[position] ? Color(mainColor) : Color(textColorGray),
      padding: EdgeInsets.fromLTRB(38.w, 0, 38.w, 0),
      splashFactory: NoSplash.splashFactory,
      side: BorderSide(
          color:
              _q1Selection[position] ? Color(mainColor) : Color(textColorGray),
          width: 1,
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  void setQ2ButtonStatus(int position) {
    setState(() {
      _q2Selection[position] = !_q2Selection[position];
    });
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
              style: getQ1ButtonStatus(0),
              onPressed: () {
                if (!_q1Selection[0]) {
                  _q1Selection[0] = true;
                  setState(() {});
                }
              },
              child: Text("직접 선택"),
            ),
            SizedBox(
              width: 12.w,
            ),
            OutlinedButton(
                style: getQ1ButtonStatus(1),
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('랜덤 추천 서비스는 추후 제공됩니다!'),
                    duration: Duration(milliseconds: 700),
                  ));
                },
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
          getWeekButton(),
        ],
      ),
    );
  }

  Row getWeekButton() {
    final circleWidth = 36.w;
    final circleHeight = 36.h;
    final padding = 8.w;
    final List<Widget> list = [];

    for (int i = 0; i < 7; i++) {
      list.add(CircleButton(
        onTap: () => setQ2ButtonStatus(i),
        width: circleWidth,
        height: circleHeight,
        borderColor: _q2Selection[i] ? Color(mainColor) : null,
        child: Text(
          _weekName[i],
          style: TextStyle(
              color: _q2Selection[i] ? Color(mainColor) : Color(textColorGray)),
        ),
      ));
      if (i != 6) list.add(SizedBox(width: padding));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
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
