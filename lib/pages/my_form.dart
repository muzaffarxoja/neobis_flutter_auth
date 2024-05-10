import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neobis_flutter_auth/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  bool userExists = false;

  Future check(userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(userName)) {
      setState(() {
        userExists = true;
      });
    } else {
      setState(() {
        userExists = false;
      });
    }
  }

  Future save(String userName, String passWord) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(userName, passWord);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: userName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter user name';
              }
              check(value);
              if (userExists) {
                return 'User with such name exists';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: passWord,
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
                  save(userName.text, passWord.text);
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
