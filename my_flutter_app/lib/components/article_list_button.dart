import 'package:flutter/material.dart';

class ArticleListButton extends StatefulWidget {
  const ArticleListButton({super.key});

  @override
  State<ArticleListButton> createState() => _ArticleListButtonState();
}

class _ArticleListButtonState extends State<ArticleListButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Text('記事一覧に戻る'),
      ),
    );
  }
}
