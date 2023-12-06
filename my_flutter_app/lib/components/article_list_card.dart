import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/detail_page.dart';

class ArticleListCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String detail;
  final String date;

  const ArticleListCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.detail,
      required this.date});

  @override
  State<ArticleListCard> createState() => _ArticleListCardState();
}

class _ArticleListCardState extends State<ArticleListCard> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 200),
        child: Card(
          // margin: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DetailPage()));
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(widget.imagePath),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.detail,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        height: 1.2,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(widget.date)),
                  ],
                )),
          ),
        ));
  }
}
