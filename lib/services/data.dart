import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:forty_five_chaos/models/chaos.dart';
import 'package:forty_five_chaos/models/stat.dart';
import 'package:http/http.dart' as http;

List<dynamic> decodeArray (body) {
  List<dynamic> data = json.decode(body);
  return data;
}

Map<String, dynamic> decodeMap (body) {
  Map<String, dynamic> data = json.decode(body);
  return data;
}

class DataService {
  static Future<List<ChaosEntry>> getDepartures() async {
    final response =
    await http.get('https://45chaos.com/api/departures');

    if (response.statusCode == 200) {
      List<dynamic> data = await compute(decodeArray, response.body);
      List<ChaosEntry> results = [];
      for (int i = 0; i < data.length; i++) {
        if (data[i].length > 0 && data[i]['FirstName'] != '' &&
            data[i]['LastName'] != '') {
          ChaosEntry entry = new ChaosEntry();
          entry.dateLeft = data[i]['DateLeft'];
          entry.dateHired = data[i]['DateHired'];
          entry.leaveType = data[i]['LeaveType'];
          entry.affiliation = data[i]['Affiliation'];
          entry.position = data[i]['Position'];
          entry.firstName = data[i]['FirstName'];
          entry.lastName = data[i]['LastName'];
          entry.image = data[i]['Image'];
          entry.hiredUnderTrump =
          data[i]['TotalTime'] >= data[i]['TrumpTime'] ? false : true;
          entry.moochesTime = data[i]['MoochesTime'];
          entry.notes = data[i]['Notes'];
          entry.sources = data[i]['Sources'];
          entry.totalTime = data[i]['TotalTime'];
          entry.trumpTime = data[i]['TrumpTime'];
          results.add(entry);
        }
      }
      return results;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<StatRecords> getStats() async {
    final response = await http.get('https://45chaos.com/api/stats');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = await compute(decodeMap, response.body);

      StatRecords stat = new StatRecords.fromJson(data);

      return stat;
    } else {
      return new StatRecords.none();
    }
  }
}