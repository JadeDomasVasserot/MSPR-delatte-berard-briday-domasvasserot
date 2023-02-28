import 'package:arosaje/src/models/PhotoPlante.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/services/myPlanteService.dart';
import 'package:arosaje/src/services/photoPlanteService.dart';

import '../components/BottomBarComponent.dart';

class MyPlantesScreen extends StatefulWidget {
  const MyPlantesScreen({Key? key}) : super(key: key);

  @override
  State<MyPlantesScreen> createState() => _MyPlantesScreen();
}


class _MyPlantesScreen extends State<MyPlantesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Plante>>(
      future: getMyPlantes(1),//Mettre ID session 
      builder: (BuildContext context, AsyncSnapshot<List<Plante>> snapshot) {
        if (snapshot.hasData) {
          // Si la requête a réussi, on construit la ListView avec les données reçues
          final List<Plante> plantes = snapshot.data?? [];
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
                        for (Plante plante in plantes)
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
                                  context.go("/my_plante/${plante.id}");
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(bottom : 4),
                                      child: Text('${plante.bibliothequePlante.nom}',
                                        style: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black
                                        )
                                      )
                                    ),
                                    FutureBuilder<PhotoPlante>(
                                      future: getLastPhotoPlante(plante.id),
                                      builder: (BuildContext context, AsyncSnapshot<PhotoPlante> snapshot) {
                                        if (snapshot.hasData) {
                                          final   PhotoPlante photoPlante = snapshot.data!;
                                          return Container(
                                            child: Expanded(
                                              child :Image.asset('photo-plante/${photoPlante.photo}')
                                            )
                                          );
                                        }else if (snapshot.hasError) {
                                          return Container(
                                            child: Expanded(
                                              child :Image.asset('logo_app.png')
                                            )
                                          );
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      }
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
                                          child: Text('${plante.bibliothequePlante.typePlante.nom}',
                                            style: const TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15,
                                              color: Colors.black
                                            )
                                          )
                                        ),
                                      ],)
                                    )
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
        } else if (snapshot.hasError) {
          return Text("Une erreur s'est produite : ${snapshot.error}");
        } else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}


