import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/BottomBarComponent.dart';

class GardeScreen extends StatefulWidget {
  const GardeScreen({Key? key}) : super(key: key);

  @override
  State<GardeScreen> createState() => _GardeScreen();
}

class _GardeScreen extends State<GardeScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arosaje',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text("Garde")
                ],
              ),
            ),
            bottomNavigationBar: const BottomBarComponent()));
  }
}
