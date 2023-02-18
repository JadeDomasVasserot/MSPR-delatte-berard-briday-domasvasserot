import 'package:arosaje/src/models/Role.dart';

class Personne {
  final int id;
  final String adresse;
  final int cp;
  final String email;
  final String mdp;
  final String nom;
  final String prenom;
  final String ville;
  final Role role;

  const Personne({
    required this.id,
    required this.adresse,
    required this.cp,
    required this.email,
    required this.mdp,
    required this.nom,
    required this.prenom,
    required this.ville,
    required this.role,
  });

  static List<Personne> listFromJson(List<dynamic> parsedJson) {

    List<Personne> personne = <Personne>[];
    for (var personne in  parsedJson) {
      personne.add(Personne.fromJson(personne));
    } 
    return personne;
  }

  factory Personne.fromJson(Map<String, dynamic> json) {
    return Personne(
      id: json['id'],
      adresse: json['adresse'],
      cp: json['cp'], 
      email: json['email'],
      mdp: json['mdp'],
      nom: json['nom'],
      prenom: json['prenom'],
      ville: json['ville'],
      role: Role.fromJson(json['role']),
    );
  }
}
