import 'dart:convert';
import 'package:arosaje/src/models/Commentaire.dart';
import 'package:http/http.dart' as http;
import 'package:arosaje/src/services/LoginService.dart';
import 'package:arosaje/src/models/VisitePlante.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/models/GardePlante.dart';

Future<VisitePlante> addVisite(Personne gardien, DateTime dateVisite,
    Plante plante, GardePlante gardePlante, Commentaire commentaire) async {
  try {
    final idUser = await getUserId();
    final jwt = await getJWT(idUser);
    final response = await http.post(
      Uri.parse("http://127.0.0.1:9000/visite-plante/add"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      },
      body: jsonEncode(<String, dynamic>{
        'gardien': gardien.toJson(),
        'dateVisite': dateVisite.toIso8601String(),
        'plante': plante.toJson(),
        'gardePlante': gardePlante.toJson(),
        'commentaire': commentaire.toJson(),
      }),
    );
    return VisitePlante.fromJson(jsonDecode(response.body));
  } catch (e) {
    print(e);
    throw Exception('Failed to add GardePlante');
  }
}

Future<VisitePlante> updateVisite(
    Personne gardien,
    DateTime dateVisite,
    Plante plante,
    GardePlante gardePlante,
    Commentaire commentaire,
    String photo) async {
  try {
    final idUser = await getUserId();
    final jwt = getJWT(idUser);
    final response = await http.put(
      Uri.parse("http://127.0.0.1:9000/visite-plante/update"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      },
      body: jsonEncode(<String, dynamic>{
        'gardien': gardien.toJson(),
        'dateVisite': dateVisite.toIso8601String(),
        'plante': plante.toJson(),
        'gardePlante': gardePlante.toJson(),
        'commentaire': commentaire.toJson(),
        'photo': photo,
      }),
    );
    return VisitePlante.fromJson(jsonDecode(response.body));
  } catch (e) {
    print(e);
    throw Exception('Failed to add GardePlante');
  }
}

Future<List<VisitePlante>> getVisiteByGarde(int idGarde) async {
  // Retourne toutes les visites d'une plante
  final idUser = await getUserId();
  final jwt = getJWT(idUser);
  final response = await http.get(
      Uri.parse("http://127.0.0.1:9000/visite-plante/all/byGarde/$idGarde"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return VisitePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load VisiteByGarde');
  }
}

Future<VisitePlante> getVisite(int idVisite) async {
  // Retourne toutes les visites d'une plante
  final idUser = await getUserId();
  final jwt = getJWT(idUser);
  final response = await http.get(
      Uri.parse("http://127.0.0.1:9000/visite-plante/id/$idVisite"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return VisitePlante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load VisiteByGarde');
  }
}
