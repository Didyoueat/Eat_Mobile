import 'package:dye/screens/shop_list_screen.dart';
import 'package:dye/screens/subscribe_apply/subscribe_shop_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

import 'package:dye/constants/colors.dart';
import 'package:dye/widgets/circle_button.dart';
import 'package:dye/widgets/bottom_button_fill.dart';
import 'package:dye/widgets/raise_card.dart';

class ApplySubscribeSettings extends StatefulWidget {
  const ApplySubscribeSettings({Key? key}) : super(key: key);

  final name = "성수";

  @override
  _ApplySubscribeSettingsState createState() => _ApplySubscribeSettingsState();
}

class _ApplySubscribeSettingsState extends State<ApplySubscribeSettings> {
  final String _screenTitle;
  _ApplySubscribeSettingsState() : _screenTitle = "정기배송 구독 신청서";

  static const selfButtonIndex = 0;
  static const randomButtonIndex = 1;

  final List<bool> _subscribeTypeOption = [];
  final List<bool> _daysOption = [];
  final List<String> _weekName = ["월", "화", "수", "목", "금", "토", "일"];
  bool _q2Visible = false;
  bool _notiVisible = false;

  late final _contentsTitle;

  final _contentsMargin = EdgeInsets.fromLTRB(24, 32, 24, 0);
  final _questionTopMargin = SizedBox(height: 32.h);
  final _questionGapMargin = SizedBox(height: 28.h);
  final _bottomButtonText = "이제 반찬을 골라볼까요?";
  final _questionTitleStyle = TextStyle(fontSize: 16.sp, color: Colors.black);
  final _questionSubTitleStyle =
      TextStyle(fontSize: 10.sp, color: Color(0xff868686));
  final _marginBetweenTitleContents = SizedBox(height: 12.h);

  final _subscribeTypeTitle = "Q1. 원하는 정기배송 유형을 선택해주세요!";
  final _subscribeTypeTitleBoldTarget = "정기배송 유형";
  final _subscribeTypeSubTitle = "이거 텍스트 수정 => 피그마 댓글 어케달지 모르니 그냥 이렇게 함";
  final _subscribeTypeSelfButtonString = "직접 선택";
  final _subscribeTypeRandomButtonString = "랜덤 추천";
  final _subscribeTypeButtonInnerPadding =
      EdgeInsets.fromLTRB(38.w, 0, 38.w, 0);
  final _subscribeTypeButtonRadius = BorderRadius.circular(30.0);
  final _daySelectionTitle = "Q2. 배송을 원하는 요일을 선택해주세요!";
  final _daySelectionTitleBoldTarget = "요일";
  final _daySelectionsSubTitle = "(원하는 요일을 모두 선택해주세요)";

  final _dayButtonWidth = 36.w;
  final _dayButtonHeight = 36.h;
  final _dayButtonSideMargin = EdgeInsets.only(left: 14.w, right: 14.w);

