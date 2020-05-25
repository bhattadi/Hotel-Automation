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
  String checkin = "12:00 AM";
  String checkout = "12:00 AM";
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
  List<Day> calendar = List<Day>(366);

  final FirebaseDatabase _database = FirebaseDatabase.instance;

  for(int i = 0; i < calendar.length; ++i)
  {
    List<Room> rooms = [Room(true, "12:00 AM", "12:00 AM", 0)];
    calendar[i] = Day(rooms, 1);
    for(int j = 0; j < 1; ++j)
    {
      _database.reference().child("calendar").child("Days").child(i.toString()).child("Room Numbers").child(j.toString()).update(calendar[i].rooms[j].toJson());
//      _database.reference().child("calendar").child("Days").child(i.toString()).child("Room Numbers").child((j + 1).toString()).update(calendar[i].rooms[j].toJson());
//      _database.reference().child("calendar").child("Days").child(i.toString()).update(calendar[i].toJson());
    }
  }
}