import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/presentation/ui/ui_sample_model.dart';

class UISamplePage extends StatelessWidget {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UISampleModel>(
      create: (_) => UISampleModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('UIサンプル'),
        ),
        body: Column(children: [
          Checkbox(
            activeColor: Colors.blue,
            value: false,
          ),
          Checkbox(
            activeColor: Colors.blue,
            value: true,
          ),
          Radio(
            activeColor: Colors.blue,
            value: 'thumb_up',
            groupValue: true,
          ),
          Radio(
            activeColor: Colors.orange,
            value: 'favorite',
            groupValue: true,
          ),
          TestPage(),
          MyApp(),
        ]),
      ),
    );
  }
}

/*
 * 【Flutter入門】Radio（ラジオボタン）の使い方
 *  https://www.yururiwork.net/%E3%80%90flutter%E5%85%A5%E9%96%80%E3%80%91radio%EF%BC%88%E3%83%A9%E3%82%B8%E3%82%AA%E3%83%9C%E3%82%BF%E3%83%B3%EF%BC%89%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9/
 */
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String _payment = '未選択';

  void _handleRadioButton(String payment) => setState(() {
        _payment = payment;
      });

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'お支払い方法：' + _payment,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.blueAccent,
                value: 'クレジットカード',
                groupValue: _payment,
                onChanged: _handleRadioButton,
              ),
              Text('クレジットカード'),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.blueAccent,
                value: '銀行振込',
                groupValue: _payment,
                onChanged: _handleRadioButton,
              ),
              Text('銀行振込'),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                activeColor: Colors.blueAccent,
                value: '代引き',
                groupValue: _payment,
                onChanged: _handleRadioButton,
              ),
              Text('代引き'),
            ],
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            print(isSwitched);
          });
        },
        activeTrackColor: Colors.yellow,
        activeColor: Colors.orangeAccent,
      ),
    ));
  }
}
