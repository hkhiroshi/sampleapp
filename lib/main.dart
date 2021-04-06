import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/presentation/main/main_model.dart';
import 'package:sample_app/presentation/book_list/book_list_page.dart';
import 'package:sample_app/presentation/signup/signup_page.dart';
import 'package:sample_app/presentation/login/login_page.dart';
import 'package:sample_app/presentation/ui/ui_sample_page.dart';
import 'package:firebase_core/firebase_core.dart';

/*
 * Main関数
 * Firebase.initializeApp() を main() の先頭で初期化する方法
 * 参考:
 *   【Flutter】No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()の対処法
 *   https://qiita.com/mamoru_takami/items/87a20d861806a70db29d
 */
Future<void> main() async {
  // runApp()の前にプラグインの初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
                  '見放題です',
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
          body: Consumer<MainModel>(
            builder: (context, model, child) {
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookListPage()),
                        );
                        model.changeText();
                      },
                      child: Text('本一覧'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                        //model.changeText();
                      },
                      child: Text('新規登録'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        //model.changeText();
                      },
                      child: Text('ログイン'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UISamplePage()),
                        );
                        //model.changeText();
                      },
                      child: Text('UIサンプル'),
                    ),
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
