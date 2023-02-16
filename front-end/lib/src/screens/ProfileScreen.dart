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
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255,204,214, 166), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bonjour Jade !',
            style: TextStyle(
              
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )
          )
        ),
        body: Column(
          children: const <Widget>[
            NomCard(),
            AdressCard(),
            ButtonCard(),
          ],
        ),
        bottomNavigationBar: const BottomBarComponent()
      )  
    );
  }
}

class NomCard extends StatelessWidget {
  const NomCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
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
                      child: const Text('Domas-Vasserot',
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
                  child : Row (children: [
                    Container(
                      child: const Text('Prénom : ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      )
                    ),
                    Container(
                      child: const Text('Jade',
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
                  child : Row (children: [
                    Container(
                      child: const Text('E-mail : ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      )
                    ),
                    Container(
                      child: const Text('jade@epsi.fr',
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
                  child : Row (children: [
                    Container(
                      child: const Text('Nombre de garde : ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      )
                    ),
                    Container(
                      child: const Text('14',
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
                  child : Row (children: [
                    Container(
                      child: const Text('Role : ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      )
                    ),
                    Container(
                      child: const Text('Licorne',
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
      )
    );
  }
}

class AdressCard extends StatelessWidget {
  const AdressCard({super.key});

  @override
    Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child : Row (children: [
                Container(
                  child: const Text('Adresse : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                  )
                ),
              ])
            ),
            Container(
              child : Row (children: [
                Container(
                  child: const Text('XXX rue des je sais pas quoi ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                    )
                  )
                )
              ])
            ),
            Container(
              child : Row (children: [
                Container(
                  child: const Text('69009, Lyon ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                    )
                  )
                ),
              ])
            )
          ],
        ),
      )
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key});

  @override
    Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child : Row (children: [
                Spacer(),
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      debugPrint('Received click');
                    },
                    child: const Text('Modifier le Profil'),
                  )
                ),
                Spacer(),
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      debugPrint('Received click');
                    },
                    child: const Text('Voir mes plantes'),
                  )
                ),
                Spacer(),
              ])
            ),
          ],
        ),
      )
    );
  }
}

