import 'package:assignment2/miniDocs/postdoc.dart';
import 'package:assignment2/models/post.dart';
import 'package:assignment2/pages/driver.dart';
import 'package:assignment2/pages/profile.dart';
import 'package:assignment2/firestore_service.dart';
import 'package:assignment2/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final fbAuth.FirebaseAuth _auth = fbAuth.FirebaseAuth.instance;
  final FirestoreService _fs = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade300,
        appBar: AppBar(
          title: const Text("Post it!"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showPostFeild,
          child: const Icon(Icons.post_add),
        ),
        body: StreamBuilder<List<Post>>(
          //check here
          stream: _fs.post.cast(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshots) {
            if (snapshots.hasError) {
              return Center(child: Text(snapshots.error.toString()));
            } else if (snapshots.hasData) {
              var posts = snapshots.data!;
              var filterpost = [];
              for (var element in posts) {
                if (element.creator == "SomeId") {
                  filterpost.add(element);
                }
              }

              if (posts.isEmpty) {
                return const Center(child: Text("No Posts have been made!"));
              } else {
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                        title: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile(
                                          observedUser:
                                              FirestoreService.userMap[
                                                  posts[index].creator]!)));
                            },
                            child: Text(FirestoreService
                                .userMap[posts[index].creator]!.name)),
                        subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(posts[index].content),
                              const SizedBox(height: 10),
                              Text(posts[index].createdAt.toDate().toString())
                            ])));
              }
            }
            if (snapshots.connectionState == ConnectionState.waiting) {
              return Loading();
            }
            return Text('State: ${snapshots.connectionState}');
            //return Container(); //Driver(); //constHomePage();
          },
        ));
  }

  //Displays a ModalPopUp that shows a text field and submit button for Post

  void _showPostFeild() {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return const PostForm();
        });
  }
}
