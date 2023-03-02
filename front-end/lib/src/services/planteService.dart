import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/Personne.dart';

Future<List<Plante>> getAllPlantes() async {
  final response = await http
      .get(Uri.parse("https://arosaje-mspr.mrartemus.cloud/plante/all"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return Plante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}

Future<Plante> getPlante (int idPlante) async {
  final response = await http
      .get(Uri.parse("https://arosaje-mspr.mrartemus.cloud/plante/id/$idPlante"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return Plante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}
 

Future<Plante> updatePlante (int id, String localisation, Personne proprietaire, BibliothequePlante bibliothequePlante) async {
  final response = await http.put(
    Uri.parse("https://arosaje-mspr.mrartemus.cloud/plante/update"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id' : id,
      'localisation': localisation,
      'proprietaire': proprietaire.toJson(),
      'bibliothequePlante': bibliothequePlante.toJson(),
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Plante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to add Plante');
  }
}