import 'dart:convert';

import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/GuidePlante.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:arosaje/src/services/photoPlanteService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PhotoPlante.dart';

class Plante {
  final int id;
  final String localisation;
  final BibliothequePlante bibliothequePlante;
  final Personne proprietaire;
  final StatutPlante statut;

  const Plante({
    required this.id,
    required this.localisation,
    required this.bibliothequePlante,
    required this.proprietaire,
    required this.statut,
  });

  static ListView getListPlantes(List<Plante> plantes)
  {
    List<Widget> list = [];
    for(var i = 0; i < plantes.length; i++){
      var photo = getUrlOfPhotoPlante(plantes[i].id);

      list.add(Card(
        child: Column(
          children: <Widget> [
           // Image.network(photo.),
            ListTile(
              title: Text(plantes[i].bibliothequePlante.nom),
              subtitle: Text(plantes[i].bibliothequePlante.typePlante.description),
            ),
          ]
        ),
      ));
    }
    return ListView(children: list);
  }
  static List<Plante> listFromJson(List<dynamic> parsedJson) {

    List<Plante> plantes = <Plante>[];
    for (var plante in  parsedJson) {
        plantes.add(Plante.fromJson(plante));
    }
    return plantes;
  }

  factory Plante.fromJson(Map<String, dynamic> json) {
    return Plante(
      id: json['id'],
      localisation: json['localisation'],
      bibliothequePlante:  BibliothequePlante.fromJson(json['bibliothequePlante']),
      proprietaire: Personne.fromJson(json['proprietaire']),
      statut: StatutPlante.fromJson(json['statut']),
    );
  }
}
