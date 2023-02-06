import 'package:arosaje/src/screens/ForgetPasswordScreen.dart';
import 'package:arosaje/src/screens/HomeScreen.dart';
import 'package:arosaje/src/screens/LoginScreen.dart';
import 'package:arosaje/src/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/forget-password",
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    GoRoute(
      path: "/sign-up",
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: "Go router",
    );
  }
}
