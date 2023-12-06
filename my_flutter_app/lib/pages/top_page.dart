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
  final double cardSpacingHorizontal = 16;

  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  late List<Article> articles;

  @override
  void initState() {
    super.initState();
    articles = generateArticles(5);
  }

  List<Article> generateArticles(int count) {
    return List.generate(
        count,
        (index) => Article(
            imagePath: 'image/150_150.png',
            title: 'ブログタイトル${index + 1}つ目',
            detail:
                '【これは${index + 1}つ目のブログです】ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要',
            date: '2023/12/${index + 1}'));
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'トップページ',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth / articles.length;
              double test = (200 * articles.length) +
                  (widget.cardSpacingHorizontal * (articles.length - 1));
              width = width < 200 ? 200 : width;

              double cardWidth = test <= constraints.maxWidth
                  ? 200 + (constraints.maxWidth - test) / articles.length
                  : (width < 200 ? 200 : width);

              List<Widget> cards = <Widget>[
                for (var article in articles)
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
                  runSpacing: 8,
                  children: cards,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
