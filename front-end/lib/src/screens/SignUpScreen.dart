import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/services/SignUpService.dart' as SignUpService;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  int _selectedIndex = 0;
  final __nomController = TextEditingController();
  final __prenomController = TextEditingController();
  final __emailController = TextEditingController();
  final __mdpController = TextEditingController();
  final __villeController = TextEditingController();
  final __cpController = TextEditingController();
  final __adresseController = TextEditingController();

  @override
  void dispose() {
    __nomController.dispose();
    __prenomController.dispose();
    __emailController.dispose();
    __mdpController.dispose();
    __villeController.dispose();
    __cpController.dispose();
    __adresseController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arosaje',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Image.asset("assets/arosaje.png"),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextField(
                        controller: __prenomController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'Prenom',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: TextField(
                        controller: __nomController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'Nom',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: __emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: __mdpController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Mot de passe',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: __adresseController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Adresse',
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextField(
                        controller: __villeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'Ville',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: TextField(
                        controller: __cpController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'Code Postal',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('S\'inscrire'),
                    onPressed: () {
                      String data = '{';
                      data += '"firstname": "${__prenomController.text}",';
                      data += '"lastname": "${__nomController.text}",';
                      data += '"email": "${__emailController.text}",';
                      data += '"password": "${__mdpController.text}",';
                      data += '"cp": ${__cpController.text},';
                      data += '"ville": "${__villeController.text}",';
                      data += '"adresse": "${__adresseController.text}"';
                      data += '}';
                      SignUpService.addDataToDB(data);
                      context.go('/');
                    },
                  )),
              TextButton(
                onPressed: () => context.go("/"),
                child: Text(
                  'Vous avez déjà un compte ? CONNECTER-VOUS !',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        )));
  }
}
