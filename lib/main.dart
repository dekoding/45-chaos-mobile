import 'package:flutter/material.dart';
import 'package:forty_five_chaos/views/chaos.dart';

void main() => runApp(ChaosApp());

class ChaosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chaos 45',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChaosPage(title: '45 Chaos'),
    );
  }
}