import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/personneService.dart';
import 'package:arosaje/src/services/guideService.dart';
import 'package:arosaje/src/models/GuidePlante.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/BottomBarComponent.dart';
import 'package:arosaje/src/models/PhotoBibliothequePlante.dart';
import 'package:arosaje/src/services/BibliothequePlanteService.dart';


class BibliothequePlanteScreen extends StatefulWidget {
  final int id;
  const BibliothequePlanteScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<BibliothequePlanteScreen> createState() => _BibliothequePlanteScreen();
}


class _BibliothequePlanteScreen extends State<BibliothequePlanteScreen> {
  @override
  Widget build(BuildContext context,) {
    return FutureBuilder<BibliothequePlante>(
      future: getOneBibliothequePlante(widget.id),
      builder: (BuildContext context, AsyncSnapshot<BibliothequePlante> snapshot) {
        if (snapshot.hasData) {
          final BibliothequePlante plante = snapshot.data! ;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255,131,189,117),
              title: Text('${plante.nom}',
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )
                )
            ),
            body: CustomScrollView( 
                primary: false,
                slivers:<Widget>[
                  SliverToBoxAdapter(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Align(
                          alignment: Alignment.centerLeft,
                          child : Card(
                            margin: const EdgeInsets.all(20),
                            elevation: 0,
                            color: const Color.fromARGB(100, 233,239, 192),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 233,239, 192),
                              )
                            ),
                            child: FutureBuilder<List<GuidePlante>>(
                              future: getGuideByPlante(plante.id),
                              builder: (BuildContext context, AsyncSnapshot<List<GuidePlante>> snapshot) {
                                if (snapshot.hasData) {
                                  final   List<GuidePlante> guides = snapshot.data!;
                                  return Column(
                                    children: [
                                      FutureBuilder<PhotoBibliothequePlante>(
                                        future: getPhotoBibliothequePlante(plante.id),
                                        builder: (BuildContext context, AsyncSnapshot<PhotoBibliothequePlante> snapshot) {
                                          if (snapshot.hasData) {
                                            final   PhotoBibliothequePlante photoPlante = snapshot.data!;
                                            return Container(
                                              margin: const EdgeInsets.all(4),
                                              child :Image.asset('photo-plante-bibliotheque/${photoPlante.photo}')
                                            );
                                          }else if (snapshot.hasError) {
                                            return Text("Une erreur s'est produite : ${snapshot.error}");
                                          } else {
                                            return CircularProgressIndicator();
                                          } 
                                        }
                                      ),
                                      Container(
                                        margin : const EdgeInsets.only(right: 10, left : 10, top : 10),
                                        padding : const EdgeInsets.only(top : 10),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top : BorderSide()
                                          )
                                        ),
                                        child : Wrap (children: [
                                          Container(
                                            child: const Text('Description : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              )
                                            )
                                          ),
                                          Container(
                                            child: Text('${plante.description}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              ),
                                              softWrap: true,
                                            )
                                          )
                                        ],)
                                      ),
                                      Container(
                                        margin : const EdgeInsets.only(right: 10, left : 10),
                                        padding : const EdgeInsets.only(top : 10),
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
                                            child: Text('${plante.typePlante.nom}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              ),
                                              softWrap: true,
                                            )
                                          )
                                        ],)
                                      ),
                                      Container(
                                        margin : const EdgeInsets.only(right: 10, left : 10),
                                        padding : const EdgeInsets.only(top : 10, bottom: 10),
                                        child : Wrap (children: [
                                          Container(
                                            child: const Text('Description du type : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                              softWrap: true,
                                            )
                                          ),
                                          Container(
                                            child:  Text('${plante.typePlante.description}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              )
                                            )
                                          )
                                        ],)
                                      ),
                                      for (GuidePlante guide in guides) 
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin : const EdgeInsets.only(right: 10, left : 10),
                                              padding : const EdgeInsets.only(top : 10),
                                              child : Row (children: [
                                                Container(
                                                  child: Text('${guide.typeGuide.nom}',
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                    softWrap: true,
                                                  )
                                                ),
                                              ],)
                                            ),
                                            Container(
                                              margin : const EdgeInsets.only(right: 10, left : 10),
                                              child:  Row (children: [
                                                Text('${guide.titre}',
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15,
                                                  ),
                                                  softWrap: true,
                                                )
                                              ]),
                                            ),
                                            Container(
                                              margin : const EdgeInsets.only(right: 10, left : 10),
                                              padding : const EdgeInsets.only(bottom: 10),
                                              child : Wrap (children: [
                                                Container(
                                                  child:  Text('${guide.description}',
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 15,
                                                    ),
                                                    softWrap: true,
                                                  )
                                                )
                                              ])
                                            ),
                                          ]
                                        ),
                                      FutureBuilder<Personne>(
                                        future: getUser(2), // ID session 
                                        builder: (BuildContext context, AsyncSnapshot<Personne> snapshot) {
                                          if (snapshot.hasData) {
                                            final Personne personne = snapshot.data! ;
                                            return Container(
                                              margin : const EdgeInsets.only(bottom: 10, right: 10),
                                              child: personne.role.id == 2 || personne.role.id == 3 || personne.role.id == 4?
                                                OutlinedButton(
                                                  onPressed: () {
                                                    context.go("/create/guide/${plante.id}");
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                      side: BorderSide(color: Colors.black)
                                                    )
                                                  ),
                                                  child: const Text('Ajouter un conseil',
                                                    style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 15,
                                                      color: Colors.black
                                                    )
                                                  ),
                                                )
                                              : null
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text('');
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        } 
                                      ),
                                    ],
                                  );
                                }else if (snapshot.hasError) {
                                  return Column(
                                    children: [
                                      FutureBuilder<PhotoBibliothequePlante>(
                                        future: getPhotoBibliothequePlante(plante.id),
                                        builder: (BuildContext context, AsyncSnapshot<PhotoBibliothequePlante> snapshot) {
                                          if (snapshot.hasData) {
                                            final   PhotoBibliothequePlante photoPlante = snapshot.data!;
                                            return Container(
                                              child :Image.asset('photo-plante-bibliotheque/${photoPlante.photo}')
                                            );
                                          }else if (snapshot.hasError) {
                                            return Text("Une erreur s'est produite : ${snapshot.error}");
                                          } else {
                                            return CircularProgressIndicator();
                                          } 
                                        }
                                      ),
                                      Container(
                                        margin : const EdgeInsets.only(right: 10, left : 10, top : 10),
                                        padding : const EdgeInsets.only(top : 10),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top : BorderSide()
                                          )
                                        ),
                                        child : Wrap (children: [
                                          Container(
                                            child: const Text('Description : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              )
                                            )
                                          ),
                                          Container(
                                            child: Text('${plante.description}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              ),
                                              softWrap: true,
                                            )
                                          )
                                        ],)
                                      ),
                                      Container(
                                        margin : const EdgeInsets.only(right: 10, left : 10),
                                        padding : const EdgeInsets.only(top : 10),
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
                                            child: Text('${plante.typePlante.nom}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              ),
                                              softWrap: true,
                                            )
                                          )
                                        ],)
                                      ),
                                      Container(
                                        margin : const EdgeInsets.only(right: 10, left : 10),
                                        padding : const EdgeInsets.only(top : 10, bottom: 10),
                                        child : Wrap (children: [
                                          Container(
                                            child: const Text('Description du type : ',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                              softWrap: true,
                                            )
                                          ),
                                          Container(
                                            child:  Text('${plante.typePlante.description}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15,
                                              )
                                            )
                                          )
                                        ],)
                                      ),
                                      FutureBuilder<Personne>(
                                        future: getUser(2), // ID session 
                                        builder: (BuildContext context, AsyncSnapshot<Personne> snapshot) {
                                          if (snapshot.hasData) {
                                            final Personne personne = snapshot.data! ;
                                            return Container(
                                              margin : const EdgeInsets.only(bottom: 10,right: 10),
                                              child: personne.role.id == 2 || personne.role.id == 3 || personne.role.id == 4?
                                                OutlinedButton(
                                                  onPressed: () {
                                                    context.go("/create/guide/${plante.id}");
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                      side: BorderSide(color: Colors.black)
                                                    )
                                                  ),
                                                  child: const Text('Ajouter un conseil',
                                                    style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 15,
                                                      color: Colors.black
                                                    )
                                                  ),
                                                )
                                              : null
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text('');
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        } 
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                } 
                              }
                            ),
                          ),
                         )
                      ]
                    )
                  )
                ]
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


