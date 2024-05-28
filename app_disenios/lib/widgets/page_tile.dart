import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Clasify Transaction',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Clasify this transaction into a particular category',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
