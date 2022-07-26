// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:assignment2/miniDocs/register.dart';

class Authentication2 extends StatefulWidget {
  const Authentication2({Key? key}) : super(key: key);

  @override
  State<Authentication2> createState() => _Authentication2State();
}

class _Authentication2State extends State<Authentication2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade300,
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: RegisterForm());
  }
}
