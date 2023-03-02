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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom' : nom
    };
  }

  static List<TypeGuide> listFromJson(List<dynamic> parsedJson) {

    List<TypeGuide> typeGuides = <TypeGuide>[];
    for (var typeGuide in  parsedJson) {
      typeGuides.add(TypeGuide.fromJson(typeGuide));
    } 
    return typeGuides;
  }
}