import 'package:assignment2/main.dart';
import 'package:assignment2/pages/driver.dart';
import 'package:assignment2/pages/home.dart';
import 'package:assignment2/style/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../widgets/loading.dart';
import 'package:assignment2/miniDocs/register.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Loading();
    } else {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              decoration: inputStyling("Email"),
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
              decoration: inputStyling("Password"),
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
            OutlinedButton(
                onPressed: () {
                  forgot();
                },
                child: const Text("Forgot Password")),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    //loading = true
                    loading = true;
                    register = 1;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Driver()));
                  });
                },
                child: const Text("Not a User? Register!")),
            OutlinedButton(
                onPressed: () {
                  loginFacebook(context);
                },
                child: const Text("Login with Facebook!")),
          ],
        ),
      );
    }
  }

  Future<void> login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential loginResponse = await _auth.signInWithEmailAndPassword(
            email: _email.text, password: _password.text);

        setState(() {
          if (loginResponse.user!.emailVerified) {
            register = -1;
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Driver()));
          } else {
            snackBar(context, "User logged in but email is not verified.");
            loginResponse.user?.sendEmailVerification();
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Driver()));
          }
          loading = false;
        });
      } catch (e) {
        if (e.toString() == 'user-not-found') {
          register = 1;
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Driver()));
        }
        setState(() {
          snackBar(context, e.toString());
          loading = false;
        });
      }
    }
  }

  Future<void> forgot() async {
    if (_email.text.isNotEmpty) {
      _auth.sendPasswordResetEmail(email: _email.text);
      snackBar(context, "Password reset sent to email.");
    }
  }

  Future<void> loginFacebook(BuildContext context) async {
    try {
      final fbresult = await FacebookAuth.instance.login();
      final fbdata = await FacebookAuth.instance.getUserData();

      final fbcred =
          FacebookAuthProvider.credential(fbresult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(fbcred);
      await FirebaseFirestore.instance
          .collection('users')
          .add({"username": fbdata['name'], "bio": fbdata['bio']});

      register = -1;
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Driver()));
    } on FirebaseAuthException catch (e) {
      var errorview = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          errorview = 'Account exisits with different credentials';
          snackBar(context, errorview);
          break;
        case 'user-not-found':
          errorview = 'User is not found!';
          snackBar(context, errorview);
          break;
      }
    }
  }
}
