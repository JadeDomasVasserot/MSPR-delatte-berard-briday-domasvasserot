class GuidePlante {
  final int id;
  final String description;
  final String titre;
  final String typeGuide;

  const GuidePlante({
    required this.id,
    required this.description,
    required this.titre,
    required this.typeGuide,
  });

  factory GuidePlante.fromJson(Map<String, dynamic> json) {
    return GuidePlante(
        id: json['id'],
        description: json['description'],
        titre: json['titre'],
        typeGuide: json['typeGuide']
    );
  }
}