import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/models/Plante.dart';

import 'StatutPlante.dart';

class GardePlante {
  final int id;
  final DateTime dateDebut;
  final DateTime dateFin;
  final Personne gardien;
  final Plante plante;
  final StatutPlante statut;


  const GardePlante({
    required this.id,
    required this.dateDebut,
    required this.dateFin,
    required this.gardien,
    required this.plante,
    required this.statut,
  });

  factory GardePlante.fromJson(Map<String, dynamic> json) {
    return GardePlante(
        id: json['id'],
        dateDebut: DateTime.parse(json['dateDebut']),
        dateFin: DateTime.parse(json['dateFin']),
        gardien: Personne.fromJson(json['gardien']),
        plante: Plante.fromJson(json['plante']),
        statut: StatutPlante.fromJson(json['statut']),
    );
  }

  static List<GardePlante> listFromJson(List<dynamic> parsedJson) {

    List<GardePlante> gardePlantes = <GardePlante>[];
    for (var gardePlante in  parsedJson) {
      gardePlantes.add(GardePlante.fromJson(gardePlante));
    } 
    return gardePlantes;
  }

}
