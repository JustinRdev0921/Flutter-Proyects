import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_flutter/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial =
        CameraPosition(target: scan.getLanLng(), zoom: 17.5, tilt: 50);
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
        markerId: MarkerId('geo-loction'), position: scan.getLanLng()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: scan.getLanLng(), zoom: 18, tilt: 50)));
              },
              icon: Icon(Icons.location_disabled_outlined))
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
