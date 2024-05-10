import 'package:flutter/material.dart';
import 'package:neobis_flutter_auth/pages/my_form.dart';
import 'package:go_router/go_router.dart';
import 'package:neobis_flutter_auth/pages/login_page.dart';

const String authorization = "/authoriation";
const String login = '/login';

final _router = GoRouter(
  initialLocation: login,
  routes: [
    GoRoute(
      path: login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: authorization,
      builder: (context, state) => const MyForm(),
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
