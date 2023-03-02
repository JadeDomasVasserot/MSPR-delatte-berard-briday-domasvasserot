import 'package:arosaje/src/models/Commentaire.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/VisitePlante.dart';
import 'package:arosaje/src/services/commentaireService.dart';
import 'package:intl/intl.dart';

import '../components/BottomBarComponent.dart';

class CommentaireScreen extends StatefulWidget {
  final int id;
  const CommentaireScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<CommentaireScreen> createState() => _CommentaireScreen();
}

class _CommentaireScreen extends State<CommentaireScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Commentaire>>(
      future: getCommentaireByPlante(widget.id), // Mettre ID session 
      builder: (BuildContext context, AsyncSnapshot<List<Commentaire>> snapshot) {
        if (snapshot.hasData) {
          final List<Commentaire> commentaires = snapshot.data! ;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Commentaires : ',
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
                for (Commentaire commentaire in commentaires)
                  Container(
                    width: double.infinity,
                  child :Card(
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
                      child:Container(
                        child : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children : [ 
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
                                child:Text('${commentaire.titre}',
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
                                child: Text('${commentaire.description}',
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
                              child: const Text('Auteur : ',
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
                                child:Text('${commentaire.auteur.nom} ${commentaire.auteur.prenom}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                )
                              ),
                            ]),
                          ]
                        )
                      )
                    )
                  ))
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


