import 'package:flutter/material.dart';
import 'package:sqlwork/forms/logforms.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade300,
        appBar: AppBar(
          title: const Text("Login"),
        ),
        // ignore: prefer_const_constructors
        body: LoginForm());
  }
}
