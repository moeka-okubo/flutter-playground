import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/top_page.dart';
import 'pages/detail_page.dart';
import 'pages/create_page.dart';

void main() {
  runApp(const MyApp());
}

// 記事データ(モック)
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

// 記事データ(保存したやつ)
Future<List<String>> getAllSavedData() async {
  final prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();

  return keys.where((String key) => key.startsWith('data_')).map((String key) {
    return prefs.getString(key) ?? '';
  }).toList();
}

Future<String?> getSingleData(String timestamp) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('data_$timestamp');
}

// 共通レイアウトの作成
class BasePage extends StatefulWidget {
  final String title;
  final Widget child;

  const BasePage({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late List<String> _allSavedData = [];

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  void _loadAllData() async {
    List<String> allData = await getAllSavedData();
    setState(() {
      _allSavedData = allData;
    });
  }

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
              child: Center(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            widget.child,
          ],
        ),
      )),
    );
  }
}

// 共通レイアウトと個別レイアウトの当て込み
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
      routes: {
        '/': (context) => FutureBuilder<List<String>>(
              future: getAllSavedData(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('エラーが発生しました'));
                  } else if (snapshot.hasData) {
                    return TopPage(
                        articles: articles, allData: snapshot.data ?? []);
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
        '/create': (context) => const CreatePage(),
      },
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
