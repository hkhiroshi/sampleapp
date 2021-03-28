import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          //brightness:Brightness.dark,
          buttonColor: Colors.grey,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('PrimeVideo'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Text(
                  '見放題',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.toggle_on),
                  onPressed: () {
                    print("Clickされました");
                  },
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(10.0)),
              Center(
                child: TextButton(
                  child: Text('ButtonA'),
                  onPressed: () {
                    print('ButtonA');
                  },
                  style: TextButton.styleFrom(
                    //alignment: Alignment(10, 20),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                    child: const Text('ButtonB'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      print('ButtonB');
                    },
                ),
              ),
              Center(
                child: OutlinedButton(
                  child: const Text('ButtonC'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    print('ButtonC');
                  },
                ),
              ),
              Center(
                child: IconButton(
                  icon: const Icon(Icons.insert_emoticon),
                  iconSize: 100.0,
                  color: Colors.red,
                  onPressed: () {
                    print('アイコンボタンクリックです');
                  },
                ),
              ),
              Center(
                child: FloatingActionButton(
                  child: Icon(Icons.android),
                  backgroundColor: Color.fromARGB(255, 255, 150, 150),
                  onPressed: () {
                    print('アイコンボタンクリック');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
