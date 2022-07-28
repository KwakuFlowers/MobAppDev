// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqlwork/main.dart';
import 'package:sqlwork/models/user.dart';
import 'package:sqlwork/pages/driver.dart';
import 'package:sqlwork/sqlserv.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> users = SQLiteService().readAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade300,
        appBar: AppBar(
          title: const Text("Post it!"),
          actions: [
            IconButton(
                onPressed: () async {
                  register = 0;
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Driver()));
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: _showPostFeild,
          child: const Icon(Icons.post_add),
        ),*/
        body: Center(
          child: FutureBuilder<List<User>>(
              future: users,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final usersnap = snapshot.data!;
                  return buildIt(usersnap);
                } else {
                  return const Text("Nobody in database!");
                }
              }),
        ));
  }
}

Widget buildIt(List<User> users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return Card(
          child: ListTile(
              title: Text(
                  " ${user.username} + ${user.id} is user name and the ID"),
              subtitle: Text(user.password)),
        );
      },
    );
