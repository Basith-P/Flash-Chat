import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '/widgets/rounded_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routName = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('assets/images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                  pause: const Duration(seconds: 2),
                  repeatForever: true,
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              color: Colors.blueAccent,
              onPressed: () => Navigator.pushNamed(context, LoginScreen.routName),
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () => Navigator.pushNamed(context, RegistrationScreen.routName),
            ),
          ],
        ),
      ),
    );
  }
}
