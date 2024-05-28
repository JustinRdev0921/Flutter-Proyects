import 'package:app_disenios/screens/basic_desing.dart';
import 'package:app_disenios/screens/home_screen.dart';
import 'package:app_disenios/screens/scroll_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_screen',
      routes: {
        'basic_design': (_) => const BasicDesignScreen(),
        'scroll_design': (_) => ScrollDesignScreen(),
        'home_screen': (_) => HomeScreen(),
      },
    );
  }
}

// class _TempHomeScreen extends StatelessWidget {
//   const _TempHomeScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const [
//         Text('Hola mundo'),
//         Text('Hola mundo'),
//       ],
//     );
//   }
// }
