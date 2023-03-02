import 'package:arosaje/src/models/GardePlante.dart';

import 'Personne.dart';

class Commentaire {
  final int id;
  final String description;
  final String titre;
  final String? photo;
  final Personne auteur;
  final GardePlante gardePlante;

  const Commentaire({
    required this.id,
    required this.description,
    required this.titre,
    this.photo,
    required this.auteur,
    required this.gardePlante,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description' :  description,
      'titre' : titre, 
      'poto' : photo, 
      'auteur' : auteur.toJson(),
      'gardePlante' :  gardePlante.toJson(),
    };
  }
  factory Commentaire.fromJson(Map<String, dynamic> json) {
    return Commentaire(
      id: json['id'],
      description: json['description'],
      titre: json['titre'],
      photo: json['photo'],
      auteur: Personne.fromJson(json['auteur']),
      gardePlante: GardePlante.fromJson(json['gardePlante']),
    );
  }
  static List<Commentaire> listFromJson(List<dynamic> parsedJson) {

    List<Commentaire> commentaires = <Commentaire>[];
    for (var commentaire in  parsedJson) {
      commentaires.add(Commentaire.fromJson(commentaire));
    } 
    return commentaires ;
  }
}
