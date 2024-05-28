import 'package:flutter/material.dart';
import 'package:push_notifications/screens/home_screen.dart';
import 'package:push_notifications/screens/message_screen.dart';
import 'package:push_notifications/services/push_notifications_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotificationService.messageStream.listen((message) {
      print('MyApp: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'message': (_) => MesaggeScreen(),
      },
    );
  }
}
