import 'package:arosaje/src/screens/ForgetPasswordScreen.dart';
import 'package:arosaje/src/screens/GardeScreen.dart';
import 'package:arosaje/src/screens/GuideScreen.dart';
import 'package:arosaje/src/screens/HomeScreen.dart';
import 'package:arosaje/src/screens/LoginScreen.dart';
import 'package:arosaje/src/screens/MapScreen.dart';
import 'package:arosaje/src/screens/PictureScreen.dart';
import 'package:arosaje/src/screens/ProfileScreen.dart';
import 'package:arosaje/src/screens/MyPlantesScreen.dart';
import 'package:arosaje/src/screens/MyPlanteScreen.dart';
import 'package:arosaje/src/screens/PlanteScreen.dart';
import 'package:arosaje/src/screens/ModifyPlanteScreen.dart';
import 'package:arosaje/src/screens/BibliothequePlanteScreen.dart';
import 'package:arosaje/src/screens/ModifyProfileScreen.dart';
import 'package:arosaje/src/screens/CreateGardeScreen.dart';
import 'package:arosaje/src/screens/ProfileExterieurScreen.dart';
import 'package:arosaje/src/screens/CreateVisiteScreen.dart';
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
      path: "/my_plantes",
      builder: (context, state) => const MyPlantesScreen()
    ),
    GoRoute(
      path: "/my_plante/:id",
      builder: (context, state) {
        final id = state.params["id"];
        return MyPlanteScreen(id: int.parse(id!));
      }
    ),
    GoRoute(
      path: "/plante/:id",
      builder: (context, state) {
        final id = state.params["id"];
        return PlanteScreen(id: int.parse(id!));
      }
    ),
    GoRoute(
      path: "/modify/plante",
      builder: (context, state) => const ModifyPlanteScreen()
    ),
    GoRoute(
      path: "/modify/profile",
      builder: (context, state) => const ModifyProfileScreen()
    ),
    GoRoute(
      path: "/create/garde/:id",
      builder: (context, state) {
        final id = state.params["id"];
        return CreateGardeScreen(id: int.parse(id!));
      }
    ),
    GoRoute(
      path: "/bibliotheque_plante/:id",
      builder: (context, state) {
        final id = state.params["id"];
        return BibliothequePlanteScreen(id: int.parse(id!));
      }
    ),
    GoRoute(
      path: "/profile/:id",
      builder: (context, state) {
        final id = state.params["id"];
        return ProfileExterieurScreen(id: int.parse(id!));
      }
    ),
    GoRoute(
      path: "/create/visite/:id",
      builder: (context, state) {
        final id = state.params["id"];
        return CreateVisiteScreen(id: int.parse(id!));
      }
    )
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
