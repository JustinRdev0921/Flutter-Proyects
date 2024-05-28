import 'package:app_disenios/widgets/background.dart';
import 'package:app_disenios/widgets/card_table.dart';
import 'package:app_disenios/widgets/custom_botton_navigator.dart';
import 'package:app_disenios/widgets/page_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Background(),
          _HomeBody(),
        ],
      ),
      //bottom navigator bar
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          //titullos
          PageTile(),

          //CarTable
          CarTable(),
        ],
      ),
    );
  }
}
