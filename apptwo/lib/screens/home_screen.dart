import 'package:apptwo/screens/author_loader.dart';
import 'package:apptwo/screens/blog_loader.dart';
import 'package:apptwo/screens/forum_loader.dart';
import 'package:apptwo/screens/home_blog_loader.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            AuthorLoader(),
            HomeBlogLoader(),
            ForumLoader(),
            BlogLoader()
          ],
        ),
      ),
    );
  }
}