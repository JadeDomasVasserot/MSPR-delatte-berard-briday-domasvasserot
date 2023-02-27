import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/TypeGuide.dart';

class GuidePlante {
  final int id;
  final String description;
  final String titre;
  final TypeGuide typeGuide;
  final BibliothequePlante bibliothequePlante;

  const GuidePlante({
    required this.id,
    required this.description,
    required this.titre,
    required this.typeGuide,
    required this.bibliothequePlante,
  });

  factory GuidePlante.fromJson(Map<String, dynamic> json) {
    return GuidePlante(
        id: json['id'],
        description: json['description'],
        titre: json['titre'],
        typeGuide: TypeGuide.fromJson(json['typeGuide']),
        bibliothequePlante: BibliothequePlante.fromJson(json['bibliothequePlante'])
    );
  }
}