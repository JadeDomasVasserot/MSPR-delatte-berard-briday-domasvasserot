import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/BottomBarComponent.dart';

class PolitiqueConfidentialiteScreen extends StatefulWidget {
  const PolitiqueConfidentialiteScreen({Key? key}) : super(key: key);
 
  @override
  State<PolitiqueConfidentialiteScreen> createState() => _PolitiqueConfidentialiteScreen();
}

class _PolitiqueConfidentialiteScreen extends State<PolitiqueConfidentialiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            context.go("/configuration");
          },
        ),
        title : const Text('Politique de cofidentialité',
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
      body: SingleChildScrollView(
        child : Container(
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
                        'Collecte de données personnelles : ',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 123, 143, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        "Lors de l'utilisation de l'application, nous collectons les données personnelles suivantes : \n"
                        "     - Les photos des plantes que vous souhaitez faire garder\n"
                        "     - Les photos prises par les gardiens de plantes après chaque séance d'entretien\n"
                        "     - Votre nom, adresse et e-mail pour vous contacter au sujet de la garde de plantes\n",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        'Utilisation des données personnelles : ',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 123, 143, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        "Nous utilisons les données personnelles collectées pour les finalités suivantes :\n"
                        "     - Permettre à des botanistes de fournir des conseils d'entretien appropriés pour les plantes\n"
                        "     - Permettre aux utilisateurs de se contacter pour coordonner la garde des plantes\n"
                        "     - Permettre aux botanistes de chercher des plantes pour fournir des conseils d'entretien\n",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        'Sécurité des données personnelles : ',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 123, 143, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        "Nous prenons des mesures de sécurité pour protéger vos données personnelles contre tout accès non "
                        "autorisé, altération, divulgation ou destruction. Les données sont stockées sur des serveurs " 
                        "sécurisés et accessibles uniquement aux personnes autorisées.\n",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        'Durée de conservation des données personnelles : ',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 123, 143, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        "Nous conservons les données personnelles collectées pendant la durée nécessaire pour atteindre les "
                        "finalités pour lesquelles elles ont été collectées. Les photos des plantes peuvent être conservées "
                        "pendant toute la durée de leur garde, et les données de contact seront conservées aussi longtemps "
                        "que nécessaire pour permettre la coordination entre les utilisateurs.\n",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        'Partage des données personnelles : ',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 123, 143, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        "Nous ne partageons pas vos données personnelles avec des tiers sans votre consentement explicite, "
                        "sauf si cela est nécessaire pour respecter une obligation légale ou pour protéger nos droits ou "
                        "ceux d'autrui.\n",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        'Droits des utilisateurs : ',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 123, 143, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        "Vous avez le droit d'accéder à vos données personnelles, de les rectifier, de les effacer ou de "
                        "les limiter, ainsi que de vous opposer à leur traitement ou de demander leur portabilité. Vous "
                        "pouvez exercer ces droits en nous contactant à l'adresse e-mail fournie dans l'application.\n",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        'Modifications de la politique de confidentialité : ',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 123, 143, 161),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left : 10.0, bottom: 5),
                      child : const Text(
                        "Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment."
                        "Les modifications seront publiées dans l'application et nous vous recommandons de les consulter "
                        "régulièrement.\n",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ]
                )
              )
            ]
          ),
        )
      )
    );
  }
}
