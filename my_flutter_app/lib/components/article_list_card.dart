import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/detail_page.dart';

class ArticleListCard extends StatefulWidget {
  final String title;

  const ArticleListCard({super.key, required this.title});

  @override
  State<ArticleListCard> createState() => _ArticleListCardState();
}

class _ArticleListCardState extends State<ArticleListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(40),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DetailPage()));
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('image/150_150.png'),
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
                const Text(
                  'ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const Text('2023/12/1'),
              ],
            )),
      ),
    );
  }
}
