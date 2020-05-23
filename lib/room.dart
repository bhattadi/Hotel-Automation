import 'package:firebase_database/firebase_database.dart';

class Day{
  List<Room> rooms = new List(1);
  Day(this.rooms);

  toJson() {
    return {
      "rooms" : rooms
    };
  }
}

class Room{
  bool isAvailable = true;
  int checkin = 2;
  int checkout = 2;

  Room(this.isAvailable, this.checkin, this.checkout);
}

void setUpCalendar(){
  List<Day> calendar = new List(364);
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  for(int i = 0; i < calendar.length; ++i)
  {
   _database.reference().child("calendar").set(calendar[i].toJson());
  }
}