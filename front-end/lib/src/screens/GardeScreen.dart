import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:arosaje/src/models/GardePlante.dart';

import 'package:arosaje/src/services/statutService.dart';
import 'package:arosaje/src/services/gardePlanteService.dart';

import '../components/BottomBarComponent.dart';

class GardeScreen extends StatefulWidget {
  const GardeScreen({Key? key}) : super(key: key);

  @override
  State<GardeScreen> createState() => _GardeScreen();
}

class _GardeScreen extends State<GardeScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GardePlante>>(
      future:  getGardePlanteByUser(1), // Mettre ID session 
      builder: (BuildContext context, AsyncSnapshot<List<GardePlante>> snapshot) {
        if (snapshot.hasData) {
          final List<GardePlante> gardePlantes = snapshot.data! ;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Mes gardes !',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )
              ),
              backgroundColor: const Color.fromARGB(255,131,189,117),
            ),
            body: Column(
              children: <Widget>[
                for (GardePlante gardePlante in gardePlantes)
                  Card(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0, top : 20),
                    elevation: 0,
                    color: const Color.fromARGB(100, 233,239, 192),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: const Color.fromARGB(255, 233,239, 192),
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child : Row (children: [
                              Container(
                                child: const Text('Nom : ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )
                                )
                              ),
                              Container(
                                child: Text('${gardePlante.plante.bibliothequePlante.nom}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                  )
                                )
                              )
                            ],)
                          ),
                          Wrap(children: [
                            Container(
                              child: const Text('Date : ',
                              textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black
                                )
                              )
                            ),
                            Container(
                              child:Text('${DateFormat('dd/MM/yyyy').format(gardePlante.dateDebut)}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                  color: Colors.black
                                )
                              )
                            ),
                            Container(
                              child: const Text(' au ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black
                                )
                              )
                            ),
                            Container(
                              child: Text('${DateFormat('dd/MM/yyyy').format(gardePlante.dateFin)}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                  color: Colors.black
                                )
                               )
                            ),
                          ]),
                          Wrap(children: [
                            Container(
                                child: const Text('Localisation : ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )
                                )
                              ),
                            Container(
                                child: Text('${gardePlante.plante.proprietaire.adresse}, ${gardePlante.plante.proprietaire.cp}, ${gardePlante.plante.proprietaire.ville}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                  )
                                )
                              )
                          ],),
                          Wrap (children: [
                            Container(
                              margin : const EdgeInsets.only(top : 5),
                              padding : const EdgeInsets.only(right: 2,top : 10, bottom: 10),
                              child: OutlinedButton(
                                onPressed: () {
                                  context.go("/plante/${gardePlante.plante.id}");
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(color: Colors.black)
                                  )
                                ),
                                child: const Text('Voir la plante',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                ),
                              )
                            ),
                            Container(
                              margin : const EdgeInsets.only(top : 5),
                              padding : const EdgeInsets.only(left : 2, right: 2,top : 10, bottom: 10),
                              child: OutlinedButton(
                                onPressed: () {
                                  context.go("");
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(color: Colors.black)
                                  )
                                ),
                                child: const Text('Ajouter une visite',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                ),
                              )
                            ),                              
                            Container(
                              margin : const EdgeInsets.only(top : 5),
                              padding : const EdgeInsets.only(left : 2, right: 2,top : 10, bottom: 10),
                              child: OutlinedButton(
                                onPressed: () {
                                  context.go("");
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(color: Colors.black)
                                  )
                                ),
                                child: const Text('Voir les visites',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                ),
                              )
                            ),
                          ])
                        ],
                      ),
                    )
                  )
              ],
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
