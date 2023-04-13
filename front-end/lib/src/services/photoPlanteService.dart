import 'dart:convert';
import 'package:arosaje/src/models/PhotoPlante.dart';
import 'package:http/http.dart' as http;
import 'package:arosaje/src/services/LoginService.dart';

Future<List<PhotoPlante>> getAllPhotoPlanteOfPlante(int planteId) async {
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.get(
      Uri.parse('http://127.0.0.1:9000/photo-plante/all/idPlante/$planteId'),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return PhotoPlante.listFromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load photo plantes');
  }
}

Future<PhotoPlante> getUrlOfPhotoPlante(int planteId) async {
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.get(
      Uri.parse('http://127.0.0.1:9000/photo-plante/one/idPlante/$planteId'),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return PhotoPlante.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load photo plantes');
  }
}

Future<PhotoPlante> getLastPhotoPlante(int idPlante) async {
  final idUser = await getUserId();
  final jwt = await getJWT(idUser);
  final response = await http.get(
      Uri.parse("http://127.0.0.1:9000/photo-plante/one/idPlante/$idPlante"),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt',
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return PhotoPlante.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}
