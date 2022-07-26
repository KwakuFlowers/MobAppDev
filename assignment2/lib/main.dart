//import 'package:assignment2/pages/driver.dart';
import 'package:assignment2/pages/driver.dart';
import 'package:flutter/material.dart';
import 'splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int register = 0;
Future<void> main() async {
  //Always needed for firebase
  register = 0;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const PostIt());
}

class PostIt extends StatelessWidget {
  const PostIt({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PostIt!',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.orange.shade300,
      ),
      home: Sph(),
    );
  }
}
