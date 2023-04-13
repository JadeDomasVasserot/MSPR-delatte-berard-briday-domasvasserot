import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/personneService.dart';

import '../components/BottomBarComponent.dart';

class ProfileExterieurScreen extends StatefulWidget {
  final int id;
  const ProfileExterieurScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProfileExterieurScreen> createState() => _ProfileExterieurScreen();
}

class _ProfileExterieurScreen extends State<ProfileExterieurScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Personne>(
        future: getUserStatic(widget.id),
        builder: (BuildContext context, AsyncSnapshot<Personne> snapshot) {
          if (snapshot.hasData) {
            final Personne personnes = snapshot.data!;
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                      utf8.decode(
                          '${personnes.prenom} ${personnes.nom}'.codeUnits),
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                  backgroundColor: const Color.fromARGB(255, 131, 189, 117),
                ),
                body: Column(
                  children: <Widget>[
                    Center(
                        child: Card(
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
                                                  '${personnes.nom}'.codeUnits),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              )))
                                    ],
                                  )),
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                          child: const Text('Prénom : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ))),
                                      Container(
                                          child: Text(
                                              utf8.decode('${personnes.prenom}'
                                                  .codeUnits),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              )))
                                    ],
                                  )),
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                          child:
                                              const Text('Nombre de garde : ',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ))),
                                      Container(
                                          child: const Text('??',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              )))
                                    ],
                                  )),
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                          child: const Text('Role : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ))),
                                      Container(
                                          child: Text(
                                              utf8.decode(
                                                  '${personnes.role.nom}'
                                                      .codeUnits),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              )))
                                    ],
                                  )),
                                ],
                              ),
                            ))),
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
                            children: [
                              Container(
                                  child: Row(children: [
                                Container(
                                    child: const Text('Adresse : ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ))),
                              ])),
                              Container(
                                  child: Row(children: [
                                Container(
                                    child: Text(
                                        utf8.decode(
                                            '${personnes.adresse}'.codeUnits),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                        )))
                              ])),
                              Container(
                                  child: Row(children: [
                                Container(
                                    child: Text(
                                        utf8.decode(
                                            '${personnes.cp}, ${personnes.ville} '
                                                .codeUnits),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                        ))),
                              ]))
                            ],
                          ),
                        )),
                  ],
                ),
                bottomNavigationBar: const BottomBarComponent());
          } else if (snapshot.hasError) {
            return Text("Une erreur s'est produite : ${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
