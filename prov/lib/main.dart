import 'package:flutter/material.dart';
import 'package:prov/pages/counter.dart';
import 'package:prov/providers/counter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterBloc())
      ],
      child: MaterialApp(
        home: CounterPage(),
      ),
    );
  }
}