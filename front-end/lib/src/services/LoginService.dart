import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = const FlutterSecureStorage();

Future<void> login(BuildContext context, final data) async {
  final url =
      Uri.parse("https://arosaje-back.jadedomasvasserot.com/auth/authenticate");
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
    int idUser = jsonResponse['idUser'];
    await saveJWT(jwt, idUser.toString());
    await saveIdUser(idUser.toString());
    context.go('/home');
  } else {
    print('Impossible de se connecter');
  }
}

// Fonction pour sauvegarder le JWT dans FlutterSecureStorage
Future<void> saveJWT(String jwt, String userId) async {
  await storage.write(key: userId, value: jwt);
}

Future<String> getJWT(String userId) async {
  return await storage.read(key: userId) ?? '';
}

Future<void> logout(String userId) async {
  await storage.delete(key: userId);
}

Future<void> saveIdUser(String idUser) async {
  await storage.write(key: 'idUser', value: idUser);
}

Future<String> getUserId() async {
  return await storage.read(key: 'idUser') ?? '';
}
