import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/article_list_card.dart';
import 'package:my_flutter_app/main.dart';

class Article {
  final String imagePath;
  final String title;
  final String detail;
  final String date;

  Article(
      {required this.imagePath,
      required this.title,
      required this.detail,
      required this.date});
}

class TopPage extends StatefulWidget {
  final List<Article> articles = [
    Article(
        imagePath: 'image/150_150.png',
        title: 'ブログタイトル1つ目',
        detail:
            'ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要',
        date: '2023/12/1'),
    Article(
        imagePath: 'image/150_150.png',
        title: 'ブログタイトル1つ目',
        detail:
            'ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要',
        date: '2023/12/1'),
  ];

  TopPage({super.key});

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

              List<Widget> cards = <Widget>[
                for (var article in widget.articles)
                  SizedBox(
                    width: width,
                    child: ArticleListCard(
                      imagePath: article.imagePath,
                      title: article.title,
                      detail: article.detail,
                      date: article.date,
                    ),
                  ),
              ];

              return Center(
                child: Column(
                  children: cards,
                ),
              );
            },
          ),
          // ここまで変更
        ],
      ),
    );
  }
}
