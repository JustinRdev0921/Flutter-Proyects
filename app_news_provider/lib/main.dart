import 'package:app_news_provider/src/pages/tabs_page.dart';
import 'package:app_news_provider/src/theme/dark_tema.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage());
  }
}
