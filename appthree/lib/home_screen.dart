import 'package:flutter/material.dart';
import 'package:themify_flutter/themify_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.all(10.0),
          title: Text("${index} index"),
          trailing: Icon(Themify.align_left),
        );
      },
    );
  }
}