import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/models/scan_model.dart';
import 'package:qr_flutter/providers/scan_list_provider.dart';
import 'package:qr_flutter/utils/utils.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        //final barcodeScanRes = 'https://google.com';
        //final barcodeScanRes = 'geo:-0.141193,-78.479972';

        if (barcodeScanRes == '-1') {
          return;
        }

        //print(barcodeScanRes);

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan);
      },
    );
  }
}
