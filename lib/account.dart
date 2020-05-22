import 'package:firebase_database/firebase_database.dart';

class Account{
  String key;
  String userId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String creditCardInfo;

  Account(this.userId, this.firstName, this.lastName, this.email, this.phoneNumber, this.creditCardInfo);

  Account.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    userId = snapshot.value["userId"],
    firstName = snapshot.value["firstName"],
    lastName = snapshot.value["lastName"],
    email = snapshot.value["email"],
    phoneNumber = snapshot.value["phoneNumber"],
    creditCardInfo = snapshot.value["creditCardInfo"];

  toJson() {
    return {
      "userId" : userId,
      "firstName" : firstName,
      "lastName" : lastName,
      "email" : email,
      "phoneNumber" : phoneNumber,
      "creditCardInfo" : creditCardInfo,
    };
  }

}