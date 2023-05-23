import 'dart:convert';
import 'package:arosaje/src/models/Personne.dart';
import 'package:http/http.dart' as http;
import 'package:arosaje/src/services/LoginService.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:arosaje/src/models/Plante.dart';

Future<List<GardePlante>> getGardePlanteByPlante(int idPlante) async {
  // Retourne toutes les gardes d'une plante
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.get(
      Uri.parse(
          "https://arosaje-back.jadedomasvasserot.com/garde-plante/all/garde/byPlante/$idPlante"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
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
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.delete(
      Uri.parse(
          "https://arosaje-back.jadedomasvasserot.com/garde-plante/delete/$id"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
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

Future<List<GardePlante>> getGardePlanteByUser() async {
  // Retourne toutes les gardes d'un user
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  int? id = int.tryParse(idUser);
  final response = await http.get(
      Uri.parse(
          "https://arosaje-back.jadedomasvasserot.com/garde-plante/all/byGardien/$id"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
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
  // Retourne une garde*
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.get(
      Uri.parse(
          "https://arosaje-back.jadedomasvasserot.com/garde-plante/id/$idGardePlante"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
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
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  print(jwt);
  final response = await http.get(
      Uri.parse(
          "https://arosaje-back.jadedomasvasserot.com/garde-plante/all/byAGarder"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
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
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.post(
    Uri.parse("https://arosaje-back.jadedomasvasserot.com/garde-plante/add"),
    headers: {
      'accept': '*/*',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $jwt',
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
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.put(
    Uri.parse("https://arosaje-back.jadedomasvasserot.com/garde-plante/update"),
    headers: {
      'accept': '*/*',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $jwt',
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
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.put(
    Uri.parse(
        "https://arosaje-back.jadedomasvasserot.com/garde-plante/${id}/update/gardien/${gardien.id}/status"),
    headers: {
      'accept': '*/*',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $jwt',
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
