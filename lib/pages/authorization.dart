import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neobis_flutter_auth/main.dart';
import 'package:neobis_flutter_auth/models/user_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameInput = TextEditingController();
  final TextEditingController passWordInput = TextEditingController();

  bool isLoginValid(String username, String password) {
    for (var userPassword in userdata) {
      if (userPassword.user == username && userPassword.passWord == password) {
        return true; // Username and password match found
      }
    }
    return false; // Username and password match not found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: userNameInput,
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
              controller: passWordInput,
              decoration: const InputDecoration(
                label: Text('Input password'),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                  if (isLoginValid(userNameInput.text, passWordInput.text)) {
                    context.go(home);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login or password is incorrect'),
                      ),
                    );
                  }
                },
                child: const Text('Sign in'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go(registration);
                },
                child: const Text('Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
