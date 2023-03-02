import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart'; //import 'package:arosaje/src/models/Personne.dart';

Future<void> login(final data) async {
  final url =
      Uri.parse("https://arosaje-mspr.mrartemus.cloud/auth/authenticate");
  final response = await http.post(url,
      headers: {
        'accept': '*/*',
        'Content-Type':
            'application/json; charset=UTF-8', // En-tête pour spécifier le type de contenu
      },
      body: data);

  if (response.statusCode == 200) {
    print('Data added successfully to the database');
    final jsonResponse = jsonDecode(response.body);
    final token = jsonResponse['token'];
    final id = jsonResponse['id'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(id, token);
  } else {
    print('Impossible de se connecter');
  }
}
