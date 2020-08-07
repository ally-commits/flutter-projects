
import 'package:flutter/material.dart';  

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) { 

    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB)
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> originalItems =  List<String>.generate(100, (i) => "Item $i");
  List<String> items = List<String>();
  int perPage  = 10;
  int present = 0;
  @override 
  void initState() {
      super.initState();
      setState(() {
          items.addAll(originalItems.getRange(present, present + perPage));
          present = present + perPage;
      });
  }
  void loadMore() {
    setState(() {
      if((present + perPage )> originalItems.length) {
        items.addAll(
            originalItems.getRange(present, originalItems.length));
      } else {
        items.addAll(
            originalItems.getRange(present, present + perPage));
      }
      present = present + perPage;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load More...."),
      ),
      body:  NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels ==
              scrollInfo.metrics.maxScrollExtent) {
            loadMore();
          }
        },
        child: ListView.builder(
          itemCount: (present <= originalItems.length) ? items.length + 1 : items.length,
          itemBuilder: (context, index) {
            return (index == items.length ) ?
            Container(
              color: Colors.greenAccent,
              child: FlatButton(
                child: Text("Load More"),
                onPressed: () {
                  loadMore();
                },
              ),
            )
                :
            ListTile(
              title: Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}