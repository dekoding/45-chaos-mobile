import 'package:flutter/material.dart';
import 'package:forty_five_chaos/styling/fonts.dart';
import 'package:forty_five_chaos/views/chaos.dart';
import 'package:forty_five_chaos/views/mooches.dart';
import 'package:forty_five_chaos/views/stats.dart';

void main() => runApp(ChaosApp());

class ChaosApp extends StatelessWidget {

  final List<Tab> tabs = [
    Tab(child: Text('Home', style: ChaosStyles.toolbarButton)),
    Tab(child: Text('Mooches', style: ChaosStyles.toolbarButton)),
    Tab(child: Text('Statistics', style: ChaosStyles.toolbarButton)),
    Tab(child: Text('FAQs', style: ChaosStyles.toolbarButton)),
    Tab(child: Text('Blog', style: ChaosStyles.toolbarButton)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: tabs.length,
          child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/logo.png'),
            ),
            title: Text('Chaos 45'),
            backgroundColor: ChaosColors.blue,
            bottom: TabBar(tabs: tabs),
          ),
            body: TabBarView(
              children: <Widget>[
                ChaosPage(),
                MoochesPage(),
                StatsPage(),
                Placeholder(),
                Placeholder()
              ],
            )
        ),
      ),
      title: 'Chaos 45',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}