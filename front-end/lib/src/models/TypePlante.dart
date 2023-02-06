class TypePlante {
  final int id;
  final String description;
  final String nom;

  const TypePlante({
    required this.id,
    required this.description,
    required this.nom,
  });

  factory TypePlante.fromJson(Map<String, dynamic> json) {
    return TypePlante(
        id: json['id'],
        description: json['description'],
        nom: json['nom']
    );
  }
}