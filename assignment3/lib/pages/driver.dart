import 'package:assignment3/pages/authentication.dart';
import 'package:assignment3/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assignment3/main.dart';
import 'package:assignment3/pages/authRegi.dart';
import 'package:assignment3/widgets/loading.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  State<Driver> createState() => _State();
}
// ignore: camel_case_types

class _State extends State<Driver> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser == null && register == 0) {
      return Authentication();
    } else if (_auth.currentUser == null && register == 1) {
      return Authentication2();
    } else {
      return HomePage();
    }
  }
}
