class PhotoPlante {
  final int id;
  final String photo;
  final String plante;

  const PhotoPlante({
    required this.id,
    required this.photo,
    required this.plante,
  });

  factory PhotoPlante.fromJson(Map<String, dynamic> json) {
    return PhotoPlante(
        id: json['id'],
        photo: json['photo'],
        plante: json['plante']
    );
  }
}