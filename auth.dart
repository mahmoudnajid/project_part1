import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/screens/large_screen/large_login%20.dart';
import 'package:project_flutter/screens/small_screen/home_screen.dart';
import 'package:project_flutter/screens/small_screen/login_screen.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return MediaQuery.of(context).size.width > 400
                ? Large_LoginScreen()
                : LoginScreen();
          }
        },
      ),
    );
  }
}
