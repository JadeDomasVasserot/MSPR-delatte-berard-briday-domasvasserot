import 'dart:convert';
import 'package:arosaje/src/models/Commentaire.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:http/http.dart' as http; 

import 'package:arosaje/src/models/Plante.dart';


Future<Commentaire> addCommentaire (String titre, String description, Personne auteur, GardePlante gardePlante) async {
    try {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:9000/commentaire/add"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'titre' : titre,
        'description': description,
        'auteur' : auteur.toJson(),
        'gardePlante' : gardePlante.toJson(),
      }),
    );
    return Commentaire.fromJson(jsonDecode(response.body));
  } catch (e) {
    throw Exception('Failed to add Commentaire');
  }
}



Future<List<Commentaire>> getCommentaireByPlante (int idPlante) async { // Retourne toutes les commentaire d'une plante
  final response = await http
      .get(Uri.parse("http://127.0.0.1:9000/commentaire/all/byGardePlante/$idPlante"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return Commentaire.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}