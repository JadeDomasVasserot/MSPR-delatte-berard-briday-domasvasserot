// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:arosaje/src/models/Personne.dart';

// Future<Personne> getIdPersonne(int personneId) async {
//   final response = await http
//       .get(Uri.parse("http://10.0.2.2:9000/personne/id/$personneId"));
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.;
//     return Personne.listFromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load personne');
//   }
// }