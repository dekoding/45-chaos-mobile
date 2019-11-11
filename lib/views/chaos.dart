import 'package:flutter/material.dart';
import 'package:forty_five_chaos/models/chaos.dart';
import 'package:forty_five_chaos/services/data.dart';
import 'package:forty_five_chaos/shared/customwidgets.dart';

class ChaosPage extends StatefulWidget {
  @override
  _ChaosPage createState() => _ChaosPage();
}

class _ChaosPage extends State<ChaosPage> {
  TextEditingController editingController = TextEditingController();

  List<ChaosEntry> items = [];
  List<ChaosEntry> allItems = [];

  ChaosEntry selected;

  Future<void> populateItems() async {
    List<ChaosEntry> data = await DataService.getDepartures();
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
    if (query.isNotEmpty) {
      List<ChaosEntry> searchResults = [];
      searchList.forEach((entry) {
        if (entry.contains(query)) {
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
    switch (
    await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          String dittoHead = selected.image;
          String url = 'https://45chaos.com/api/images/$dittoHead';
          return SimpleDialog(
            title: Text(selected.firstName + ' ' + selected.lastName),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.network(url,
                          width: 110,
                          fit: BoxFit.contain
                      ),
                      Text(selected.firstName + ' ' + selected.lastName),
                      Text(selected.position)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Affiliation: ' + selected.affiliation),
                      Text('Hired: ' + selected.dateHired)
                    ],
                  )
                ],
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('OK'),
              )
            ],
          );
        }
    )
    ) {
      default:
        break;
    }
  }

  @override
  initState() {
    populateItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ChaosHeader(
              primary: 'Departures and Nominations',
              secondary: 'Search for Trump administration departures'
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}