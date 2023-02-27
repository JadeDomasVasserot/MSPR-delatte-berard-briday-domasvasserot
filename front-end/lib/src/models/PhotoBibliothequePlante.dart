import 'package:arosaje/src/models/BibliothequePlante.dart';

class PhotoBibliothequePlante {
  final int id;
  final String photo;
  final BibliothequePlante bibliothequePlante;

  const PhotoBibliothequePlante({
    required this.id,
    required this.photo,
    required this.bibliothequePlante,
  });

  factory PhotoBibliothequePlante.fromJson(Map<String, dynamic> json) {
    return PhotoBibliothequePlante(
        id: json['id'],
        photo: json['photo'],
        bibliothequePlante: BibliothequePlante.fromJson(json['bibliothequePlante'])
    );
  }

  static List<PhotoBibliothequePlante> listFromJson(List<dynamic> parsedJson) {

    List<PhotoBibliothequePlante> photoBibliothequePlantes = <PhotoBibliothequePlante>[];
    for (var photoBibliothequePlante in  parsedJson) {
      photoBibliothequePlantes.add(PhotoBibliothequePlante.fromJson(photoBibliothequePlante));
    }
    return photoBibliothequePlantes;
  }

}