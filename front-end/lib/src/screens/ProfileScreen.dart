import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/personneService.dart';

import '../components/BottomBarComponent.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Personne>(
        future: getUser(1), // Mettre ID session
        builder: (BuildContext context, AsyncSnapshot<Personne> snapshot) {
          if (snapshot.hasData) {
            final Personne personnes = snapshot.data!;
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                      utf8.decode('Bonjour ${personnes.prenom} !'.codeUnits),
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
                                          child: const Text('E-mail : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ))),
                                      Container(
                                          child: Text(
                                              utf8.decode('${personnes.email}'
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
                                          child: const Text(
                                              'Nombre de garde(s) : ',
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
                    ButtonCard(),
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

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
        elevation: 0,
        color: const Color.fromARGB(100, 233, 239, 192),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color: Color.fromARGB(255, 233, 239, 192),
            )),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                  child: Row(children: [
                Spacer(),
                Container(
                    child: OutlinedButton(
                  onPressed: () {
                    context.go("/my_plantes");
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.black))),
                  child: const Text('Voir mes plantes',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black)),
                )),
                Spacer(),
              ])),
            ],
          ),
        ));
  }
}
