import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/PhotoBibliothequePlante.dart';

Future<List<BibliothequePlante>> getAllPlantesGuide() async {
  final response = await http
      .get(Uri.parse("https://arosaje-mspr.mrartemus.cloud/bibliotheque-plante/all"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    BibliothequePlante.listFromJson(jsonDecode(response.body));
    return BibliothequePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load plantes');
  }
}


Future<PhotoBibliothequePlante> getPhotoBibliothequePlante(int planteId) async {
  final response = await http
      .get(
      Uri.parse('https://arosaje-mspr.mrartemus.cloud/photo-bibliotheque-plante/one/idPlante/$planteId'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return PhotoBibliothequePlante.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load photo plantes');
  }
}

Future<BibliothequePlante> getOneBibliothequePlante(int planteId) async {
  final response = await http
      .get(
      Uri.parse('https://arosaje-mspr.mrartemus.cloud/bibliotheque-plante/id/$planteId'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return BibliothequePlante.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load photo plantes');
  }
}