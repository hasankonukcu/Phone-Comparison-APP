import 'package:cloud_firestore/cloud_firestore.dart';

class ReplyModel {
  int? phoneID;
  String? commentID;
  String? userID;
  String? replyID;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  String? userName;
  String? email;
  String? message;
  int? like;

  ReplyModel({
    this.userID,
    this.phoneID,
    this.commentID,
    this.userName,
    this.replyID,
    this.email,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.like,

  });
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userID': userID,
      'phoneID': phoneID,
      'commentID': commentID,
      'replyID':replyID,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'email': email,
      'message': message,
      'like': like ?? 0,

    };
  }

  ReplyModel.fromMap(Map<String, dynamic> map)
      : userName = map['userName'],
        email = map['email'],
        userID = map['userID'],
        phoneID= map['phoneID'],
        replyID = map['replyID'],
        createdAt = map['createdAt'],
        updatedAt = map['updatedAt'],
        commentID = map['commentID'],
        like = map['like'],
        message = map['message'];
}
