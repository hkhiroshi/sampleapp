import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/main_model.dart';

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
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
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
            body: Consumer<MainModel>(builder: (context, model, child) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        model.txt,
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          model.changeText();
                        },
                        child: Text('ボタン'),
                      )
                    ],
                  ),
                );
              },
            ),
            ),
      ),
    );
  }
}
