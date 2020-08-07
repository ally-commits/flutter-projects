import 'package:fisho/screens/auth_screen/login_screen.dart';
import 'package:fisho/screens/auth_screen/otp_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  static String page = "login";

  changeState() {
    setState(() {
      page = page == "login" ? "otp" : "login";
    }); 
  }
  Widget build(BuildContext context) {
    print(page);
    return Scaffold(
      body: page == "login" ? LoginScreen(func: changeState) : OptScreen(func: changeState)
    );
  }
}