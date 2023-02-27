import 'package:arosaje/src/screens/ForgetPasswordScreen.dart';
import 'package:arosaje/src/screens/GardeScreen.dart';
import 'package:arosaje/src/screens/GuideScreen.dart';
import 'package:arosaje/src/screens/HomeScreen.dart';
import 'package:arosaje/src/screens/LoginScreen.dart';
import 'package:arosaje/src/screens/MapScreen.dart';
import 'package:arosaje/src/screens/PictureScreen.dart';
import 'package:arosaje/src/screens/ProfileScreen.dart';
import 'package:arosaje/src/screens/SignUpScreen.dart';
import 'package:arosaje/src/screens/CamScreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
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
    GoRoute(
      path: "/map",
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: "/guide",
      builder: (context, state) => const GuideScreen(),
    ),
    GoRoute(
      path: "/guide/:id",
      builder: (context, state) => const GuideScreen(),
    ),
    GoRoute(
      path: "/garde",
      builder: (context, state) => const GardeScreen(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const ProfileScreen()
    ),
    GoRoute(
      path: "/cam",
      builder: (context, state) => const CameraExampleHome(),
    ),
    GoRoute(
      path: "/picture",
      builder: (context, state) => const PictureScreen(),
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
