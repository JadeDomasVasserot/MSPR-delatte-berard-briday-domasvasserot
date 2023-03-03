import 'dart:async';
import 'package:arosaje/src/services/gardePlanteService.dart' as gardePlante;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/BottomBarComponent.dart';
import '../models/GardePlante.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Set<Marker> markers = new Set<Marker>();
  Set<Marker> Listplante = new Set<Marker>();

  Future<CameraPosition> getUserCurrentLocation() async {
    //localisation du user + set des markers
    await Geolocator.requestPermission().then((value) {
      // demande permission
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    Position userLocation =
        await Geolocator.getCurrentPosition(); //get user position

    markers.add(Marker(
      markerId: const MarkerId("positionUser"),
      position: LatLng(userLocation.latitude, userLocation.longitude),
    ));

    List<GardePlante> testBDD = await gardePlante.getPlantesAGarder();
    int i = 0;
    for (GardePlante plante in testBDD) {
      List<Location> localPlante = await locationFromAddress(
          plante.plante.proprietaire.adresse +
              ',' +
              plante.plante.proprietaire.ville);
      Location placemark = localPlante[i];
      Listplante.add(Marker(
          markerId: MarkerId(plante.plante.id.toString()),
          position: LatLng(placemark.latitude, placemark.longitude),
          infoWindow: InfoWindow(
              title:
                  "${plante.plante.bibliothequePlante.nom}\n ${plante.plante.localisation} \n ${plante.plante.proprietaire}"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen)));
    }
    return CameraPosition(
      //defaut position
      target: LatLng(userLocation.latitude, userLocation.longitude),
      zoom: 13,
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
                      markers: Set<Marker>.from([...markers, ...Listplante]),
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
                        ]);
                  }
                }),
            bottomNavigationBar: const BottomBarComponent()));
  }
}
