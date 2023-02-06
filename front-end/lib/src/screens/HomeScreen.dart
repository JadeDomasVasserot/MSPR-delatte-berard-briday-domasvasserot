import 'package:arosaje/src/components/BottomBarComponent.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/services/photoPlanteService.dart';
import 'package:arosaje/src/services/planteService.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen> {
  late Future<List<Plante>> futurePlante;

  @override
  void initState() {
    super.initState();
    futurePlante = getAllPlantes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         actions: [BackButton(onPressed: () => "/", color: Colors.white)],
          backgroundColor: Colors.green
        ),
        body: Center(
          child: FutureBuilder<List<Plante>>(
            future: futurePlante,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
               return Plante.getListPlantes(snapshot.requireData);
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
        bottomNavigationBar: const BottomBarComponent()
    );
  }
}