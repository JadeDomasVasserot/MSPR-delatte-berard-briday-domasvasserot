class PhotoBibliothequePlante {
  final int id;
  final String photo;
  final String bibliothequePlante;

  const PhotoBibliothequePlante({
    required this.id,
    required this.photo,
    required this.bibliothequePlante,
  });

  factory PhotoBibliothequePlante.fromJson(Map<String, dynamic> json) {
    return PhotoBibliothequePlante(
        id: json['id'],
        photo: json['photo'],
        bibliothequePlante: json['bibliothequePlante']
    );
  }
}