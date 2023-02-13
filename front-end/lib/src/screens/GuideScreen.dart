import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/BottomBarComponent.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreen();
}

class _GuideScreen extends State<GuideScreen> {

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
                  Text("Guide")
                ],
              ),
            ),
            bottomNavigationBar: const BottomBarComponent()

        ));
  }
}
