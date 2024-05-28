import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.teal,
      padding: const EdgeInsets.all(15),
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      width: 300,
      elevation: 30,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
