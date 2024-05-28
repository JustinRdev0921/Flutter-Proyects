import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/providers/scan_list_provider.dart';
import 'package:qr_flutter/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (BuildContext context, int index) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarScansPorId(scans[index].id!);
              },
              child: ListTile(
                leading: Icon(
                  this.tipo == 'geo' ? Icons.map : Icons.link,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[index].valor),
                subtitle: Text(scans[index].id.toString()),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.red),
                onTap: () => launchURL(context, scans[index]),
              ),
            ));
  }
}
