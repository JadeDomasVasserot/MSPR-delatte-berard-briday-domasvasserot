import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/personneService.dart';

import '../components/BottomBarComponent.dart';

class MyPlantesScreen extends StatefulWidget {
  const MyPlantesScreen({Key? key}) : super(key: key);

  @override
  State<MyPlantesScreen> createState() => _MyPlantesScreen();
}


class _MyPlantesScreen extends State<MyPlantesScreen> {
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
        title: const Text('Mes plantes',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )
          )
      ),
      body: Center(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    child: Container(
                      decoration: BoxDecoration(
                        color:  const Color.fromARGB(100, 233,239, 192),
                        border: Border.all(
                          color: const Color.fromARGB(255, 233,239, 192),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {
                          context.go("/my_plante");
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom : 4),
                              child: const Text('Ma petite plante',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black
                                )
                              )
                            ),
                            Container(
                              child: Expanded(
                                child :Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top : 4),
                              padding: const EdgeInsets.only(top : 2),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top : BorderSide()
                                )
                              ),
                              child : Row (children: [
                                Container(
                                  child: const Text('Type : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('mort',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                              ],)
                            ),
                            Container(
                              child : Row (children: [
                                Container(
                                  child: const Text('Status : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('Disponible',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                              ],)
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: const BottomBarComponent()
    );
  }
}


