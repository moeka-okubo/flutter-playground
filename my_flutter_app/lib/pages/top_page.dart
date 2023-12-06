import 'package:flutter/material.dart';
import 'package:my_flutter_app/main.dart';
import './detail_page.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'トップページ',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('こんな感じでテキスト追加できる'),
          LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth * 0.25; // 画面幅の25%

              return Center(
                child: SizedBox(
                  width: width,
                  child: Card(
                    margin: const EdgeInsets.all(40),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DetailPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'ブログのタイトル',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                                'ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要'),
                            const SizedBox(height: 8),
                            Image.asset('image/150_150.png'),
                            const SizedBox(height: 8),
                            const Text('2023/12/01'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
