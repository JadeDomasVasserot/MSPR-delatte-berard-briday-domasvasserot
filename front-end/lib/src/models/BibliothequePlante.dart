import 'package:arosaje/src/models/GuidePlante.dart';
import 'package:flutter/material.dart';

import 'TypePlante.dart';

class BibliothequePlante {
  final int id;
  final String nom;
  final GuidePlante guidePlante;
  final TypePlante typePlante;


  const BibliothequePlante({
    required this.id,
    required this.nom,
    required this.guidePlante,
    required this.typePlante
  });

  static ListView getListPlantes(List<BibliothequePlante> bibliothequePlante)
  {
    List<Widget> list = [];
    for(var i = 0; i < bibliothequePlante.length; i++){
      list.add(Card(
        child: Column(
            children: <Widget> [
              ListTile(
                //leading: Image.network(),
                title: Text(bibliothequePlante[i].nom),
                subtitle: Text(bibliothequePlante[i].nom),
              ),
            ]
        ),
      ));
    }
    return ListView(children: list);
  }
  static List<BibliothequePlante> listFromJson(List<dynamic> parsedJson) {

    List<BibliothequePlante> bibliothequePlantes = <BibliothequePlante>[];
    for (var bibliothequePlante in  parsedJson) {
      bibliothequePlante.add(BibliothequePlante.fromJson(bibliothequePlante));
    }
    return bibliothequePlantes;
  }

  factory BibliothequePlante.fromJson(Map<String, dynamic> json) {
    return BibliothequePlante(
      id: json['id'],
      nom: json['nom'],
      guidePlante: GuidePlante.fromJson(json['guidePlante']),
      typePlante: TypePlante.fromJson(json['typePlante'])
    );
  }
}
