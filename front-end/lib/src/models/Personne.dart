class Commentaire {
  final int id;
  final String description;
  final String nom;
  final String photo;
  final String titre;
  final String auteur;
  final String plante;

  const Commentaire({
    required this.id,
    required this.description,
    required this.nom,
    required this.photo,
    required this.titre,
    required this.auteur,
    required this.plante,
  });

  factory Commentaire.fromJson(Map<String, dynamic> json) {
    return Commentaire(
      id: json['id'],
      description: json['description'],
      nom: json['nom'],
      photo: json['photo'],
      titre: json['titre'],
      auteur: json['auteur'],
      plante: json['plante'],
    );
  }
}
