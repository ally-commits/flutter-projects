import 'package:flutter/material.dart';
import 'package:prov/providers/counter.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(counterBloc.counter.toString()),
        ),
      ),
    );
  }
}