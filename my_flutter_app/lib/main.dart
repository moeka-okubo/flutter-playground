import 'package:flutter/material.dart';
import 'pages/top_page.dart';
import 'pages/detail_page.dart';

void main() {
  runApp(const MyApp());
}

List<Article> generateArticles(int count) {
  return List.generate(
      count,
      (index) => Article(
          id: index + 1,
          imagePath: 'image/150_150.png',
          title: 'ブログタイトル${index + 1}つ目',
          detail:
              '【これは${index + 1}つ目のブログです】ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要ブログの概要',
          date: '2023/12/${index + 1}'));
}

final List<Article> articles = generateArticles(5);

class Article {
  final int id;
  final String imagePath;
  final String title;
  final String detail;
  final String date;

  Article(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.detail,
      required this.date});
}

class BasePage extends StatefulWidget {
  final String title;
  final Widget child;

  const BasePage({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter勉強用'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                )),
            widget.child,
          ],
        ),
      )),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter勉強用',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TopPage(articles: articles),
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name!);
        final pathSegments = uri.pathSegments;
        if (pathSegments[0] == 'detail') {
          final argument = int.parse(pathSegments[1]);
          return MaterialPageRoute(
              builder: (context) =>
                  DetailPage(itemId: argument, article: articles[argument]));
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
