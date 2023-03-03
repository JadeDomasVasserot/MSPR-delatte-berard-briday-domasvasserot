import 'dart:convert';

import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/services/photoPlanteService.dart';
import 'package:arosaje/src/services/gardePlanteService.dart';
import 'package:arosaje/src/models/PhotoPlante.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/BottomBarComponent.dart';
import 'package:arosaje/src/services/planteService.dart';
import 'package:intl/intl.dart';


class MyPlanteScreen extends StatefulWidget {
  final int id;
  const MyPlanteScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<MyPlanteScreen> createState() => _MyPlanteScreen();
}


class _MyPlanteScreen extends State<MyPlanteScreen> {
  @override
  Widget build(BuildContext context,) {
    return FutureBuilder<Plante>(
      future: getPlante(widget.id),
      builder: (BuildContext context, AsyncSnapshot<Plante> snapshot) {
        if (snapshot.hasData) {
          final Plante plante = snapshot.data! ;
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    context.go("/profile");
                  }, 
                )
              ],
              backgroundColor: const Color.fromARGB(255,131,189,117),
              title: Text(utf8.decode('${plante.bibliothequePlante.nom}'.codeUnits),
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )
                )
            ),
            body: CustomScrollView( // Pour pouvoir scroll
              primary: false,
              slivers:<Widget>[ 
                SliverToBoxAdapter( 
                  child: Column(
                    children: <Widget>[
                      Card(
                        margin: const EdgeInsets.all(20),
                        elevation: 0,
                        color: const Color.fromARGB(100, 233,239, 192),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 233,239, 192),
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            FutureBuilder<PhotoPlante>(
                              future: getLastPhotoPlante(plante.id),
                              builder: (BuildContext context, AsyncSnapshot<PhotoPlante> snapshot) {
                                if (snapshot.hasData) {
                                  final PhotoPlante photoPlante = snapshot.data!;
                                  return Container(
                                    padding : const EdgeInsets.all(10),
                                    child :Image.asset(utf8.decode('photo-plante/${photoPlante.photo}'.codeUnits),
                                      fit: BoxFit.cover,
                                    )
                                  );
                                }else if (snapshot.hasError) {
                                  return Container(
                                    padding : const EdgeInsets.all(10),
                                    child :Image.asset(utf8.decode('logo_app.png'.codeUnits),
                                      fit: BoxFit.cover,
                                    )
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }
                            ),
                            Container(
                              margin : const EdgeInsets.only(right: 10, left : 10),
                              padding : const EdgeInsets.only(top : 10),
                                decoration: const BoxDecoration(
                                border: Border(
                                  top : BorderSide()
                                )
                              ),
                              child : Row (children: [
                                Container(
                                  child: const Text('Type : ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )
                                  )
                                ),
                                Container(
                                  child: Text(utf8.decode('${plante.bibliothequePlante.typePlante.nom}'.codeUnits),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                    )
                                  )
                                )
                              ],)
                            ),
                            Container(
                              margin : const EdgeInsets.only(right: 10, left : 10),
                              padding : const EdgeInsets.only(top : 10),
                              child : Row (children: [
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
                                  child: Text(utf8.decode('${plante.localisation}'.codeUnits),
                                  textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                    )
                                  )
                                )
                              ],)
                            ),
                            FutureBuilder<List<GardePlante>>(
                              future: getGardePlanteByPlante(plante.id),
                              builder: (BuildContext context, AsyncSnapshot<List<GardePlante>> snapshot) {
                                if (snapshot.hasData) {
                                  List<GardePlante> gardePlantes = snapshot.data! ;
                                  return Column(
                                    children: [
                                      for (GardePlante gardePlante in gardePlantes)// Garde
                                        if (gardePlante.statut.id != 3)
                                          Container(
                                            margin : const EdgeInsets.only(top : 10,right: 10, left : 10),
                                            padding : const EdgeInsets.only(top : 10, bottom: 10),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top : BorderSide()
                                              )
                                            ),
                                            child : Wrap( children :[// Garde
                                              Wrap(children: [
                                                Container(
                                                  child: const Text('Du : ',
                                                    style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black
                                                    )
                                                  )
                                                ),
                                                Container(
                                                  child:Text(utf8.decode('${DateFormat('dd/MM/yyyy').format(gardePlante.dateDebut)}'.codeUnits),
                                                  style: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                      fontSize: 15,
                                                      color: Colors.black
                                                    )
                                                  )
                                                ),
                                                Container(
                                                  child: const Text(' au ',
                                                    style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black
                                                    )
                                                  )
                                                ),
                                                Container(
                                                  child:  Text(utf8.decode('${DateFormat('dd/MM/yyyy').format(gardePlante.dateFin)}'.codeUnits),
                                                    style:  const TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 15,
                                                      color: Colors.black
                                                    )
                                                  )
                                                ),
                                              ]),
                                              Container(
                                                padding : const EdgeInsets.only(top : 5),
                                                child: gardePlante.gardien != null ? //gardien 
                                                Row (children: [
                                                  Container(
                                                    child: const Text('Gardien : ',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15,
                                                      )
                                                    )
                                                  ),
                                                  Container(
                                                    child:  Text(utf8.decode('${gardePlante.gardien?.nom}'.codeUnits),
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 15,
                                                      )
                                                    )
                                                  )
                                                ],)
                                                :const Text('')
                                              ),
                                              Container(
                                                padding : const EdgeInsets.only(top : 5),
                                                child : Wrap (children: [
                                                  Container(
                                                    child : gardePlante.statut.id == 1 ?
                                                    Container(
                                                      padding : const EdgeInsets.only(left : 2, right: 2),
                                                      child: OutlinedButton(
                                                        onPressed: () {
                                                          context.go("/profile/${gardePlante.gardien?.id}");
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5),
                                                            side: BorderSide(color: Colors.black)
                                                          )
                                                        ),
                                                        child: const Text('Voir profile gardien',
                                                          style: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 15,
                                                            color: Colors.black
                                                          )
                                                        ),
                                                      )
                                                    ): null
                                                  ),
                                                  Container(
                                                    child : gardePlante.statut.id == 1 ?
                                                    Container(
                                                      padding : const EdgeInsets.only(left : 2, right: 2),
                                                      child: OutlinedButton(
                                                        onPressed: () {
                                                          context.go("/visite/${gardePlante.id}");
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5),
                                                            side: BorderSide(color: Colors.black)
                                                          )
                                                        ),
                                                        child: const Text('Voir visites',
                                                          style: TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 15,
                                                            color: Colors.black
                                                          )
                                                        ),
                                                      )
                                                    ): null
                                                  ),
                                                  Container(
                                                    child : gardePlante.statut.id == 2 ?
                                                      Container(
                                                        padding : const EdgeInsets.all(2),
                                                        child: OutlinedButton(
                                                          onPressed: () => showDialog<String>(
                                                            context: context,
                                                            builder: (BuildContext context) => AlertDialog(
                                                              title: const Text('Supprimer'),
                                                              content: const Text('Voulez vous supprimer cette garde ? '),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () {
                                                                    deleteGardePlante(gardePlante.id);
                                                                    context.go("/my_plantes");
                                                                  }                ,
                                                                  child: const Text('OUI'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () {
                                                                    context.go("/my_plantes");
                                                                  },
                                                                  child: const Text('NON'),
                                                                )
                                                              ]
                                                            )
                                                          ),
                                                          style: ElevatedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(5),
                                                              side: BorderSide(color: Colors.black)
                                                            )
                                                          ),
                                                          child: const Text('Supprimer',
                                                            style: TextStyle(
                                                              fontStyle: FontStyle.normal,
                                                              fontSize: 15,
                                                              color: Colors.black
                                                            )
                                                          ),
                                                        )
                                                      )
                                                    :null
                                                  )
                                                ])
                                              )
                                            ]),
                                          )
                                    ]
                                  );
                                } else if (snapshot.hasError) {
                                  return const Text('');
                                } else {
                                  return const CircularProgressIndicator();
                                } 
                              }
                            ),
                            Container(
                              margin : const EdgeInsets.only(top : 5,right: 10, left : 10),
                              padding : const EdgeInsets.only(top : 8, bottom: 8),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top : BorderSide()
                                )
                              ),
                              child : Wrap(
                                children: [
                                Container(
                                  padding : const EdgeInsets.all(2),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      context.go("/modify/plante/${plante.id}");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.black)
                                      )
                                    ),
                                    child: const Text('Modifier',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15,
                                        color: Colors.black
                                      )
                                    ),
                                  )
                                ),
                                Container(
                                  padding : const EdgeInsets.all(2),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      context.go("/commentaire/${plante.id}");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.black)
                                      )
                                    ),
                                    child: const Text('Voir commentaire',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15,
                                        color: Colors.black
                                      )
                                    ),
                                  )
                                ),
                                Container(
                                  padding : const EdgeInsets.all(2),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      context.go("/create/garde/${plante.id}");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.black)
                                      )
                                    ),
                                    child: const Text('Ajouter une garde',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15,
                                        color: Colors.black
                                      )
                                    ),
                                  )
                                ),
                              ])
                            )
                          ]
                        ),
                      )
                    ]
                  )
                )
              ]
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


