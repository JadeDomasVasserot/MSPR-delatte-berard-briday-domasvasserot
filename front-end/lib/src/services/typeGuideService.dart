import 'dart:convert';
import 'package:arosaje/src/services/LoginService.dart';
import 'package:arosaje/src/models/TypeGuide.dart';
import 'package:http/http.dart' as http;

Future<List<TypeGuide>> getAllTypeGuide() async {
  // Retourne toutes les visites d'une plante
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.get(
      Uri.parse("https://arosaje-back.jadedomasvasserot.com/type-guide/all"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
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
