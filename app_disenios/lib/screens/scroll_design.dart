import 'dart:convert';

import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  const ScrollDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          Page1(),
          Page2(),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        BackgroundImage(),
        InfoText(),
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(image: AssetImage('assets/scroll-1.png')),
    );
  }
}

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    var now = dateFormatter(DateTime.now());

    // ignore: prefer_const_constructors
    final textStyle = TextStyle(
        fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('11°', style: textStyle),
          Text(
            '${now}',
            style: textStyle,
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Lun", "2" : "Mar", "3" : "Miér", "4" : "Jue", "5" : "Vier", "6" : "Sab", "7" : "Dom" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Bienvenido',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue[900],
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}
