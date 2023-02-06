import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/models/Plante.dart';

class GardePlante {
  final int id;
  final DateTime dateDebut;
  final DateTime dateFin;
  final Personne gardien;
  final Plante plante;

  const GardePlante({
    required this.id,
    required this.dateDebut,
    required this.dateFin,
    required this.gardien,
    required this.plante,
  });

  factory GardePlante.fromJson(Map<String, dynamic> json) {
    return GardePlante(
        id: json['id'],
        dateDebut: json['dateDebut'],
        dateFin: json['dateFin'],
        gardien: Personne.fromJson(json['gardien']),
        plante: Plante.fromJson(json['plante'])
    );
  }
}
