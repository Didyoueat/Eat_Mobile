import 'package:dye/screens/shop_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

import 'package:dye/constants/colors.dart';
import 'package:dye/widgets/circle_button.dart';
import 'package:dye/widgets/bottom_button.dart';
import 'package:dye/widgets/raise_card.dart';

//void main() => runApp(const subsc);

class ApplySubscribeSettings extends StatefulWidget {
  const ApplySubscribeSettings({Key? key}) : super(key: key);

  @override
  _ApplySubscribeSettingsState createState() => _ApplySubscribeSettingsState();
}

class _ApplySubscribeSettingsState extends State<ApplySubscribeSettings> {
  final name = "성수";
  final List<bool> _q1Selection = [];
  final List<bool> _q2Selection = [];
  final List<String> _weekName = ["월", "화", "수", "목", "금", "토", "일"];
  bool _q2Visible = false;
  bool _notiVisible = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    if (!_q2Visible) _q2Visible = true;
    if (_q2Selection.contains(true)) {
      _notiVisible = true;
    } else {
      _notiVisible = false;
    }
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
      _q1Selection.add(false);
    }
    for (int i = 0; i < 7; i++) {
      _q2Selection.add(false);
    }
  }

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
                  widgetVisible(RaiseCard(_question1()), true),
                  SizedBox(height: 28.h),
                  widgetVisible(RaiseCard(_question2()), _q2Visible),
                  SizedBox(height: 28.h),
                  widgetVisible(RaiseCard(_noticeCard(), cardColor: colorBeige),
                      _notiVisible),
                ],
              ),
            ),
          ),
          widgetVisible(
              BottomButton(
                "이제 반찬을 골라볼까요?",
                true,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShopListScreen(
                              latitude: 37.55500,
                              longitude: 126.97130,
                            )),
                  );
                },
              ),
              _notiVisible),
        ],
      ),
    );
  }

  Widget widgetVisible(Widget _widget, bool _visible) {
    return Visibility(
      child: _widget,
      maintainState: true,
      maintainSize: true,
      maintainAnimation: true,
      visible: _visible,
    );
  }

  ButtonStyle getQ1ButtonStatus(int position) {
    return OutlinedButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      primary: _q1Selection[position] ? mainColor : textColorGray,
      padding: EdgeInsets.fromLTRB(38.w, 0, 38.w, 0),
      splashFactory: NoSplash.splashFactory,
      side: BorderSide(
          color: _q1Selection[position] ? mainColor : borderColorGray,
          width: 1,
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget _question1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        EasyRichText(
          "Q1. 원하는 정기배송 유형을 선택해주세요!",
          defaultStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
          textAlign: TextAlign.center,
          patternList: [
            EasyRichTextPattern(
                targetString: "정기배송 유형",
                style: TextStyle(fontWeight: FontWeight.bold))
          ],
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

  void setQ2ButtonStatus(int position) {
    setState(() {
      _q2Selection[position] = !_q2Selection[position];
    });
  }

  Widget _question2() {
    return Container(
      margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EasyRichText(
            "Q2. 배송을 원하는 요일을 선택해주세요!",
            defaultStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
            textAlign: TextAlign.center,
            patternList: [
              EasyRichTextPattern(
                  targetString: "요일",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
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

  Widget getWeekButton() {
    final circleWidth = 36.w;
    final circleHeight = 36.h;
    final padding = 8.w;
    final List<Widget> list = [];

    for (int i = 0; i < 7; i++) {
      list.add(CircleButton(
        onTap: () => setQ2ButtonStatus(i),
        width: circleWidth,
        height: circleHeight,
        borderColor: _q2Selection[i] ? mainColor : null,
        child: Text(
          _weekName[i],
          style: TextStyle(color: _q2Selection[i] ? mainColor : textColorGray),
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
        EasyRichText(
          "$name님이 구독하신 반찬은\n2021년 11월 29일 월요일 부터\n매주 월, 목, 금, 일에 배송 예정입니다!",
          defaultStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
          textAlign: TextAlign.center,
          patternList: [
            EasyRichTextPattern(
                targetString: name,
                style: TextStyle(fontWeight: FontWeight.bold)),
            EasyRichTextPattern(
              targetString: "2021년 11월 29일 월요일",
              style: TextStyle(fontWeight: FontWeight.bold, color: mainColor),
            ),
            EasyRichTextPattern(
              targetString: "월, 목, 금, 일",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }

  Widget _titleText(String name) {
    return Container(
      alignment: Alignment.center,
      child: EasyRichText(
        "$name님에게 딱맞는 반찬을 배송하기 위해\n몇가지 물어볼거에요!",
        defaultStyle:
            TextStyle(fontSize: 18.sp, color: Colors.black, fontFamily: "Godo"),
        textAlign: TextAlign.center,
        patternList: [
          EasyRichTextPattern(
            targetString: name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
