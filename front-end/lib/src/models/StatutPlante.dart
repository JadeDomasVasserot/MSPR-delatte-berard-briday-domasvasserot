class Role {
  final int id;
  final String nom;

  const Role({
    required this.id,
    required this.nom,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
        id: json['id'],
        nom: json['nom']
    );
  }
}