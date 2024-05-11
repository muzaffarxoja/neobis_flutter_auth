import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neobis_flutter_auth/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passWordFirst = TextEditingController();
  final TextEditingController passWordSecond = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: passWordFirst,
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
          TextFormField(
            controller: passWordSecond,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please retype password';
              }
              if (passWordFirst != passWordSecond) {
                return 'Please enter same password';
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
                context.go(authorization);
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
