import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/pages/home.dart';
import 'package:neobis_flutter_auth/pages/registration.dart';
import 'package:go_router/go_router.dart';
import 'package:neobis_flutter_auth/pages/authorization.dart';

const String registration = "/registration";
const String authorization = '/authorization';
const String home = '/home';

final _router = GoRouter(
  initialLocation: authorization,
  routes: [
    GoRoute(
      path: authorization,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: registration,
      builder: (context, state) => MyForm(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const Home(),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
