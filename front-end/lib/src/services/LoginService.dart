import 'dart:convert';
import 'dart:js';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = const FlutterSecureStorage();

Future<void> login(BuildContext context, final data) async {
  final url = Uri.parse("http://127.0.0.1:9000/auth/authenticate");
  final response = await http.post(url,
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data);

  if (response.statusCode == 200) {
    print('Data added successfully to the database');
    final jsonResponse = jsonDecode(response.body);
    final jwt = jsonResponse['token'];
    print(jwt);
    await saveJWT(jwt);
    context.go('/home');
  } else {
    print('Impossible de se connecter');
  }
}

// Fonction pour sauvegarder le JWT dans FlutterSecureStorage
Future<void> saveJWT(String jwt) async {
  await storage.write(key: 'jwt', value: jwt);
}

// Fonction pour récupérer le JWT depuis FlutterSecureStorage
Future<String> getJWT() async {
  return await storage.read(key: 'jwt') ?? '';
}
