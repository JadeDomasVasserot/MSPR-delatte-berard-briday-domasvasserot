class Plante {
  final int id;
  final String localisation;
  final String nom;
  final String bilothequePlante;
  final String proprietaire;
  final String statut;

  const Plante({
    required this.id,
    required this.localisation,
    required this.nom,
    required this.bilothequePlante,
    required this.proprietaire,
    required this.statut,
  });

  factory Plante.fromJson(Map<String, dynamic> json) {
    return Plante(
      id: json['id'],
      localisation: json['localisation'],
      nom: json['nom'],
      bilothequePlante: json['bilothequePlante'],
      proprietaire: json['proprietaire'],
      statut: json['statut'],
    );
  }
}
