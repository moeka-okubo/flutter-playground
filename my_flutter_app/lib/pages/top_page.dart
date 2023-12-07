import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/article_list_card.dart';
import 'package:my_flutter_app/main.dart';

class TopPage extends StatefulWidget {
  final double cardSpacingHorizontal = 16;
  final List<Article> articles;
  final List<String> allData;

  const TopPage({
    super.key,
    required this.articles,
    required this.allData,
  });

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    int length = widget.articles.length;
    // print('ここがtopに来ているところ');
    // print(widget.allData);
    return BasePage(
      title: 'トップページ',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).cardColor,
                    foregroundColor: Colors.pink),
                child: const Text('新規で作成する'),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth / length;
              double test = (200 * length) +
                  (widget.cardSpacingHorizontal * (length - 1));

              double cardWidth = test <= constraints.maxWidth
                  ? 200 + (constraints.maxWidth - test) / length
                  : (width < 200 ? 200 : width);

              List<Widget> cards = <Widget>[
                for (var article in widget.allData)
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
