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
    Article(
        imagePath: 'image/150_150.png',
        title: 'ブログタイトル1つ目',
        detail:
            'ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要',
        date: '2023/12/1'),
  ];

  final double cardSpacingHorizontal = 16;

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
          LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth / widget.articles.length;
              double test = (200 * widget.articles.length) +
                  (widget.cardSpacingHorizontal * (widget.articles.length - 1));
              width = width < 200 ? 200 : width;

              double cardWidth = test <= constraints.maxWidth
                  ? 200 + (constraints.maxWidth - test) / widget.articles.length
                  : (width < 200 ? 200 : width);

              List<Widget> cards = <Widget>[
                for (var article in widget.articles)
                  SizedBox(
                    width: cardWidth,
                    child: ArticleListCard(
                      imagePath: article.imagePath,
                      title: article.title,
                      detail: article.detail,
                      date: article.date,
                    ),
                  ),
              ];

              return Center(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: widget.cardSpacingHorizontal,
                  runSpacing: 8, // 行間の隙間を適宜調整
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
