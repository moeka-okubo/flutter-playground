import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/article_input.dart';
import 'package:my_flutter_app/main.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: '新規作成',
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  'ブログタイトル',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ArticleInput(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              '内容',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ArticleInput(
            hintText: 'ここに内容を入れてください',
            isMultiLine: true,
          ),
        ],
      ),
    );
  }
}
