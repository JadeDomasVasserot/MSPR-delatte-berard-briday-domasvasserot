import 'package:arosaje/src/models/Plante.dart';

import 'Personne.dart';

class Commentaire {
  final int id;
  final String description;
  final String photo;
  final String titre;
  final Personne auteur;
  final Plante plante;

  const Commentaire({
    required this.id,
    required this.description,
    required this.photo,
    required this.titre,
    required this.auteur,
    required this.plante,
  });

  factory Commentaire.fromJson(Map<String, dynamic> json) {
    return Commentaire(
      id: json['id'],
      description: json['description'],
      photo: json['photo'],
      titre: json['titre'],
      auteur: Personne.fromJson(json['auteur']),
      plante: Plante.fromJson(json['plante']),
    );
  }
}
