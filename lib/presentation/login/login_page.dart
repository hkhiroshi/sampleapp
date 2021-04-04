import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/presentation/login/login_model.dart';

import 'package:sample_app/domain/Book.dart';

class LoginPage extends StatelessWidget {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ログイン'),
        ),
        body: Consumer<LoginModel>(builder: (context, model, child) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'example@example.com',
                  ),
                  controller: mailController,
                  onChanged: (text) {
                    model.mail = text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'パスワード',
                  ),
                  obscureText: true,
                  controller: passwordController,
                  onChanged: (text) {
                    model.password = text;
                  },
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      await model.login();
                    } catch (e) {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(e.toString()),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'ログインする',
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
