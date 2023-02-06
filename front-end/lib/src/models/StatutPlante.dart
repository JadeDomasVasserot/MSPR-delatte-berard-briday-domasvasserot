class StatutPlante {
  final int id;
  final String nom;

  const StatutPlante({
    required this.id,
    required this.nom,
  });

  factory StatutPlante.fromJson(Map<String, dynamic> json) {
    return StatutPlante(
        id: json['id'],
        nom: json['nom']
    );
  }
}