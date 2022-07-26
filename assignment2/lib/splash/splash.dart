import 'package:flutter/material.dart';
import 'package:assignment2/pages/driver.dart';
import '../main.dart';

class Sph extends StatefulWidget {
  const Sph({Key? key}) : super(key: key);

  @override
  State<Sph> createState() => _SphState();
}

class _SphState extends State<Sph> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Driver())); //change it to Driver Page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 450,
              width: 450,
              color: Colors.deepOrange,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  "assets/postnotes.png",
                ),
              ),
            ),
            Text(
              'PostIt!!!!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
