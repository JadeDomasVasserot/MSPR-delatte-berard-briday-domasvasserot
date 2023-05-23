import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arosaje/src/services/LoginService.dart';
import 'package:arosaje/src/models/Plante.dart';

Future<List<Plante>> getMyPlantes() async {
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  int? id = int.tryParse(idUser);
  final response = await http.get(
      Uri.parse(
          "https://arosaje-back.jadedomasvasserot.com/plante/all/byUser/$id"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
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
