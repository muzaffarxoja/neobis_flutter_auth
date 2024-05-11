import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neobis_flutter_auth/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  Future check(userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(userName)) {
      setState(() {
        // userExists = true;
      });
    } else {
      setState(() {
        // userExists = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Input user name'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter user name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                context.go(home);
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
