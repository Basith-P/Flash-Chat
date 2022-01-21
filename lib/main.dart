import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/route.dart' as route;

void main() async {
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('error');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            onGenerateRoute: route.controller,
            initialRoute: route.chatPage,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
