import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/personneService.dart';

import '../components/BottomBarComponent.dart';

class ModifyPlanteScreen extends StatefulWidget {
  const ModifyPlanteScreen({Key? key}) : super(key: key);

  @override
  State<ModifyPlanteScreen> createState() => _ModifyPlanteScreen();
}


class _ModifyPlanteScreen extends State<ModifyPlanteScreen> {
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
        title: const Text('Modifier ma plante',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )
          )
      ),
      body: Center(
        
      ),
      bottomNavigationBar: const BottomBarComponent()
    );
  }
}


