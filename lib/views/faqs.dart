import 'package:flutter/material.dart';
import 'package:forty_five_chaos/shared/customwidgets.dart';
import 'package:forty_five_chaos/styling/fonts.dart';

class FaqsPage extends StatefulWidget {
  @override
  _FaqsPage createState() => _FaqsPage();
}

class _FaqsPage extends State<FaqsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ChaosHeader(
              primary: 'FAQs',
              secondary: 'Get smart answers about the dumbest of presidents'
          ),
          Expanded(
            child: Text('Coming soon!', style: ChaosStyles.hero)
          )
        ]
    );
  }
}