import 'package:fisho/providers/auth_provider.dart';
import 'package:fisho/providers/cart_provider.dart';
import 'package:fisho/screens/auth_screen/auth_screen.dart';
import 'package:fisho/screens/home_screen.dart';
import 'package:fisho/screens/auth_screen/login_screen.dart';
import 'package:fisho/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()), 
        ChangeNotifierProvider(create: (context) => AuthProvider()), 
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primaryColor: Const.primaryColor,
        fontFamily: 'Montserratcd'
      ),
      home: AuthRoute(),
    );
  }
} 
class AuthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          body: SafeArea(
            child: auth.authenticated ? HomeScreen() : AuthScreen(),
          ),
        );
      }
    );
  }
}