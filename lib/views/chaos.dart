import 'dart:developer';
import 'dart:ui';
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
  TextEditingController editingController = TextEditingController();

  List<ChaosEntry> items = [];
  List<ChaosEntry> allItems = [];

  ChaosEntry selected;

  Future<void> populateItems() async {
    List<ChaosEntry> data = await getDepartures();
    setState(() {
      items.clear();
      allItems.clear();
      items.addAll(data);
      allItems.addAll(data);
    });
  }

  void filterItems(String query) {
    List<ChaosEntry> searchList = [];
    searchList.addAll(allItems);
    if(query.isNotEmpty) {
      List<ChaosEntry> searchResults = [];
      searchList.forEach((entry) {
        if(entry.contains(query)) {
          searchResults.add(entry);
        }
      });
      setState(() {
        items.clear();
        items.addAll(searchResults);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(allItems);
      });
    }
  }

  Future<void> _details() async {
    switch(
      await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text(selected.firstName + ' ' + selected.lastName),
              children: <Widget>[
                Text('Blah blah nothing here yet'),
                SimpleDialogOption(
                  onPressed: () { Navigator.pop(context, true); },
                  child: const Text('OK'),
                )
              ],
            );
          }
      )
    ) {
      default: break;
    }
  }

  @override
  initState() {
    populateItems();
    super.initState();
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
              overflow: Overflow.clip,
              children: <Widget>[
                Image.asset(
                    'assets/images/whiteHouseBanner.jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 5,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) {
                  filterItems(query);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Type in a name and go!",
                    prefixIcon: Icon(Icons.search)
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      ChaosEntry entry = items[index];
                      String dittoHead = entry.image;
                      String url = 'https://45chaos.com/api/images/$dittoHead';
                      log(url);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          child: ListTile(
                            onTap: () async {
                              selected = entry;
                              await _details();
                            },
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                    height: 40,
                                    width: 40
                                )
                            ),
                            title: Text(
                                entry.lastName + ', ' + entry.firstName),
                            subtitle: Text(entry.position),
                            trailing: Column(
                              children: <Widget>[
                                Text(entry.leaveType),
                                Text(entry.dateHired),
                                Text(entry.dateLeft)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                )
            )
          ]
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}