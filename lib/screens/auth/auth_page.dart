import 'package:flutter/material.dart';
import 'package:your_clinic/screens/pages/login.dart';
import 'package:your_clinic/screens/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage.AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //show initialy login page
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
