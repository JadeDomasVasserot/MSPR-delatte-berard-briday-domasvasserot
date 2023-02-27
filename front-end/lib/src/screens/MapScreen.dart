import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/BottomBarComponent.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Set<Marker> markers = new Set<Marker>();

  Future<CameraPosition> getUserCurrentLocation() async { //localisation du user + set des markers
    await Geolocator.requestPermission().then((value){ // demande permission
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    Position userLocation = await Geolocator.getCurrentPosition(); //get user position

    markers.add(
        Marker(
          markerId: const MarkerId("positionUser"),
          position: LatLng(userLocation.latitude, userLocation.longitude),
        )
    );

    return CameraPosition( //defaut position
      target: LatLng(userLocation.latitude, userLocation.longitude),
      zoom: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arosaje',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            body: FutureBuilder<CameraPosition>(
                future: getUserCurrentLocation(),
                builder: (context, AsyncSnapshot<CameraPosition> cameraPos) {
                  if (cameraPos.hasData) {
                    return GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: cameraPos.requireData,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: markers,
                    );
                  } else {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(children: const [
                            Spacer(),
                            CircularProgressIndicator(),
                            Spacer()
                          ]),
                        ]
                    );
                  }
                }),
            bottomNavigationBar: const BottomBarComponent()
        )
    );
  }
}
