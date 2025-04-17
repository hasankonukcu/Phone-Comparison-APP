import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compare_app/models/reply_model.dart';

class CommentModel {
  int? phoneID;
  String? commentID;
  String? userID;
  String? userName;
  String? email;
  String? phoneName;
  String? message;
  int? like;
  int? disslike;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  List<ReplyModel>? replys;

  CommentModel({
    this.userID,
    this.phoneID,
    this.phoneName,
    this.commentID,
    this.userName,
    this.email,
    this.message,
    this.like,
    this.disslike,
    this.createdAt,
    this.updatedAt,
    this.replys
  });
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userID': userID,
      'phoneName':phoneName,
      'phoneID': phoneID,
      'commentID': commentID,
      'email': email,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'message': message,
      'like': like ?? 0,
      'disslike': like ?? 0,
      'replys':replys
    };
  }

  CommentModel.fromMap(Map<String, dynamic> map)
      : userName = map['userName'],
        email = map['email'],
        userID = map['userID'],
        phoneName = map['phoneName'],
        phoneID= map['phoneID'],
        commentID = map['commentID'],
        createdAt = map['createdAt'],
        updatedAt = map['updatedAt'],
        like = map['like'],
        disslike = map['disslike'],
        message = map['message'],
        replys = map['replys'];
}
