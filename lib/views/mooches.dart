import 'package:flutter/material.dart';
import 'package:forty_five_chaos/shared/customwidgets.dart';
import 'package:forty_five_chaos/styling/fonts.dart';

class MoochesPage extends StatefulWidget {
  @override
  _MoochesPageState createState() => _MoochesPageState();
}

class _MoochesPageState extends State<MoochesPage> {
  String moochCount = 'Waiting for Calculation!';
  String buttonText = 'Select a Date';

  void getMooches(DateTime input) {
    int now = new DateTime.now().millisecondsSinceEpoch;
    int mooch = input.millisecondsSinceEpoch;

    int first;
    int second;

    if (now > mooch) {
      first = mooch;
      second = now;
    } else {
      first = now;
      second = mooch;
    }

    // Take the difference between the dates and divide by milliseconds per day.
    // Round to nearest whole number to deal with DST.
    int days = ((second - first) / (1000 * 60 * 60 * 24)).round();

    if (now > mooch && days != 0) {
      setState(() {
        moochCount = 'That was ${days / 10} Mooches ago!';
      });
    } else if (now < mooch && days != 0) {
      setState(() {
        moochCount = 'That is ${days / 10} Mooches from now!';
      });
    } else {
      setState(() {
        moochCount = 'That\'s not even 1/10 of a Mooch away!';
      });
    }

    setState(() {
      buttonText = '${input.month}-${input.day}-${input.year}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ChaosHeader(
              primary: 'How Many Mooches?',
              secondary: 'Calculate a Time in Mooches!'
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton.icon(
                onPressed: () async {
                  DateTime result = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.parse('20170120'),
                      lastDate: DateTime.parse('20210120')
                  );
                  getMooches(result);
                },
                icon: Icon(Icons.date_range),
                label: Text(buttonText)
            ),
          ),
          Text(moochCount, style: ChaosStyles.hero)
        ]
    );
  }
}