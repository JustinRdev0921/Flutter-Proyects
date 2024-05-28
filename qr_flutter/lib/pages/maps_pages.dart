import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/providers/scan_list_provider.dart';
import 'package:qr_flutter/widgets/scan_tiles.dart';

class MapsPages extends StatelessWidget {
  const MapsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}
