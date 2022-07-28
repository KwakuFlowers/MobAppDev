// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email cannot be empty";
                }
                if (!value.contains('@')) {
                  return "Email in wrong format";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _password,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password cannot be empty";
                }
                if (value.length < 7) {
                  return "Password too short.";
                }
                return null;
              },
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    //loading = true;
                    login(context);
                  });
                },
                child: const Text("LOGIN")),
            /* OutlinedButton(
                onPressed: () {
                  setState(() {
                    //loading = true
                    loading = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Driver()));
                  });
                },
                child: const Text("Not a User? Register!")),*/
          ],
        ),
      );
    }
  }
}

Future<void> login(BuildContext context) async {}
