class ChaosEntry {
  String image;
  String leaveType;
  int trumpTime;
  String dateLeft;
  String dateHired;
  bool hiredUnderTrump;
  String affiliation;
  String lastName;
  String sources;
  String notes;
  String moochesTime;
  int totalTime;
  String position;
  String firstName;

  contains(String value) {
    bool match = false;
    [lastName, firstName, affiliation, position].forEach((field) {
      if(field.toLowerCase().contains(value.toLowerCase())) {
        match = true;
      }
    });
    return match;
  }
}