import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:forty_five_chaos/models/chaos.dart';
import 'package:http/http.dart' as http;

Future<List<ChaosEntry>> getDepartures() async {
  final response =
  await http.get('https://45chaos.com/api/departures');

  if (response.statusCode == 200) {
    List<ChaosEntry> results = [];
    List<dynamic> data = json.decode(response.body);
    for (int i = 0; i < data.length; i++) {
      ChaosEntry entry = new ChaosEntry();
      entry.dateLeft = data[i]['DateLeft'];
      entry.dateHired = data[i]['DateHired'];
      entry.leaveType = data[i]['LeaveType'];
      entry.affiliation = data[i]['Affiliation'];
      entry.position = data[i]['Position'];
      entry.firstName = data[i]['FirstName'];
      entry.lastName = data[i]['LastName'];
      entry.image = data[i]['Image'];
      entry.hiredUnderTrump = data[i]['TotalTime'] >= data[i]['TrumpTime'] ? false : true;
      entry.moochesTime = data[i]['MoochesTime'];
      entry.notes = data[i]['Notes'];
      entry.sources = data[i]['Sources'];
      entry.totalTime = data[i]['TotalTime'];
      entry.trumpTime = data[i]['TrumpTime'];
      results.add(entry);
    }
    return results;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load data');
  }
}