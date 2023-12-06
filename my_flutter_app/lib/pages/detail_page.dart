import 'package:flutter/material.dart';
import 'package:my_flutter_app/main.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: '詳細',
        child: Column(
          children: <Widget>[
            const Text('ここは詳細画面に移動できている'),
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
                          print('押された');
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
        ));
  }
}
