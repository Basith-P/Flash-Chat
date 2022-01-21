import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/utils/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedinUser;
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) loggedinUser = user;
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   var messages = await _firestore.collection('messages').get();
  //   for (var msg in messages.docs) {
  //     print(msg.data);
  //   }
  // }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var msg in snapshot.docs) {
        print(msg.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pushNamed(context, LoginScreen.routName);
                messageStream();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (BuildContext context, snapshot) {
                List<Text> msgWidgets = [];
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final messages = snapshot.data!.docs;
                  for (var msg in messages) {
                    final message = msg.data() as Map<String, dynamic>;
                    final msgText = message['text'];
                    final msgSender = message['sender'];
                    final msgWidget = Text('$msgText from $msgSender');
                    msgWidgets.add(msgWidget);
                  }
                }
                return SingleChildScrollView(
                  child: Column(
                    children: msgWidgets,
                  ),
                );
              },
            ),
            const Spacer(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedinUser.email,
                      });
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
