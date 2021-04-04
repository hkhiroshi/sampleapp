import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/presentation/add_book/add_book_page.dart';
import 'package:sample_app/presentation/add_book/add_book_model.dart';
import 'package:sample_app/domain/Book.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = book != null;
    final textEditingController = TextEditingController();

    textEditingController.text = isUpdate ? book.title : '';

    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel()..addBookTitle(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(isUpdate ? '本を編集' : '本を追加'),
            ),
            body: Consumer<AddBookModel>(builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 160,
                      child: InkWell(
                        child: model.imageFile != null
                            ? Image.file(model.imageFile)
                            : Container(
                                color: Colors.grey,
                              ),
                        onTap: () async {
                          await model.showImagePicker();
                        },
                      ),
                    ),
                    TextField(
                      controller: textEditingController,
                      onChanged: (text) {
                        model.bookTitle = text;
                      },
                    ),
                    TextButton(
                      onPressed: () async {
                        model.startLoading();
                        if (isUpdate) {
                          await updateBook(model, context);
                        } else {
                          await addBook(model, context);
                        }
                        model.endLoading();
                      },
                      child: Text(
                        isUpdate ? '更新する' : '追加する',
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Consumer<AddBookModel>(builder: (context, model, child) {
            return model.isLoading
                ? Container(
                    color: Colors.grey.withOpacity(0.7),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox();
          })
        ],
      ),
    );
  }

  Future addBook(AddBookModel model, BuildContext context) async {
    try {
      await model.addBookTitle();
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('保存する'),
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
      Navigator.of(context).pop();
    } catch (e) {
      return showDialog<void>(
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
  }

  Future updateBook(AddBookModel model, BuildContext context) async {
    try {
      await model.updateBook(book);
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('更新する'),
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
      Navigator.of(context).pop();
    } catch (e) {
      return showDialog<void>(
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
  }
}
