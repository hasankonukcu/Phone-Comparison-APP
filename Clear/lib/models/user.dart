import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String usersID;
  final String email;
  String? userName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? level;
  String? surname;
  String? dateOfBirth;
  List? comments;
  List? likes;

  Users({required this.usersID,required this.email});

  Map<String, dynamic> toMap() {
    return {
      'userID': usersID,
      'email': email,
      'userName': userName ?? email.substring(0, email.indexOf('@')),
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'level': level ?? 1,
      'surname': surname ?? '',
      'dateOfBirth': dateOfBirth,
      'comments':comments,
      'likes':likes
    };
  }

  Users.fromMap(Map<String, dynamic> map)
      : usersID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate(),
        level = map['level'],
        surname = map['surname'],
        dateOfBirth = map['dateOfBirth'],
        comments = map['comments'],
        likes = map['likes'];
}
