import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arosaje/src/services/LoginService.dart';

Future<void> addDataToDB(final data) async {
  final url = Uri.parse("http://127.0.0.1:9000/auth/register");
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
