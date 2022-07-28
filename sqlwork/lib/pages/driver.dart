// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqlwork/main.dart';
import 'package:sqlwork/pages/login.dart';
import 'package:sqlwork/pages/register.dart';
import 'package:sqlwork/pages/home.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  State<Driver> createState() => _State();
}
// ignore: camel_case_types

class _State extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    if (register == 0) {
      return LogPage();
    } else if (register == 1) {
      return RegPage();
    } else {
      return HomePage();
    }
  }
}
