import 'dart:convert';
import 'package:arosaje/src/models/Personne.dart';
import 'package:http/http.dart' as http;

import 'package:arosaje/src/models/GardePlante.dart';
import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:arosaje/src/models/Plante.dart';

Future<List<GardePlante>> getGardePlanteByPlante(int idPlante) async {
  // Retourne toutes les gardes d'une plante
  final response = await http.get(Uri.parse(
      "https://arosaje-mspr.mrartemus.cloud/garde-plante/all/garde/byPlante/$idPlante"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return GardePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}

Future<List<GardePlante>> deleteGardePlante(int id) async {
  // Retourne toutes les gardes d'une plante
  final response = await http.delete(Uri.parse(
      "https://arosaje-mspr.mrartemus.cloud/garde-plante/delete/$id"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return GardePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}

Future<List<GardePlante>> getGardePlanteByUser(int idUser) async {
  // Retourne toutes les gardes d'un user
  final response = await http.get(Uri.parse(
      "https://arosaje-mspr.mrartemus.cloud/garde-plante/all/byGardien/$idUser"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return GardePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}

Future<GardePlante> getGardePlante(int idGardePlante) async {
  // Retourne une garde
  final response = await http.get(Uri.parse(
      "https://arosaje-mspr.mrartemus.cloud/garde-plante/id/$idGardePlante"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return GardePlante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}

Future<List<GardePlante>> getPlantesAGarder() async {
  // Retourn les gardes a garder avec les plantes
  final response = await http.get(Uri.parse(
      "https://arosaje-mspr.mrartemus.cloud/garde-plante/all/byAGarder"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return GardePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}

Future<GardePlante> addGardePlante(
    Plante plante, DateTime debut, DateTime fin, StatutPlante statut) async {
  final response = await http.post(
    Uri.parse("https://arosaje-mspr.mrartemus.cloud/garde-plante/add"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'plante': plante.toJson(),
      'dateDebut': debut.toIso8601String(),
      'dateFin': fin.toIso8601String(),
      'statut': statut.toJson(),
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GardePlante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to add GardePlante');
  }
}

Future<GardePlante> updateGardePlante(int id, Plante plante, DateTime debut,
    DateTime fin, StatutPlante statut, Personne gardien) async {
  final response = await http.put(
    Uri.parse("https://arosaje-mspr.mrartemus.cloud/garde-plante/update"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': id,
      'plante': plante.toJson(),
      'dateDebut': debut.toIso8601String(),
      'dateFin': fin.toIso8601String(),
      'statut': statut.toJson(),
      'gardien': gardien.toJson(),
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GardePlante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to add Plante');
  }
}

Future<GardePlante> addGardienGardePlante(int id, Plante plante, DateTime debut,
    DateTime fin, StatutPlante statut, Personne gardien) async {
  final response = await http.put(
    Uri.parse(
        "https://arosaje-mspr.mrartemus.cloud/garde-plante/${id}/update/gardien/${gardien.id}/status"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': id,
      'plante': plante.toJson(),
      'dateDebut': debut.toIso8601String(),
      'dateFin': fin.toIso8601String(),
      'statut': statut.toJson(),
      'gardien': gardien.toJson(),
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GardePlante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to add Plante');
  }
}
