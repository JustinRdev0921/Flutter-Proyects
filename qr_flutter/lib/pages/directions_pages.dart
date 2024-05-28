import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/providers/scan_list_provider.dart';
import 'package:qr_flutter/widgets/scan_tiles.dart';

class DirectionPages extends StatelessWidget {
  const DirectionPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}
