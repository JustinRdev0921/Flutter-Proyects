import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/pages/home_page.dart';
import 'package:qr_flutter/pages/mapa_page.dart';
import 'package:qr_flutter/providers/ui_provider.dart';
import 'package:qr_flutter/providers/scan_list_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapPage(),
        },
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.red,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.red[900])),
      ),
    );
  }
}
