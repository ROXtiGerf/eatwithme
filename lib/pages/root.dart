//Adapted from https://github.com/bizz84/coding-with-flutter-login-demo/blob/master/lib/root_page.dart

import 'package:flutter/material.dart';
import 'package:eatwithme/pages/auth/auth.dart';
import 'package:eatwithme/pages/home.dart';
import 'package:eatwithme/pages/login/login.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: authService.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final bool isLoggedIn = snapshot.hasData;
            return isLoggedIn ? HomePage() : LoginPage();
          }
          return _buildWaitingScreen();
        });
  }

  //TODO: replace with EatWithMe animated face
  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