  late final _noticeCardText;
  final _noticeCardTextStyle = TextStyle(fontSize: 16.sp, color: Colors.black);

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    if (!_q2Visible) _q2Visible = true;
    if (_daysOption.contains(true)) {
      _notiVisible = true;
    } else {
      _notiVisible = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _contentsTitle = "${widget.name}님에게 딱맞는 반찬을 배송하기 위해\n몇가지 물어볼거에요!";
    _noticeCardText =
        "${widget.name}님이 구독하신 반찬은\n2021년 11월 29일 월요일 부터\n매주 월, 목, 금, 일에 배송 예정입니다!";
    for (int i = 0; i < 2; i++) {
      _subscribeTypeOption.add(false);
    }
    for (int i = 0; i < 7; i++) {
      _daysOption.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(_screenTitle),
        // leading: CupertinoNavigationBarBackButton(
        //     onPressed: () => Navigator.of(context).pop())
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: _contentsMargin,
          child: Column(
            children: [
              _titleText(widget.name),
              _questionTopMargin,
              _visibility(child: _subscribeTypeCard(), visible: true),
              _questionGapMargin,
              _visibility(child: _daySelectionCard(), visible: _q2Visible),
              _questionGapMargin,
              _visibility(child: _noticeCard(), visible: _notiVisible),
            ],
          ),
        ),
        _visibility(
          visible: _notiVisible,
          child: BottomButtonFill(
            mainMessage: _bottomButtonText,
            function: _onTapBottomButton,
          ),
        ),
      ],
    );
  }

  Widget _titleText(String name) {
    return Container(
      alignment: Alignment.center,
      child: EasyRichText(
        _contentsTitle,
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

  Widget _visibility({required child, required visible}) {
    return Visibility(
      child: child,
      maintainState: true,
      maintainSize: true,
      maintainAnimation: true,
      visible: visible,
    );
  }

  //TODO : 페이지 호출 변경
  void _onTapBottomButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubscribeShopListScreen(
          latitude: 37.55500,
          longitude: 126.97130,
          weekSelection: _daysOption,
        ),
      ),
    );
    // MaterialPageRoute(builder: (context) => SelectDishScreen()));
    // MaterialPageRoute(
    //     builder: (context) => ShopListScreen(
    //           latitude: 37.55500,
    //           longitude: 126.97130,
    //         )));
  }

  Widget _subscribeTypeCard() {
    return RaiseCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EasyRichText(
            _subscribeTypeTitle,
            defaultStyle: _questionTitleStyle,
            textAlign: TextAlign.center,
            patternList: [
              EasyRichTextPattern(
                targetString: _subscribeTypeTitleBoldTarget,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            _subscribeTypeSubTitle,
            maxLines: 1,
            style: _questionSubTitleStyle,
          ),
          _marginBetweenTitleContents,
          _subscribeTypeContents(),
        ],
      ),
    );
  }

  Widget _subscribeTypeContents() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlinedButton(
          style: _subscribeButtonStyle(selfButtonIndex),
          onPressed: _onTapSelfButton,
          child: Text(_subscribeTypeSelfButtonString),
        ),
        SizedBox(width: 12.w),
        OutlinedButton(
            style: _subscribeButtonStyle(randomButtonIndex),
            onPressed: _onTapRandomButton,
            child: Text(_subscribeTypeRandomButtonString)),
      ],
    );
  }

  void _onTapSelfButton() {
    if (!_subscribeTypeOption[selfButtonIndex]) {
      _subscribeTypeOption[selfButtonIndex] = true;
      setState(() {});
    }
  }

  void _onTapRandomButton() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('랜덤 추천 서비스는 추후 제공됩니다!'),
      duration: Duration(milliseconds: 700),
    ));
  }

  ButtonStyle _subscribeButtonStyle(int position) {
    return OutlinedButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      primary: _subscribeTypeOption[position] ? mainColor : textColorGray,
      padding: _subscribeTypeButtonInnerPadding,
      splashFactory: NoSplash.splashFactory,
      side: BorderSide(
          color: _subscribeTypeOption[position] ? mainColor : borderColorGray,
          width: 1,
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: _subscribeTypeButtonRadius,
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////

  Widget _daySelectionCard() {
    return RaiseCard(
      child: Container(
        margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EasyRichText(
              _daySelectionTitle,
              defaultStyle: _questionTitleStyle,
              textAlign: TextAlign.center,
              patternList: [
                EasyRichTextPattern(
                    targetString: _daySelectionTitleBoldTarget,
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            Text(
              _daySelectionsSubTitle,
              maxLines: 1,
              style: _questionSubTitleStyle,
            ),
            _marginBetweenTitleContents,
            _daySelectionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _daySelectionButtons() {
    final List<Widget> list = [];

    for (int i = 0; i < 7; i++) {
      list.add(
        CircleButton(
          onTap: () => _onTapWeekButton(i),
          width: _dayButtonWidth,
          height: _dayButtonHeight,
          borderColor: _daysOption[i] ? mainColor : null,
          child: Text(
            _weekName[i],
            style: TextStyle(color: _daysOption[i] ? mainColor : textColorGray),
          ),
        ),
      );
    }
    return Container(
      margin: _dayButtonSideMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list,
      ),
    );
  }

  void _onTapWeekButton(int position) {
    setState(() {
      _daysOption[position] = !_daysOption[position];
    });
  }

  ///////////////////////////////////////////////////////////////////////////

  Widget _noticeCard() {
    return RaiseCard(
      cardColor: colorBeige,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EasyRichText(
            _noticeCardText,
            defaultStyle: _noticeCardTextStyle,
            textAlign: TextAlign.center,
            patternList: [
              EasyRichTextPattern(
                  targetString: widget.name,
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
      ),
    );
  }
}
