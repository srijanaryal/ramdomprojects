import 'package:blocs/signIn/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'home.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return EasySplashScreen(
      navigator: result != null ? Home(uid: result.uid) : SignUp(),
      durationInSeconds: 4,
      title: const Text(
        'Welcome To Meet up!',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      loaderColor: Colors.red,
      logo: Image.asset('assets/images/dart.png', fit: BoxFit.scaleDown),
    );
  }
}
