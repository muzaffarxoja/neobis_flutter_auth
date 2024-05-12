import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neobis_flutter_auth/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:neobis_flutter_auth/models/user_password.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameInput = TextEditingController();
  final TextEditingController passWordInput = TextEditingController();
  final TextEditingController passWordConfirmInput = TextEditingController();

  bool userExists(String name) {
    for (var userPassword in userdata) {
      if (userPassword.user == name) {
        return true; // Username exists in the list
      }
    }
    return false; // Username doesn't exist in the list
  }

  bool save(String name, String passWord) {
    // Create a new instance of UserPassword
    UserPassword newUserPassword = UserPassword(
      user: name,
      passWord: passWord,
    );

// Add the new instance to the userdata list
    userdata.add(newUserPassword);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Input user name'),
              ),
              controller: userNameInput,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter user name';
                }

                if (userExists(userNameInput.text)) {
                  return 'User with such name exists';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Input password'),
              ),
              controller: passWordInput,
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
              decoration: const InputDecoration(
                label: Text('Retype password'),
              ),
              controller: passWordConfirmInput,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                if (passWordInput.text != passWordConfirmInput.text) {
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
                    if (save(userNameInput.text, passWordInput.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Succesfully saved')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Somethink went wrong')),
                      );
                    }
                    context.go(authorization);
                  }
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
