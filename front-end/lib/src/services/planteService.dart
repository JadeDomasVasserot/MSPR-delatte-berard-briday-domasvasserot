import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:arosaje/src/models/Plante.dart';

Future<List<Plante>> getAllPlantes() async {
  final response = await http
      .get(Uri.parse("http://127.0.0.1:9000/plante/all"));
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

Future<List<Plante>> getPlantesAGarder() async {
  final response = await http
      .get(Uri.parse("http://127.0.0.1:9000/plante/a-garder/all"));
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