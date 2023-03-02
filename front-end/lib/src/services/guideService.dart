import 'dart:convert';
import 'package:arosaje/src/models/GuidePlante.dart';
import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/TypeGuide.dart';
import 'package:http/http.dart' as http;


Future<List<GuidePlante>> getGuideByPlante (int idPlante) async { // Retourne toutes les visites d'une plante
  final response = await http
      .get(Uri.parse("https://arosaje-mspr.mrartemus.cloud/guide-plante/all/byPlante/$idPlante"));
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


Future<GuidePlante> addGuide (String titre, String description,  BibliothequePlante bibliothequePlante, TypeGuide typeGuide) async {
  try {
    final response = await http.post(
      Uri.parse("https://arosaje-mspr.mrartemus.cloud/guide-plante/add"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'titre': titre,
        'description': description,
        'bibliothequePlante' : bibliothequePlante.toJson(),
        'typeGuide' : typeGuide.toJson(),
      }),
    );  
    return GuidePlante.fromJson(jsonDecode(response.body));
  } catch (e) {
    print (e);
    throw Exception('Failed to add GardePlante');
  }
}





