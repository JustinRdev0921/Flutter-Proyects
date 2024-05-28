import 'package:flutter/material.dart';

class CarTable extends StatelessWidget {
  const CarTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(
                color: Colors.blue, icon: Icons.ac_unit, txt: 'General'),
            _SingleCard(
                color: Colors.purpleAccent,
                icon: Icons.access_alarm_outlined,
                txt: 'Alarm'),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                color: Colors.blue, icon: Icons.ac_unit, txt: 'General'),
            _SingleCard(
                color: Colors.purpleAccent,
                icon: Icons.access_alarm_outlined,
                txt: 'Alarm'),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                color: Colors.blue, icon: Icons.ac_unit, txt: 'General'),
            _SingleCard(
                color: Colors.purpleAccent,
                icon: Icons.access_alarm_outlined,
                txt: 'Alarm'),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                color: Colors.blue, icon: Icons.ac_unit, txt: 'General'),
            _SingleCard(
                color: Colors.purpleAccent,
                icon: Icons.access_alarm_outlined,
                txt: 'Alarm'),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String txt;
  const _SingleCard(
      {Key? key, required this.color, required this.icon, required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 180,
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              size: 35,
            ),
            radius: 30,
          ),
          SizedBox(height: 15),
          Text(
            txt,
            style: TextStyle(color: color, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
