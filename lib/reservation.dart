
class Reservation{
  List<int> roomNums = new List<int>();
  String startDate;
  String endDate;

  Reservation(this.roomNums, this.startDate, this.endDate);

  toJson() =>
      {
//        "roomNums" : roomNums,
        "startDate" : startDate,
        "endDate" : endDate
      };
}

