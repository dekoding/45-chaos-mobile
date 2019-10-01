import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:forty_five_chaos/models/chaos.dart';
import 'package:forty_five_chaos/services/data.dart';

class ChaosPage extends StatefulWidget {
  ChaosPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ChaosPage createState() => _ChaosPage();
}

class _ChaosPage extends State<ChaosPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Image.asset(
                  'assets/images/whiteHouseBanner.jpg',
                  fit: BoxFit.cover
              ),
              Center(
                  child: Text(
                      'Departures and Nominations',
                      style: TextStyle(
                          fontFamily: "Fjalla One"
                      )
                  )
              )
            ],
          ),
          Expanded(
            child: FutureBuilder<List<ChaosEntry>>(
              future: getDepartures(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      ChaosEntry entry = snapshot.data[index];
                      String dittoHead = entry.image;
                      String url = 'https://45chaos.com/api/images/$dittoHead';
                      log(url);
                      return ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                                url,
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40
                            )
                        ),
                        title: Text(entry.lastName + ', ' + entry.firstName),
                        subtitle: Text(entry.position),
                        trailing: Column(
                          children: <Widget>[
                            Text(entry.leaveType),
                            Text(entry.dateHired),
                            Text(entry.dateLeft)
                          ],
                        ),
                      );
                    }
                  );
                } else {
                  log(snapshot.toString());
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }
              }
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}