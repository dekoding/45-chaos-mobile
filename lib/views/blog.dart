import 'package:flutter/material.dart';
import 'package:forty_five_chaos/shared/customwidgets.dart';
import 'package:forty_five_chaos/styling/fonts.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPage createState() => _BlogPage();
}

class _BlogPage extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ChaosHeader(
              primary: 'Blog',
              secondary: '/u/rusticgorilla\'s blog'
          ),
          Expanded(
              child: Text('Coming soon!', style: ChaosStyles.hero)
          )
        ]
    );
  }
}