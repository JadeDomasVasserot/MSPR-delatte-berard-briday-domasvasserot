import 'dart:convert';
import 'package:arosaje/src/models/Commentaire.dart';
import 'package:http/http.dart' as http;

import 'package:arosaje/src/models/VisitePlante.dart';
import 'package:arosaje/src/models/Personne.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/models/GardePlante.dart';


Future<VisitePlante> addVisite (Personne gardien,DateTime dateVisite, Plante plante, GardePlante gardePlante, Commentaire commentaire) async {
  try {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:9000/visite-plante/add"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'gardien': gardien.toJson(),
        'dateVisite': dateVisite.toIso8601String(),
        'plante' : plante.toJson(),
        'gardePlante' : gardePlante.toJson(),
        'commentaire' :  commentaire.toJson(), 
      }),
    );  
    return VisitePlante.fromJson(jsonDecode(response.body));
  } catch (e) {
    print (e);
    throw Exception('Failed to add GardePlante');
  }
}

Future<List<VisitePlante>> getVisiteByGarde (int idGarde) async { // Retourne toutes les visites d'une plante
  final response = await http
      .get(Uri.parse("http://127.0.0.1:9000/visite-plante/all/byGarde/$idGarde"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.;
    return VisitePlante.listFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load VisiteByGarde');
  }
}





