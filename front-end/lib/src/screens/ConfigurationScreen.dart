import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/personneService.dart';

import '../components/BottomBarComponent.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);
 
  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreen();
}

class _ConfigurationScreen extends State<ConfigurationScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Personne>(
        future: getUser(1), // Mettre ID session
        builder: (BuildContext context, AsyncSnapshot<Personne> snapshot) {
          if (snapshot.hasData) {
            final Personne personnes = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    context.go("/profile");
                  },
                ),
                title : const Text('Configuration',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.white,
              ),
              body: Container(
                color: const Color.fromARGB(255, 246, 241, 241),
                child:Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child : Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left : 10.0, bottom: 5),
                            child : const Text(
                              'Mentions légales',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                                color: Color.fromARGB(255, 123, 143, 161),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.go("/politique_confidentialite");
                            },
                            child:Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.white,
                              child: Row(
                                children: const[
                                  Icon (
                                    Icons.account_balance_outlined,
                                  ),
                                  Text(
                                    '   Politique de confidentialité',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    )
                                  ),
                                ],
                              ),
                            )
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left : 10.0, bottom: 5),
                            child : const Text(
                              'Gestion du compte',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                                color: Color.fromARGB(255, 123, 143, 161),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child:Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.white,
                              child: Row(
                                children: const[
                                  Icon (
                                    Icons.account_balance_outlined,
                                  ),
                                  Text(
                                    '   Déconexion',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    )
                                  ),
                                ],
                              ),
                            )
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child:Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.white,
                              child: Row(
                                children: const[
                                  Icon (
                                    Icons.account_balance_outlined,
                                  ),
                                  Text(
                                    '   Désinscription',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    )
                                  ),
                                ],
                              ),
                            )
                          )
                        ]
                      )
                    )
                  ]
                ),
              )
            );
          } else if (snapshot.hasError) {
            return Text("Une erreur s'est produite : ${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
