import 'package:flutter/material.dart';

class articleListButton extends StatefulWidget {
  const articleListButton({super.key});

  @override
  State<articleListButton> createState() => _articleListButtonState();
}

class _articleListButtonState extends State<articleListButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Text('記事一覧に戻る'),
      ),
    );
  }
}
