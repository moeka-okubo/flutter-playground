import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter_app/main.dart';

class ArticleListCard extends StatefulWidget {
  // final Article article;
  final String article;

  const ArticleListCard({super.key, required this.article});

  @override
  State<ArticleListCard> createState() => _ArticleListCardState();
}

class _ArticleListCardState extends State<ArticleListCard> {
  late Map<String, dynamic> articleData;
  @override
  void initState() {
    super.initState();
    articleData = jsonDecode(widget.article);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 200),
        child: Card(
          child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, '/detail/${articleData['id']}');
              Navigator.pushNamed(context, '/detail/2');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset('image/150_150.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      articleData['title'],
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
                    articleData['detail'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      height: 1.2,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(articleData['date'])),
                ],
              ),
            ),
          ),
        ));
  }
}
