import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/article_list_card.dart';
import 'package:my_flutter_app/main.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'トップページ',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('こんな感じでテキスト追加できる'),
          LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth * 0.25; // 画面幅の25%

              return Center(
                child: SizedBox(
                  width: width,
                  child: const ArticleListCard(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
