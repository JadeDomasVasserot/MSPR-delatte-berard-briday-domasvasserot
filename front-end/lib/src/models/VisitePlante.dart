import 'package:arosaje/src/models/GardePlante.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/models/Plante.dart';

class VisitePlante {
  final int id;
  final DateTime dateVisite;
  final String photo;
  final GardePlante gardePlante;
  final Personne gardien;
  final Plante plante;

  const VisitePlante({
    required this.id,
    required this.dateVisite,
    required this.photo,
    required this.gardePlante,
    required this.gardien,
    required this.plante,
  });

  factory VisitePlante.fromJson(Map<String, dynamic> json) {
    return VisitePlante(
      id: json['id'],
      dateVisite: json['dateVisite'],
      photo: json['photo'],
      gardePlante: GardePlante.fromJson(json['gardePlante']),
      gardien: Personne.fromJson(json['gardien']),
      plante: Plante.fromJson(json['plante']),
    );
  }
}
