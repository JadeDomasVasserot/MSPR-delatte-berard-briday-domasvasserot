import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:arosaje/src/models/GardePlante.dart';

Future<GardePlante> getGardePlanteByPlante (int idPlante) async {
  final response = await http
      .get(Uri.parse("http://127.0.0.1:9000/garde-plante/id/byPlante/$idPlante"));
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