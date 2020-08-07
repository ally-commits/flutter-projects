import 'package:fisho/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>  (
      builder: (context, auth, child) {
        return ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                auth.logout();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.red,
                child: Text("Welcome Click to logout"),
              ),
            )
          ],
        );
      }
    );
  }
}