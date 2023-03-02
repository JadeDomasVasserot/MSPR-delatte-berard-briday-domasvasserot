import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:arosaje/src/models/StatutPlante.dart';


Future<StatutPlante> getStatutPlante (int idStatutPlante) async {
  final response = await http
      .get(Uri.parse("https://arosaje-mspr.mrartemus.cloud/statut-plante/id/$idStatutPlante"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return StatutPlante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load StatutPlante');
  }
}


