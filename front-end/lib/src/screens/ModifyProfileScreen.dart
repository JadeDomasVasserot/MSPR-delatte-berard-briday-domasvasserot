import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/personneService.dart';

import '../components/BottomBarComponent.dart';

class ModifyProfileScreen extends StatefulWidget {
  const ModifyProfileScreen({Key? key}) : super(key: key);

  @override
  State<ModifyProfileScreen> createState() => _ModifyProfileScreen();
}

class _ModifyProfileScreen extends State<ModifyProfileScreen> {
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
            backgroundColor: const Color.fromARGB(255, 131, 189, 117),
            title: const Text('Modifier mon profil :',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ))),
        body: SingleChildScrollView(),
        bottomNavigationBar: const BottomBarComponent());
  }
}
