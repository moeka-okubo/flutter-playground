import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/article_list_card.dart';
import 'package:my_flutter_app/main.dart';

class TopPage extends StatefulWidget {
  final double cardSpacingHorizontal = 16;
  final List<Article> articles;

  const TopPage({super.key, required this.articles});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    int length = widget.articles.length;
    return BasePage(
      title: 'トップページ',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth / length;
              double test = (200 * length) +
                  (widget.cardSpacingHorizontal * (length - 1));
              // width = width < 200 ? 200 : width;

              double cardWidth = test <= constraints.maxWidth
                  ? 200 + (constraints.maxWidth - test) / length
                  : (width < 200 ? 200 : width);

              List<Widget> cards = <Widget>[
                for (var article in widget.articles)
                  SizedBox(
                    width: cardWidth,
                    child: ArticleListCard(
                      article: article,
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
