import 'package:arosaje/src/components/BottomBarComponent.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/services/photoPlanteService.dart';
import 'package:arosaje/src/services/planteService.dart';
import 'package:arosaje/src/services/gardePlanteService.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:arosaje/src/models/PhotoPlante.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<GardePlante>> futurePlante;
  @override
  void initState() {
    super.initState();
    futurePlante = getPlantesAGarder();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GardePlante>>(
        future: getPlantesAGarder(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GardePlante>> snapshot) {
          if (snapshot.hasData) {
            // Si la requête a réussi, on construit la ListView avec les données reçues
            final List<GardePlante> gardePlantes = snapshot.data ?? [];
            return Scaffold(
                appBar: AppBar(
                  // Page en haut
                  backgroundColor: const Color.fromARGB(255, 131, 189, 117),
                  title: const Text(
                    'Les plantes à garder',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                body: Center(
                    // Contenue de notre page
                    child: CustomScrollView(
                  // Pour pouvoir scroll
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      // Pour avoir un catalogue
                      padding: const EdgeInsets.all(20),
                      sliver: SliverGrid
                          .count(crossAxisCount: 2, children: <Widget>[
                        for (GardePlante gardePlante in gardePlantes)
                          Container(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(100, 233, 239, 192),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 233, 239, 192),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(10),
                              child: TextButton(
                                onPressed: () {
                                  context.go("/plante/${gardePlante.id}");
                                },
                                child: Column(children: [
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                          '${gardePlante.plante.bibliothequePlante.nom}',
                                          style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black))),
                                  FutureBuilder<PhotoPlante>(
                                      future: getLastPhotoPlante(
                                          gardePlante.plante.id),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<PhotoPlante> snapshot) {
                                        if (snapshot.hasData) {
                                          final PhotoPlante photoPlante =
                                              snapshot.data!;
                                          return Container(
                                              child: Expanded(
                                                  child: Image.asset(
                                                      'photo-plante/${photoPlante.photo}')));
                                        } else if (snapshot.hasError) {
                                          return Container(
                                              child: Expanded(
                                                  child: Image.asset(
                                                      'logo_app.png')));
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      }),
                                  Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.only(top: 2),
                                      decoration: const BoxDecoration(
                                          border: Border(top: BorderSide())),
                                      child: Wrap(
                                        children: [
                                          Container(
                                              child: const Text('Du : ',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color: Colors.black))),
                                          Container(
                                              child: Text(
                                                  '${DateFormat('dd/MM/yyyy').format(gardePlante.dateDebut)}',
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      color: Colors.black))),
                                          Container(
                                              child: const Text(' au ',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color: Colors.black))),
                                          Container(
                                              child: Text(
                                                  '${DateFormat('dd/MM/yyyy').format(gardePlante.dateFin)}',
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      color: Colors.black)))
                                        ],
                                      )),
                                  Container(
                                      child: Wrap(
                                    children: [
                                      Container(
                                          child: const Text('Localisation : ',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black))),
                                      Container(
                                          child: Text(
                                              '${gardePlante.plante.proprietaire.adresse}, ${gardePlante.plante.proprietaire.cp} ${gardePlante.plante.proprietaire.ville}',
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12,
                                                  color: Colors.black))),
                                    ],
                                  )),
                                ]),
                              ),
                            ),
                          )
                      ]),
                    ),
                  ],
                )),
                bottomNavigationBar: const BottomBarComponent());
          } else if (snapshot.hasError) {
            return Text("Une erreur s'est produite : ${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}



// class _HomeScreen extends State<HomeScreen> {
//   late Future<List<Plante>> futurePlante;
//   @override
//   void initState() {
//     super.initState();
//     futurePlante = getAllPlantes();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//          actions: [BackButton(onPressed: () => "/", color: Colors.white)],
//           backgroundColor: Colors.green
//         ),
//         body: Center(
//           child: FutureBuilder<List<Plante>>(
//             future: futurePlante,
//             builder: (context, snapshot) {
//               if (snapshot.data != null) {
//                return Plante.getListPlantes(snapshot.requireData);
//               }
//               else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//         bottomNavigationBar: const BottomBarComponent()
//     );
//   }
// }