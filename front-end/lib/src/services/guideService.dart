import 'dart:convert';
import 'package:arosaje/src/models/GuidePlante.dart';
import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/TypeGuide.dart';
import 'package:http/http.dart' as http;
import 'package:arosaje/src/services/LoginService.dart';

Future<List<GuidePlante>> getGuideByPlante(int idPlante) async {
  // Retourne toutes les visites d'une plante
  final jwt = await getJWT();
  final response = await http.get(
      Uri.parse("http://127.0.0.1:9000/guide-plante/all/byPlante/$idPlante"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return GuidePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load getGuideByPlante');
  }
}

Future<GuidePlante> addGuide(String titre, String description,
    BibliothequePlante bibliothequePlante, TypeGuide typeGuide) async {
  try {
    final jwt = await getJWT();
    final response = await http.post(
      Uri.parse("http://127.0.0.1:9000/guide-plante/add"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      },
      body: jsonEncode(<String, dynamic>{
        'titre': titre,
        'description': description,
        'bibliothequePlante': bibliothequePlante.toJson(),
        'typeGuide': typeGuide.toJson(),
      }),
    );
    return GuidePlante.fromJson(jsonDecode(response.body));
  } catch (e) {
    print(e);
    throw Exception('Failed to add GardePlante');
  }
}
