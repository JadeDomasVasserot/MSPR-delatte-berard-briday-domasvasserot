import 'dart:convert';

import 'package:arosaje/src/models/PhotoPlante.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/PhotoBibliothequePlante.dart';
import 'package:arosaje/src/services/BibliothequePlanteService.dart';
import 'package:arosaje/src/services/photoPlanteService.dart';

import '../components/BottomBarComponent.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreen();
}

class _GuideScreen extends State<GuideScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BibliothequePlante>>(
      future: getAllPlantesGuide(),
      builder: (BuildContext context, AsyncSnapshot<List<BibliothequePlante>> snapshot) {
        if (snapshot.hasData) {
          // Si la requête a réussi, on construit la ListView avec les données reçues
          final List<BibliothequePlante> bibliothequePlante = snapshot.data?? [];
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255,131,189,117),
              title: const Text('Guide',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )
                )
            ),
            body: Center(
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        for (BibliothequePlante plante in bibliothequePlante)
                          Container(
                            child: Container(
                              decoration: BoxDecoration(
                                color:  const Color.fromARGB(100, 233,239, 192),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 233,239, 192),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(10),
                              child: TextButton(
                                onPressed: () {
                                  context.go("/bibliotheque_plante/${plante.id}");
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(bottom : 4),
                                      child: Text(utf8.decode('${plante.nom}'.codeUnits),
                                        style: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black
                                        )
                                      )
                                    ),
                                    FutureBuilder<PhotoBibliothequePlante>(
                                      future: getPhotoBibliothequePlante(plante.id),
                                      builder: (BuildContext context, AsyncSnapshot<PhotoBibliothequePlante> snapshot) {
                                        if (snapshot.hasData) {
                                          final   PhotoBibliothequePlante photoPlante = snapshot.data!;
                                          return Container(
                                            child: Expanded(
                                              child :Image.asset(utf8.decode('photo-plante-bibliotheque/${photoPlante.photo}'.codeUnits)),
                                            )
                                          );
                                        }else if (snapshot.hasError) {
                                          return Text("Une erreur s'est produite : ${snapshot.error}");
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      }
                                    ),
                                  ]
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
            bottomNavigationBar: const BottomBarComponent()
          );
        } else if (snapshot.hasError) {
          return Text("Une erreur s'est produite : ${snapshot.error}");
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}
