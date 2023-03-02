import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:arosaje/src/models/Personne.dart';

<<<<<<< HEAD
Future<Personne> getUser(int idUser) async {
  final response = await http.get(
      Uri.parse("https://arosaje-mspr.mrartemus.cloud/personne/id/$idUser"));
=======
Future<Personne> getUser (int idUser) async {
  final response = await http
      .get(Uri.parse("https://arosaje-mspr.mrartemus.cloud/personne/id/$idUser"));
>>>>>>> 6f14f2bbbd02dc0ee04b77579d7ee632d921dc24
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return Personne.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}
