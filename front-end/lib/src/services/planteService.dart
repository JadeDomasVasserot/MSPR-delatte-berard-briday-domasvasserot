import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arosaje/src/services/LoginService.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/Personne.dart';

Future<List<Plante>> getAllPlantes() async {
  final jwt = await getJWT();
  final response =
      await http.get(Uri.parse("http://127.0.0.1:9000/plante/all"), headers: {
    'accept': '*/*',
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $jwt',
  });
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

Future<Plante> getPlante(int idPlante) async {
  final jwt = await getJWT();
  final response = await http
      .get(Uri.parse("http://127.0.0.1:9000/plante/id/$idPlante"), headers: {
    'accept': '*/*',
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $jwt',
  });
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

Future<Plante> updatePlante(int id, String localisation, Personne proprietaire,
    BibliothequePlante bibliothequePlante) async {
  final jwt = await getJWT();
  final response = await http.put(
    Uri.parse("http://127.0.0.1:9000/plante/update"),
    headers: {
      'accept': '*/*',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $jwt',
    },
    body: jsonEncode(<String, dynamic>{
      'id': id,
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
