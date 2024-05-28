// SHA1:   DB:D2:67:12:D3:02:CA:48:E0:B6:D9:8C:7C:05:E1:3D:6E:3A:C1:5D
// SHA256: B8:FF:9E:4B:DF:35:F4:0D:D0:3D:4E:C8:03:B9:9A:C5:AC:7D:EC:70:49:9C:70:41:A6:D5:63:CF:92:A3:5A:A5

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStreamController =
      StreamController.broadcast();
  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    /* print('oBackground handler ${message.messageId}'); */
    print(message.data);
    _messageStreamController.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    /* print('_onMessage Handler ${message.messageId}'); */
    print(message.data);
    _messageStreamController.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageOpenHandler(RemoteMessage message) async {
    /* print('_onMessageOpen Handler ${message.messageId}'); */
    print(message.data);
    _messageStreamController.add(message.notification?.title ?? 'No title');
  }

  static Future initializeApp() async {
    //Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenHandler);
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
