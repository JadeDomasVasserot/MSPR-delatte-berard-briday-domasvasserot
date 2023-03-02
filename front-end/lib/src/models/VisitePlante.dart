import 'package:arosaje/src/models/Commentaire.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/models/Plante.dart';

class VisitePlante {
  final int id;
  final DateTime dateVisite;
  final String?  photo;
  final GardePlante gardePlante;
  final Personne gardien;
  final Plante plante;
  final Commentaire commentaire;


  const VisitePlante({
    required this.id,
    required this.dateVisite,
    required this.gardePlante,
    required this.gardien,
    this.photo,
    required this.plante,
    required this.commentaire,
  });

  factory VisitePlante.fromJson(Map<String, dynamic> json) {
    return VisitePlante(
      id: json['id'],
      dateVisite: DateTime.parse(json['dateVisite']),
      gardePlante: GardePlante.fromJson(json['gardePlante']),
      gardien: Personne.fromJson(json['gardien']),
      plante: Plante.fromJson(json['plante']),
      commentaire: Commentaire.fromJson(json['commentaire']),
      photo : json['photo']
    );
  }

  static List<VisitePlante> listFromJson(List<dynamic> parsedJson) {

    List<VisitePlante> visitePlantes = <VisitePlante>[];
    for (var visitePlante in  parsedJson) {
      visitePlantes.add(VisitePlante.fromJson(visitePlante));
    } 
    return visitePlantes;
  }
}
