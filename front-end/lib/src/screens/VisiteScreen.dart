import 'package:arosaje/src/models/GardePlante.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/VisitePlante.dart';
import 'package:arosaje/src/services/visiteService.dart';
import 'package:intl/intl.dart';

import '../components/BottomBarComponent.dart';

class VisiteScreen extends StatefulWidget {
  final int id;
  const VisiteScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<VisiteScreen> createState() => _VisiteScreen();
}

class _VisiteScreen extends State<VisiteScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VisitePlante>>(
      future: getVisiteByGarde(widget.id), // Mettre ID session 
      builder: (BuildContext context, AsyncSnapshot<List<VisitePlante>> snapshot) {
        if (snapshot.hasData) {
          
          final List<VisitePlante> visites = snapshot.data! ;
          print(visites);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Visites : ',
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
                for (VisitePlante visite in visites)
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child :Image.asset('photo-plante/${visite.photo}',
                              fit: BoxFit.cover,
                              height: 200, 
                            )
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width - 300,
                            child : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children : [ 
                                Row (children: [
                                  Container(
                                    child: const Text('Date : ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )
                                    )
                                  ),
                                  Container(
                                    child: Text('${DateFormat('dd/MM/yyyy').format(visite.dateVisite)}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15,
                                      )
                                    )
                                  )
                                ],),
                                Wrap(children: [
                                  Container(
                                    child: const Text('Titre : ',
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
                                    child:Text('${visite.commentaire.titre}',
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
                                      child: const Text('Commentaire : ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        )
                                      )
                                    ),
                                  Container(
                                      child: Text('${visite.commentaire.description}',
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                        )
                                      )
                                    )
                                ],),
                              ]
                            )
                          )
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


