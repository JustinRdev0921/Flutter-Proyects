// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Image(
            image: AssetImage('assets/landscape.jpg'),
          ),
          Title(),
          ButtonSection(),
          Description(),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Si ves una piña debajo del mar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                // Text(' '),
                Text(
                  'Bob Esponja!',
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton(icon: Icons.call, txt: 'CALL'),
          CustomButton(icon: Icons.map, txt: 'ROUTE'),
          CustomButton(icon: Icons.share, txt: 'SHARE'),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String txt;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        Text(
          txt,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        'Labore elit id non sunt tempor excepteur. Commodo do quis id exercitation eiusmod. Anim eiusmod dolor deserunt fugiat labore elit. Excepteur deserunt culpa veniam in et nulla fugiat duis duis sit veniam in non. Aute exercitation consequat aliqua elit duis ex Lorem fugiat exercitation ad anim ad eu. Consectetur minim commodo duis eiusmod dolor et amet proident culpa id proident est nostrud.',
      ),
    );
  }
}
