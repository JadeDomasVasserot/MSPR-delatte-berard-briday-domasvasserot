class TypeGuide {
  final int id;
  final String nom;

  const TypeGuide({
    required this.id,
    required this.nom,
  });

  factory TypeGuide.fromJson(Map<String, dynamic> json) {
    return TypeGuide(
        id: json['id'],
        nom: json['nom']
    );
  }
}