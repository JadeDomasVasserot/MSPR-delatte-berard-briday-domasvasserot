import 'package:arosaje/src/models/Plante.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoPlante {
  final int id;
  final String photo;
  final Plante plante;

  const PhotoPlante({
    required this.id,
    required this.photo,
    required this.plante,
  });

  static ListView getLastPhotoPlantesByPlante(List<PhotoPlante> plantes)
  {
    List<Widget> list = [];
    for(var i = 0; i < plantes.length; i++){
      list.add(Card(
        child: Column(
            children: <Widget> [
              Image.network(plantes[i].photo)
            ]
        ),
      ));
    }
    return ListView(children: list);
  }

  static List<PhotoPlante> listFromJson(List<dynamic> parsedJson) {

    List<PhotoPlante> photoPlantes = <PhotoPlante>[];
    for (var photoPlante in  parsedJson) {
      photoPlantes.add(PhotoPlante.fromJson(photoPlante));
    }
    return photoPlantes;
  }

  factory PhotoPlante.fromJson(Map<String, dynamic> json) {
    return PhotoPlante(
        id: json['id'],
        photo: json['photo'],
        plante: Plante.fromJson(json['plante'])
    );
  }
}