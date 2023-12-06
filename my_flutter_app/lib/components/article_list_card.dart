import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/detail_page.dart';

class ArticleListCard extends StatefulWidget {
  const ArticleListCard({super.key});

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
                const Text(
                  '【component化した】ブログのタイトル',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                    'ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要'),
                Image.asset('image/150_150.png'),
                const Text('2023/12/1'),
              ],
            )),
      ),
    );
  }
}
