import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/article_input.dart';
import 'package:my_flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BasePage(
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
                child: ArticleInput(controller: titleController),
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
            controller: detailController,
            hintText: 'ここに内容を入れてください',
            isMultiLine: true,
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
              onPressed: () {
                saveFormData(titleController.text, detailController.text);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                  foregroundColor: Colors.pink),
              child: Text(
                '作成する',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void saveFormData(String textFieldValue1, String textFieldValue2) async {
  final DateTime now = DateTime.now();
  final String timestamp = now.toIso8601String(); // ISO8601形式の日時文字列

  Random random = Random();
  int randomNumber = random.nextInt(90000000) + 10000000;
  String id = randomNumber.toString();
  // JSON形式の文字列として保存
  String dataToSave =
      '{"id": "$id","title": "$textFieldValue1", "detail": "$textFieldValue2", "date": "$timestamp"}';
  _saveData('data_$timestamp', dataToSave); // キーにタイムスタンプを使う
}

void _saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}
