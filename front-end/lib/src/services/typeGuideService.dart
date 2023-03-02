import 'dart:convert';

import 'package:arosaje/src/models/TypeGuide.dart';
import 'package:http/http.dart' as http;


Future<List<TypeGuide>> getAllTypeGuide () async { // Retourne toutes les visites d'une plante
  final response = await http
      .get(Uri.parse("https://arosaje-mspr.mrartemus.cloud/type-guide/all"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return TypeGuide.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load getGuideByPlante');
  }
}





