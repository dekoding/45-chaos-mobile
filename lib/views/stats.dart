import 'package:flutter/material.dart';
import 'package:forty_five_chaos/models/stat.dart';
import 'package:forty_five_chaos/services/data.dart';
import 'package:forty_five_chaos/shared/customwidgets.dart';

import 'package:charts_flutter/flutter.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPage createState() => _StatsPage();
}

class _StatsPage extends State<StatsPage> {

  Future<StatRecords> getStats() async {
    StatRecords stats = await DataService.getStats();
    return stats;
  }

  Widget makeTile({ String title, String subtitle }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: ListTile(
            title: Text(title),
            subtitle: Text(
                subtitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            )
        ),
      ),
    );
  }

  List<Widget> makeTiles(StatRecords stats) {
    return [
      makeTile(
          title: 'Average Departures per Day:',
          subtitle: stats.perDayStr
      ),
      makeTile(
          title: 'Average Days for Departed Trump Hire/Appointee:',
          subtitle: stats.avgTrumpHireTime.toString()
      ),
      makeTile(
          title: 'Average Days for Departed Career Officials:',
          subtitle: stats.avgRolloverTime.toString()
      ),
      departuresByType(stats)
    ];
  }

  Card departuresByType(StatRecords records) {
    Series series = new Series<StatEntry, String>(
        id: 'Departures by Type',
        domainFn: (StatEntry entry, _) => entry.label,
        measureFn: (StatEntry entry, _) => entry.count,
        colorFn: (StatEntry entry, _) => entry.color,
        data: records.leaveTypes
    );
    return Card(
        elevation: 8,
        child: SizedBox(
          height: 400,
          child: PieChart(
              [series],
              animate: true,
              defaultRenderer: ArcRendererConfig(arcRendererDecorators: [
                ArcLabelDecorator(
                    labelPosition: ArcLabelPosition.auto)
              ])
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ChaosHeader(
              primary: 'Stats & Charts',
              secondary: 'Corruption by the Numbers'
          ),
          FutureBuilder(
              future: this.getStats(),
              builder: (context, snapshot) {
                Widget widget;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    widget = Placeholder();
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError || !snapshot.hasData) {
                      print('Stats: ${snapshot.hasError
                          ? snapshot.error
                          : 'Missing data'}');
                      widget = Placeholder();
                      break;
                    } else {
                      if (snapshot.data != null) {
                        StatRecords stats = snapshot.data;
                        widget = ListView(
                          children: makeTiles(stats)
                        );
                      } else {
                        widget = Placeholder();
                        break;
                      }
                    }
                }
                return Expanded( child: widget );
              }
          ),
        ]
    );
  }
}