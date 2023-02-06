class GardePlante {
  final int id;
  final DateTime dateDebut;
  final DateTime dateFin;
  final String gardien;
  final String plante;

  const GardePlante({
    required this.id,
    required this.dateDebut,
    required this.dateFin,
    required this.gardien,
    required this.plante,
  });

  factory GardePlante.fromJson(Map<String, dynamic> json) {
    return GardePlante(
        id: json['id'],
        dateDebut: json['dateDebut'],
        dateFin: json['dateFin'],
        gardien: json['gardien'],
        plante: json['plante']);
  }
}
