// ignore_for_file: use_build_context_synchronously

// import 'package:bank_bot/constants.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../components/background.dart';
// import '../Home/home_screen.dart';
import '../Home/home_screen.dart';
// import '../Welcome/components/welcome_image.dart';
import '../Welcome/welcome_screen.dart';
// import '../Welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user == null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const WelcomeScreen();
              },
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen(user: user);
              },
            ),
          );
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(
            "assets/icons/chat.svg",
          ),
        ),
      ),
    );
  }
}
