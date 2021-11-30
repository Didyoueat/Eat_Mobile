import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void main() => runApp(const subsc);

class ApplySubscribeSettings extends StatefulWidget {
  const ApplySubscribeSettings({Key? key}) : super(key: key);

  @override
  _ApplySubscribeSettingsState createState() => _ApplySubscribeSettingsState();
}

class _ApplySubscribeSettingsState extends State<ApplySubscribeSettings> {
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
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text("t"),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Text(
                    "3",
                    style: TextStyle(fontFamily: "Godo"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
