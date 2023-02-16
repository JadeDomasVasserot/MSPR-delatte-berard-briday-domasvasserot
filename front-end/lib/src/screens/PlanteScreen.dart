import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/personneService.dart';

import '../components/BottomBarComponent.dart';

class PlanteScreen extends StatefulWidget {
  const PlanteScreen({Key? key}) : super(key: key);

  @override
  State<PlanteScreen> createState() => _PlanteScreen();
}


class _PlanteScreen extends State<PlanteScreen> {
  @override
  Widget build(BuildContext context) {
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
        title: const Text('Nom de la plante',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )
          )
      ),
      body:SingleChildScrollView(
        child: Card(
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
            children: [
              Container(
                      padding: const EdgeInsets.all(20),
                      child: Expanded(
                        child :Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
                      )
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
                          child: const Text('JSP',
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                          child: const Text('Machin rue des bidules, 69001 Lyon',
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                          child: const Text('Status : ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )
                          )
                        ),
                        Container(
                          child: const Text('A garder',
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                          child: const Text('Propriétaire : ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )
                          )
                        ),
                        Container(
                          child: const Text('Janette Durant',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                            )
                          )
                        )
                      ],)
                    ),
              Container(
                      margin : const EdgeInsets.only(right: 10, left : 10),
                      padding : const EdgeInsets.only(top : 10, bottom: 20),
                      child : Row (children: [
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
                          child: const Text('25/02',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
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
                            )
                          )
                        ),
                        Container(
                          child: const Text('01/03',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                            )
                          )
                        )
                      ],)
                    ),
            ],
          ),
        )
      ),
      bottomNavigationBar: const BottomBarComponent()
    );
  }
}


