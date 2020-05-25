import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

class Day{
  List<Room> rooms = new List<Room>(1);
  int numRooms = 1;
  Day(this.rooms, this.numRooms);

  toJson() =>
      {
        "numRooms" : numRooms,
      };
}

class Room{
  bool isAvailable = true;
  int checkin = 2;
  int checkout = 2;
  int roomNum = 0;

  Room(this.isAvailable, this.checkin, this.checkout, this.roomNum);

  toJson() =>
  {
    "isAvailable" : isAvailable,
    "checkin" : checkin,
    "checkout" : checkout,
    "roomNum" : roomNum,
  };
}

void setUpCalendar(){
  Room r1 = Room(true, 1, 1, 1);
  Room r2 = Room(true, 1, 1, 2);
  Room r3 = Room(true, 1, 1, 3);
  // Day a = Day([r1, r2, r3]);
  // Day b = Day([r2, r1, r3]);
  
  // List<Day> calendar = [a, b];
  List<Day> calendar = List<Day>(365);

  final FirebaseDatabase _database = FirebaseDatabase.instance;

  for(int i = 0; i < calendar.length; ++i)
  {
    List<Room> rooms = [Room(true, 0, 0, 0)];
    calendar[i] = Day(rooms, 1);
    for(int j = 0; j < 1; ++j)
    {
      _database.reference().child("calendar").child("Days").child(i.toString()).child("Room Numbers").child(j.toString()).update(calendar[i].rooms[j].toJson());
//      _database.reference().child("calendar").child("Days").child(i.toString()).child("Room Numbers").child((j + 1).toString()).update(calendar[i].rooms[j].toJson());
//      _database.reference().child("calendar").child("Days").child(i.toString()).update(calendar[i].toJson());
    }
  }
}