import 'package:flutter/material.dart';

class MesaggeScreen extends StatelessWidget {
  const MesaggeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Center(
        child: Text('Message Screen'),
      ),
    );
  }
}
