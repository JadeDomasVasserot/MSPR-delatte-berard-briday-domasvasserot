import 'dart:convert';
import 'package:arosaje/src/models/PhotoPlante.dart';
import 'package:http/http.dart' as http;

Future<List<PhotoPlante>> getAllPhotoPlanteOfPlante(int planteId) async {
  final response = await http.get(Uri.parse(
      'https://arosaje-mspr.mrartemus.cloud/photo-plante/all/idPlante/$planteId'));
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
  final response = await http.get(Uri.parse(
      'https://arosaje-mspr.mrartemus.cloud/photo-plante/one/idPlante/$planteId'));
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
  final response = await http.get(Uri.parse(
      "https://arosaje-mspr.mrartemus.cloud/photo-plante/one/idPlante/$idPlante"));
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
