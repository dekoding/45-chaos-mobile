import 'dart:math';

import 'package:charts_flutter/flutter.dart';

Map<String, String> labelMap = {
  'R-UP': 'R - Under Pressure',
  'R': 'Resigned',
  'F': 'Fired',
  '?': 'Unknown'
};

Random random = new Random();

String generateRandomColor(){
  int length = 6;
  String chars = '0123456789ABCDEF';
  String hex = '';
  while(length-- > 0) hex += chars[(random.nextInt(16)) | 0];
  hex = hex + 'FF';
  return hex;
}

class StatEntry {
  Map<String, Color> colorMap = {
    'R-UP': Color.fromHex(code: '0000FFFF'), // Blue
    'R': Color.fromHex(code: 'FF0000FF'),    // Red
    'F': Color.fromHex(code: 'FFFF00FF'),    // Yellow
    '?': Color.fromHex(code: '00FF00FF')     // Green
  };

  StatEntry.forDepartures(Map<String, dynamic> entry) {
    this.label = labelMap[entry['label']] != null
        ? labelMap[entry['label']]
        : entry['label'];
    this.color = colorMap[entry['label']] != null
        ? colorMap[entry['label']]
        : null;
    this.count = entry['count'];
  }

  StatEntry.forAffiliations(Map<String, dynamic> entry) {
    this.label = labelMap[entry['label']] != null
        ? labelMap[entry['label']]
        : entry['label'];
    this.color = Color.fromHex(code: generateRandomColor());
    this.count = entry['count'];
  }

  Color color;
  String label;
  int count;
}

class StatRecords {
  StatRecords.fromJson(Map json) {
    this.perDayStr = json['perDayStr'];
    this.avgTrumpTime = json['avgTrumpTime'];
    this.avgRolloverTime = json['avgRolloverTime'];
    this.avgTrumpHireTime = json['avgTrumpHireTime'];

    this.leaveTypes = [];

    List<dynamic> leaveTypesTemp = json['leaveTypes'];
    leaveTypesTemp.forEach((map) {
      this.leaveTypes.add(StatEntry.forDepartures(map));
    });

    this.affiliationStats = [];

    List<dynamic> affiliationStatsTemp = json['affiliationStats'];
    affiliationStatsTemp.forEach((map) {
      this.affiliationStats.add(StatEntry.forAffiliations(map));
    });
  }

  StatRecords.none() {
    this.perDayStr = 'Error';
    this.avgTrumpHireTime = 0;
    this.avgRolloverTime = 0;
    this.affiliationStats = [];
    this.avgTrumpTime = 0;
    this.leaveTypes = [];
  }

  String perDayStr;
  double avgTrumpTime;
  double avgRolloverTime;
  double avgTrumpHireTime;
  List<StatEntry> leaveTypes;
  List<StatEntry> affiliationStats;
}