import 'package:flutter/material.dart';

void main() {
  runApp(Clash7App());
}

class Clash7App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clash7',
      home: Scaffold(
        appBar: AppBar(title: Text('Clash7')),
        body: Center(child: Text('Hello, Mihomo!')),
      ),
    );
  }
}
