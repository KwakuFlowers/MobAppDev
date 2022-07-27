import 'package:assignment3/models/conversation.dart';
import 'package:assignment3/pages/chat.dart';
import 'package:assignment3/pages/create_conversation.dart';
import 'package:assignment3/firestore_service.dart';
import 'package:flutter/material.dart';

class ConversationsPage extends StatefulWidget {
  const ConversationsPage({Key? key}) : super(key: key);

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  final FirestoreService _fs = FirestoreService();
  @override
  void initState() {
    super.initState();
    _fs.setUserConvoserations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversations"),
        backgroundColor: Colors.orange.shade300,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateConversationsPage()));
              },
              icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: StreamBuilder<List<Conversation>>(
          stream: _fs.userConvos.cast(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Conversation>> snapshot) {
            if (snapshot.hasData) {
              List<Conversation> convos = snapshot.data!;
              //print(snapshot.data!);
              if (convos.isEmpty) {
                return Text(_fs.getUserId());
              } else {
                return ListView.builder(
                    itemCount: convos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(conversationName(convos[index])),
                        onTap: () => goToConversation(convos[index]),
                      );
                    });
              }
            } else {
              return const Center(child: Text("Are No Conversations"));
            }
          }),
    );
  }

  String conversationName(Conversation convo) {
    var convoname = "";

    for (var user in convo.users) {
      if (user != _fs.getUserId()) {
        if (convoname.isEmpty) {
          convoname = FirestoreService.userMap[user]!.name.toUpperCase();
        } else {
          convoname +=
              ", ${FirestoreService.userMap[user]!.name.toUpperCase()}";
        }
      }
    }
    return convoname;
  }

  void goToConversation(Conversation convo) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ChatPage(conversation: convo, name: conversationName(convo))));
  }
}
