import 'dart:convert';
import 'package:arosaje/src/models/GuidePlante.dart';
import 'package:http/http.dart' as http;


Future<List<GuidePlante>> getGuideByPlante (int idPlante) async { // Retourne toutes les visites d'une plante
  final response = await http
      .get(Uri.parse("http://127.0.0.1:9000/guide-plante/all/byPlante/$idPlante"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return GuidePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load VisiteByGarde');
  }
}





