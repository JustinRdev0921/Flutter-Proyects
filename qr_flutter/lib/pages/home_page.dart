import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/models/scan_model.dart';
import 'package:qr_flutter/pages/directions_pages.dart';
import 'package:qr_flutter/pages/maps_pages.dart';
import 'package:qr_flutter/providers/db_provider.dart';
import 'package:qr_flutter/providers/scan_list_provider.dart';
import 'package:qr_flutter/providers/ui_provider.dart';
import 'package:qr_flutter/widgets/custom_navigatorbar.dart';
import 'package:qr_flutter/widgets/scan_buttom.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarTodos();
            },
            icon: Icon(
              Icons.delete_forever,
            ),
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt de la clase uiprovider
    final uiProvider = Provider.of<UiProvider>(context);
    //cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: TEMPORAL; LEER BASE DE DATOS:
    //final tempScan = new ScanModel(valor: 'http://google.com');
    //final tempScanUpdate = new ScanModel(id: 2, valor: 'http://youtube.com');
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getScanById(11).then(print);
    //DBProvider.db.getAllScans().then(print);
    //DBProvider.db.updateScan(tempScanUpdate).then(print);
    //DBProvider.db.deleteScan(4).then(print);
    //DBProvider.db.deleteAllScans().then(print);

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    //Cambiar pagina respectiva
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo("geo");
        return MapsPages();
      case 1:
        scanListProvider.cargarScansPorTipo("http");
        return DirectionPages();
        break;
      default:
        return MapsPages();
    }
  }
}
