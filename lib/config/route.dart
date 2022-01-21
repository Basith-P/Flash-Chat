import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/welcome_screen.dart';

const String chatPage = 'chatPage';
const String loginPage = 'loginPage';
const String regPage = 'regPage';
const String welcomePage = 'welcomePage';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case 'loginPage':
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case 'regPage':
      return MaterialPageRoute(builder: (_) => const RegistrationScreen());
    case 'welcomePage':
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    case 'chatPage':
      return MaterialPageRoute(builder: (_) => const ChatScreen());
    default:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
  }
}
