import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:arosaje/src/models/Personne.dart';

Future<void> addDataToDB(final data) async {
  final url = Uri.parse("https://arosaje-mspr.mrartemus.cloud/auth/register");
  final response = await http.post(url,
      headers: {
        'accept': '*/*',
        'Content-Type':
            'application/json; charset=UTF-8', // En-tête pour spécifier le type de contenu
      },
      body: data);

  if (response.statusCode == 200) {
    print('Data added successfully to the database');
  } else {
    print(response.statusCode);
    print(data);
    print('Failed to add data to the database');
  }
}
