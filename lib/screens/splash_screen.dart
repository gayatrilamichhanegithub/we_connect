import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_connect/api/apis.dart';
import 'package:we_connect/screens/home_screen.dart';

import '../../main.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      // Check if the user is logged in
      if (APIs.auth.currentUser != null) {
        developer.log('\nUser: ${APIs.auth.currentUser}');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initializing media query for getting device screen size
    mq = MediaQuery.of(context).size;

    return Scaffold(
      // App bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Connect'),
      ),

      // Body
      body: Stack(
        children: [
          // App logo
          Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('images/wechat.png'),
          ),

          // Google login button
          Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: const Text(
              'MADE IN NEPAL WITH ❤️',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, color: Colors.black87, letterSpacing: .5),
            ),
          ),
        ],
      ),
    );
  }
}
