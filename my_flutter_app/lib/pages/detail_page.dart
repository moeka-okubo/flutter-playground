import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/artilcle_list_button.dart';
import 'package:my_flutter_app/main.dart';

class DetailPage extends StatefulWidget {
  final int itemId;
  final Article article;
  const DetailPage({super.key, required this.itemId, required this.article});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: widget.article.title,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Column(
            children: <Widget>[
              Image.asset(widget.article.imagePath),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(widget.article.date)),
              Container(
                margin: const EdgeInsets.only(
                    top: 0, left: 10, right: 10, bottom: 20),
                height: 1,
                color: Colors.grey,
              ),
              Text(widget.article.detail),
              const articleListButton(),
            ],
          ),
        ),
      ),
    );
  }
}
