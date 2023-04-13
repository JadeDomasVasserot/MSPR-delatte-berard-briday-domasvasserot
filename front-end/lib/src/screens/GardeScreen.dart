import 'dart:convert';

import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:arosaje/src/models/VisitePlante.dart';
import 'package:arosaje/src/models/GardePlante.dart';

import 'package:arosaje/src/services/visiteService.dart';
import 'package:arosaje/src/services/statutService.dart';
import 'package:arosaje/src/services/gardePlanteService.dart';

import '../components/BottomBarComponent.dart';

class GardeScreen extends StatefulWidget {
  const GardeScreen({Key? key}) : super(key: key);

  @override
  State<GardeScreen> createState() => _GardeScreen();
}

class _GardeScreen extends State<GardeScreen> {
  late StatutPlante _statutPlante;

  @override
  void initState() {
    super.initState();
    _fetchStatutPlante();
  }

  Future<void> _fetchStatutPlante() async {
    final statut = await getStatutPlante(3);
    setState(() {
      _statutPlante = statut;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GardePlante>>(
        future: getGardePlanteByUser(), // Mettre ID session
        builder:
            (BuildContext context, AsyncSnapshot<List<GardePlante>> snapshot) {
          if (snapshot.hasData) {
            final List<GardePlante> gardePlantes = snapshot.data!;
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Mes gardes !',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit_calendar),
                      onPressed: () {
                        context.go("/garde/fermer");
                      },
                    )
                  ],
                  backgroundColor: const Color.fromARGB(255, 131, 189, 117),
                ),
                body: Column(
                  children: <Widget>[
                    for (GardePlante gardePlante in gardePlantes)
                      if (gardePlante.statut.id == 1)
                        Card(
                            margin: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 20),
                            elevation: 0,
                            color: const Color.fromARGB(100, 233, 239, 192),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                  color:
                                      const Color.fromARGB(255, 233, 239, 192),
                                )),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                          child: const Text('Nom : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ))),
                                      Container(
                                          child: Text(
                                              utf8.decode(
                                                  '${gardePlante.plante.bibliothequePlante.nom}'
                                                      .codeUnits),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              )))
                                    ],
                                  )),
                                  Wrap(children: [
                                    Container(
                                        child: const Text('Date : ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black))),
                                    Container(
                                        child: Text(
                                            utf8.decode(
                                                '${DateFormat('dd/MM/yyyy').format(gardePlante.dateDebut)}'
                                                    .codeUnits),
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                                color: Colors.black))),
                                    Container(
                                        child: const Text(' au ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black))),
                                    Container(
                                        child: Text(
                                            utf8.decode(
                                                '${DateFormat('dd/MM/yyyy').format(gardePlante.dateFin)}'
                                                    .codeUnits),
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                                color: Colors.black))),
                                  ]),
                                  Wrap(
                                    children: [
                                      Container(
                                          child: const Text('Localisation : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ))),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                              utf8.decode(
                                                  '${gardePlante.plante.proprietaire.adresse}, ${gardePlante.plante.proprietaire.cp}, ${gardePlante.plante.proprietaire.ville}'
                                                      .codeUnits),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              )))
                                    ],
                                  ),
                                  Wrap(children: [
                                    Container(
                                        padding: const EdgeInsets.all(2),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            context.go(
                                                "/plante/${gardePlante.plante.id}");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  side: BorderSide(
                                                      color: Colors.black))),
                                          child: const Text('Voir la plante',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                        )),
                                    Container(
                                        padding: const EdgeInsets.all(2),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            context.go(
                                                "/create/visite/${gardePlante.id}");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  side: BorderSide(
                                                      color: Colors.black))),
                                          child: const Text(
                                              'Ajouter une visite',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                        )),
                                    FutureBuilder<List<VisitePlante>>(
                                        future: getVisiteByGarde(gardePlante
                                            .id), // Mettre ID session
                                        builder: (BuildContext context,
                                            AsyncSnapshot<List<VisitePlante>>
                                                snapshot) {
                                          if (snapshot.hasData) {
                                            final List<VisitePlante>
                                                visitePlantes = snapshot.data!;
                                            if (visitePlantes.isNotEmpty) {
                                              return Container(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      context.go(
                                                          "/visite/${gardePlante.id}");
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                    child: const Text(
                                                        'Voir les visites',
                                                        style: TextStyle(
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black)),
                                                  ));
                                            } else {
                                              return SizedBox();
                                            }
                                          } else if (snapshot.hasError) {
                                            return SizedBox();
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        }),
                                    Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        padding: const EdgeInsets.all(2),
                                        child: gardePlante.statut.id == 1
                                            ? OutlinedButton(
                                                onPressed: () {
                                                  showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                              title: const Text(
                                                                  'Garde terminée'),
                                                              content: const Text(
                                                                  'Votre garde a bien été fermée'),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    updateGardePlante(
                                                                        gardePlante
                                                                            .id,
                                                                        gardePlante
                                                                            .plante,
                                                                        gardePlante
                                                                            .dateDebut,
                                                                        gardePlante
                                                                            .dateFin,
                                                                        _statutPlante,
                                                                        gardePlante
                                                                            .gardien!);
                                                                    context.go(
                                                                        "/home");
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                          'OK'),
                                                                ),
                                                              ]));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                child: const Text('Fermée',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15,
                                                        color: Colors.black)),
                                              )
                                            : const Text('')),
                                  ])
                                ],
                              ),
                            ))
                  ],
                ),
                bottomNavigationBar: const BottomBarComponent());
          } else if (snapshot.hasError) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Mes gardes !',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit_calendar),
                      onPressed: () {
                        context.go("/garde/fermer");
                      },
                    )
                  ],
                  backgroundColor: const Color.fromARGB(255, 131, 189, 117),
                ),
                body: Column(
                  children: <Widget>[
                    Card(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20),
                        elevation: 0,
                        color: const Color.fromARGB(100, 233, 239, 192),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                              color: const Color.fromARGB(255, 233, 239, 192),
                            )),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Row(
                                children: [
                                  Container(
                                      child: const Text(
                                          'Vous avez aucune garde en cours ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ))),
                                ],
                              )),
                            ],
                          ),
                        ))
                  ],
                ),
                bottomNavigationBar: const BottomBarComponent());
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
