import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arosaje/src/services/LoginService.dart';
import 'package:arosaje/src/models/Personne.dart';

Future<Personne> getUser(int idUser) async {
  final jwt = await getJWT();
  final response = await http
      .get(Uri.parse("http://127.0.0.1:9000/personne/id/$idUser"), headers: {
    'accept': '*/*',
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $jwt',
  });
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
