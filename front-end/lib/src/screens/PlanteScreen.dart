import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/services/photoPlanteService.dart';
import 'package:arosaje/src/services/gardePlanteService.dart';
import 'package:arosaje/src/models/PhotoPlante.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/BottomBarComponent.dart';
import 'package:arosaje/src/services/statutService.dart';
import 'package:arosaje/src/services/personneService.dart';
import 'package:intl/intl.dart';


import '../components/BottomBarComponent.dart';

class PlanteScreen extends StatefulWidget {
  final int id;
  const PlanteScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<PlanteScreen> createState() => _PlanteScreen();
}


class _PlanteScreen extends State<PlanteScreen> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) { 
      try {
        Personne gardien = await getUser(1); // Mettre id Session
        StatutPlante statut = await getStatutPlante(2);
        GardePlante gardePlante = await getGardePlante(widget.id);
        GardePlante gardePlante2 =
            await addGardienGardePlante (gardePlante.id, gardePlante.plante, gardePlante.dateDebut, gardePlante.dateFin, statut, gardien);
      } catch (e) {
        print ('Il y a une erreur  quand on valide le formulaire');
      }
    }
  }

  @override
  Widget build(BuildContext context,) {
    return FutureBuilder<GardePlante>(
      future: getGardePlante(widget.id),
      builder: (BuildContext context, AsyncSnapshot<GardePlante> snapshot) {
        if (snapshot.hasData) {
          final gardePlante = snapshot.data! ;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255,131,189,117),
              title: Text('${gardePlante.plante.bibliothequePlante.nom}',
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )
                )
            ),
            body: Column(
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 0,
                  color: const Color.fromARGB(100, 233,239, 192),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 233,239, 192),
                    )
                  ),
                  child : Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        FutureBuilder<PhotoPlante>(
                          future: getLastPhotoPlante(gardePlante.plante.id),
                          builder: (BuildContext context, AsyncSnapshot<PhotoPlante> snapshot) {
                            if (snapshot.hasData) {
                              final PhotoPlante photoPlante = snapshot.data!;
                              return Container(
                                padding : const EdgeInsets.all(10),
                                child :Image.asset('photo-plante/${photoPlante.photo}',
                                  fit: BoxFit.cover,
                                )
                              );
                            }else if (snapshot.hasError) {
                              return Container(
                                padding : const EdgeInsets.all(10),
                                child :Image.asset('logo_app.png',
                                  fit: BoxFit.cover,
                                )
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          }
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
                              child: Text('${gardePlante.plante.bibliothequePlante.typePlante.nom}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
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
                              child: const Text('Lieux : ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )
                              )
                            ),
                            Container(
                              child: Text('${gardePlante.plante.proprietaire.adresse}, ${gardePlante.plante.proprietaire.cp} ${gardePlante.plante.proprietaire.ville}',
                              textAlign: TextAlign.left,
                                style: const TextStyle(
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
                              child: Text('${gardePlante.plante.localisation}',
                              textAlign: TextAlign.left,
                                style: const TextStyle(
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
                              child: Text('${gardePlante.plante.proprietaire.nom} ${gardePlante.plante.proprietaire.prenom}',
                              textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                )
                              )
                            )
                          ],)
                        ),
                        Container(
                          margin : const EdgeInsets.only(top : 10,right: 10, left : 10),
                          padding : const EdgeInsets.only(top : 10, bottom: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              top : BorderSide()
                            )
                          ),
                          child : Wrap( children :[// Garde
                            Wrap(children: [
                              Container(
                                child: const Text('Date : ',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                )
                              ),
                              Container(
                                child:Text('${DateFormat('dd/MM/yyyy').format(gardePlante.dateDebut)}',
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                )
                              ),
                              Container(
                                child: const Text(' au ',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                )
                              ),
                              Container(
                                child:  Text('${DateFormat('dd/MM/yyyy').format(gardePlante.dateFin)}',
                                  style:  const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: Colors.black
                                  )
                                )
                              ),
                            ]),
                            Container(
                              padding : const EdgeInsets.only(top : 10),
                              child : Row (children: [
                                Container(
                                  child: const Text('Statut : ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )
                                  )
                                ),
                                Container(
                                  child:  Text('${gardePlante.statut.nom}',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                    )
                                  )
                                )
                              ],)
                            ),
                            Container(
                              padding : const EdgeInsets.only(top : 10, bottom: 10),
                              child : Wrap (children: [
                                Container(
                                  padding : const EdgeInsets.only( right: 2),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      context.go("/profile/${gardePlante.plante.proprietaire.id}");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.black)
                                      )
                                    ),
                                    child: const Text('Voir profil propriétaire',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15,
                                        color: Colors.black
                                      )
                                    ),
                                  )
                                ),
                                Container(
                                  padding : const EdgeInsets.only(left : 2, right: 2),
                                  child: gardePlante.statut.id == 2 ?
                                    OutlinedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _submitForm();
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) => AlertDialog(
                                              title: const Text('Garder la plante'),
                                              content: const Text('Voulez vous garder cette plante ? '),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    context.go("/home"); 
                                                  }                ,
                                                  child: const Text('OUI'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    context.go("/");
                                                  },
                                                  child: const Text('NON'),
                                                )
                                              ]
                                            )
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(color: Colors.black)
                                        )
                                      ),
                                      child: const Text('Garder',
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                          color: Colors.black
                                        )
                                      ),
                                    )
                                  :const Text('')
                                ),
                                FutureBuilder<Personne>(
                                  future: getUser(2), // ID session 
                                  builder: (BuildContext context, AsyncSnapshot<Personne> snapshot) {
                                    if (snapshot.hasData) {
                                      final Personne personne = snapshot.data! ;
                                      return Container(
                                        padding : const EdgeInsets.only( right: 2),
                                        child: personne.role.id == 2 || personne.role.id == 3 || personne.role.id == 4?
                                          OutlinedButton(
                                            onPressed: () {
                                              context.go("/create/commentaire/${gardePlante.plante.id}");
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                side: BorderSide(color: Colors.black)
                                              )
                                            ),
                                            child: const Text('Ajouter commentaire',
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
                              ])
                            ),
                          ]),
                        ),
                      ]
                    )
                  )
                ),
              ],
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


