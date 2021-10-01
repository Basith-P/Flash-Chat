import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';

void main() => runApp(const FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.routName,
      routes: {
        WelcomeScreen.routName: (ctx) => const WelcomeScreen(),
        LoginScreen.routName: (ctx) => const LoginScreen(),
        RegistrationScreen.routName: (ctx) => const RegistrationScreen(),
        ChatScreen.routName: (ctx) => const ChatScreen(),
      },
    );
  }
}
