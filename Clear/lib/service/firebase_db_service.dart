import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compare_app/models/comment.dart';
import 'package:compare_app/models/details_model.dart';
import 'package:compare_app/models/phone_model.dart';
import 'package:compare_app/models/reply_model.dart';
import 'package:compare_app/models/user.dart';
import 'package:compare_app/service/DBbase.dart';
import 'package:flutter/rendering.dart';

class FirebaseDBSevice implements DataBase {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<List<Phones>> getAllCompare(List ids) {
    // TODO: implement getAllCompare
    throw UnimplementedError();
  }

  @override
  Future<List<Phones>> getAllPhones() async {
    List<Phones> _allPhones = [];
    QuerySnapshot _querySnapShot;
    List<Phones> _phones = [];

    _querySnapShot = await FirebaseFirestore.instance
        .collection("phone")
        .orderBy("point", descending: true)
        .limit(20)
        .get();

    for (DocumentSnapshot snap in _querySnapShot.docs) {
      Phones onePhone = Phones.fromMap(snap.data() as Map<String, dynamic>);
      _phones.add(onePhone);
    }

    _allPhones.addAll(_phones);
    return _allPhones;
  }

  @override
  Future<List<Phones>> getAllPhonesPagination(Phones? lastDream, int itemCount,
      List<String>? brandQueryList, int? minPrice, int? maxPrice) async {
    QuerySnapshot _querySnapShot;
    List<Phones> _allDream = [];
    if (minPrice != null && maxPrice != null) {
      if (lastDream == null) {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("phone")
            .where("price", isGreaterThanOrEqualTo: minPrice)
            .where("price", isLessThanOrEqualTo: maxPrice)
            .where("brand", whereIn: brandQueryList)
            .orderBy("price", descending: true)
            .limit(itemCount)
            .get();
      } else {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("phone")
            .where("price", isGreaterThanOrEqualTo: minPrice)
            .where("price", isLessThanOrEqualTo: maxPrice)
            .where("brand", whereIn: brandQueryList)
            .orderBy("price", descending: true)
            .startAfter([lastDream.price])
            .limit(itemCount)
            .get();
      }
    } else {
      if (lastDream == null) {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("phone")
            .where("brand", whereIn: brandQueryList)
            .orderBy("point", descending: true)
            .limit(itemCount)
            .get();
      } else {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("phone")
            .where("brand", whereIn: brandQueryList)
            .orderBy("point", descending: true)
            .startAfter([lastDream.point])
            .limit(itemCount)
            .get();
      }
    }
    
    for (DocumentSnapshot snap in _querySnapShot.docs) {
      Phones oneDream = Phones.fromMap(snap.data() as Map<String, dynamic>);
      _allDream.add(oneDream);
    }
    return _allDream;
  }

  @override
  Future<List<Phones>> getAllPhone() async {
    QuerySnapshot _querySnapShot;
    List<Phones> _allDream = [];

    _querySnapShot = await FirebaseFirestore.instance
        .collection("phone")
        .orderBy("point", descending: true)
        .get();

    for (DocumentSnapshot snap in _querySnapShot.docs) {
      Phones oneDream = Phones.fromMap(snap.data() as Map<String, dynamic>);
      _allDream.add(oneDream);
    }

    return _allDream;
  }

  @override
  Future<Users> readUser(String userID) async {
    DocumentSnapshot _readedUser =
        await _firebaseFirestore.collection('users').doc(userID).get();
    Map<String, dynamic> _reaadedUserInfMap =
        _readedUser.data() as Map<String, dynamic>;
    Users _readedUserObject = Users.fromMap(_reaadedUserInfMap);
    return _readedUserObject;
  }

  @override
  Future<bool> saveUser(Users user) async {
    DocumentSnapshot _readedUser =
        await FirebaseFirestore.instance.doc('users/${user.usersID}').get();
    if (_readedUser.data() == null) {
      await _firebaseFirestore
          .collection("users")
          .doc(user.usersID)
          .set(user.toMap());
      return true;
    } else {
      return true;
    }
  }

  Future<bool> saveDream(CommentModel commentModel,String type) async {
    var _mesajID = _firebaseFirestore
        .collection(type)
        .doc(commentModel.phoneID.toString())
        .collection('comments')
        .doc()
        .id;

    var comment = CommentModel(
        commentID: _mesajID,
        email: commentModel.email,
        phoneID: commentModel.phoneID,
        userID: commentModel.userID,
        userName: commentModel.userName,
        message: commentModel.message);

    await _firebaseFirestore
        .collection(type)
        .doc(commentModel.phoneID.toString())
        .collection('comments')
        .doc(_mesajID)
        .set(comment.toMap());

    return true;
  }

  @override
  Future<bool> updateDateOfBirth(String userID, newDate) async {
    await _firebaseFirestore
        .collection("users")
        .doc(userID)
        .update({"dateOfBirth": newDate});
    return true;
  }

  @override
  Future<bool> updateMaritalStatus(String userID, newMaritalStatus) async {
    await _firebaseFirestore
        .collection("users")
        .doc(userID)
        .update({"maritalStatus": newMaritalStatus});
    return true;
  }

  @override
  Future<bool> updateSurname(String userID, newsurName) async {
    await _firebaseFirestore
        .collection("users")
        .doc(userID)
        .update({"surname": newsurName});
    return true;
  }

  @override
  Future<bool> updateUserName(String userID, newUserName) async {
    await _firebaseFirestore
        .collection("users")
        .doc(userID)
        .update({"userName": newUserName});
    return true;
  }

  @override
  Future<List<CommentModel>> getComments(int phoneID,String type) async {
    QuerySnapshot _querySnapShot;
    //QuerySnapshot _querySnapShot2;
    List<CommentModel> _allComment = [];

    _querySnapShot = await FirebaseFirestore.instance
        .collection(type)
        .doc(phoneID.toString())
        .collection("comments")
        .orderBy("createdAt")
        .get();

    for (DocumentSnapshot snap in _querySnapShot.docs) {
      CommentModel oneDream =
          CommentModel.fromMap(snap.data() as Map<String, dynamic>);
      //oneDream.replys = [];
      /*_querySnapShot2 = await FirebaseFirestore.instance
          .collection("phone")
          .doc(phoneID.toString())
          .collection("comments")
          .doc(oneDream.commentID)
          .collection('replys')
          .orderBy("like", descending: true)
          .get();
      for (DocumentSnapshot snapshot in _querySnapShot2.docs) {
        ReplyModel oneReply =
            ReplyModel.fromMap(snapshot.data() as Map<String, dynamic>);
        if (oneReply.commentID == oneDream.commentID) {
          oneDream.replys!.add(oneReply);
        }
      }*/

      _allComment.add(oneDream);
    }

    return _allComment;
  }

  @override
  Future<bool> like(CommentModel comment, Users user,String type) async {
    var data = user.likes;

    await _firebaseFirestore
        .collection("users")
        .doc(user.usersID)
        .update({"likes": data});
    DocumentSnapshot snap = await _firebaseFirestore
        .collection(type)
        .doc(comment.phoneID.toString())
        .collection('comments')
        .doc(comment.commentID)
        .get();
    CommentModel commentmodel =
        CommentModel.fromMap(snap.data() as Map<String, dynamic>);
    commentmodel.like = commentmodel.like! + 1;

    await _firebaseFirestore
        .collection(type)
        .doc(comment.phoneID.toString())
        .collection('comments')
        .doc(comment.commentID)
        .update({"like": commentmodel.like});
    return true;
  }

  @override
  Future<bool> disslike(CommentModel comment, Users user,String type) async {
    var data = user.likes;

    await _firebaseFirestore
        .collection("users")
        .doc(user.usersID)
        .update({"likes": data});
    DocumentSnapshot snap = await _firebaseFirestore
        .collection(type)
        .doc(comment.phoneID.toString())
        .collection('comments')
        .doc(comment.commentID)
        .get();
    CommentModel commentmodel =
        CommentModel.fromMap(snap.data() as Map<String, dynamic>);
    commentmodel.like = commentmodel.like! - 1;

    await _firebaseFirestore
        .collection(type)
        .doc(comment.phoneID.toString())
        .collection('comments')
        .doc(comment.commentID)
        .update({"like": commentmodel.like});
    return true;
  }

  @override
  Future<bool> reply(ReplyModel reply,String type) async {
    var _mesajID = _firebaseFirestore
        .collection(type)
        .doc(reply.phoneID.toString())
        .collection('comments')
        .doc(reply.commentID)
        .collection('replys')
        .doc()
        .id;

    var updateModel = ReplyModel(
      commentID: reply.commentID,
      email: reply.email,
      phoneID: reply.phoneID,
      message: reply.message,
      replyID: _mesajID,
      userID: reply.userID,
      userName: reply.userName,
    );

    await _firebaseFirestore
        .collection(type)
        .doc(reply.phoneID.toString())
        .collection('comments')
        .doc(reply.commentID)
        .collection('replys')
        .doc(_mesajID)
        .set(updateModel.toMap());
    return true;
  }

  @override
  Future<List<CommentModel>> getAllLikes(String userID,String type) async {
    List<CommentModel> _allPhones = [];
    DocumentSnapshot _querySnapShot;

    _querySnapShot =
        await FirebaseFirestore.instance.collection("users").doc(userID).get();
    Users user = Users.fromMap(_querySnapShot.data() as Map<String, dynamic>);
    if (user.likes != null) {
      user.likes!.forEach((element) {
        print(element.toString());
        _allPhones.add(element);
      });
    } else {
      return [];
    }

    return _allPhones;
  }
  
  @override
  Future<List<Phones>> getAllLaptopPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice) async{
    
    
    
    QuerySnapshot _querySnapShot;
    List<Phones> _allDream = [];
    print(minPrice);
    print(maxPrice);
    if (minPrice != null && maxPrice != null) {
      if (lastDream == null) {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("laptop")
            .where("price", isGreaterThanOrEqualTo: minPrice)
            .where("price", isLessThanOrEqualTo: maxPrice)
            .where("brand", whereIn: brandQueryList)
            .orderBy("price", descending: true)
            .limit(itemCount)
            .get();
      } else {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("laptop")
            .where("price", isGreaterThanOrEqualTo: minPrice)
            .where("price", isLessThanOrEqualTo: maxPrice)
            .where("brand", whereIn: brandQueryList)
            .orderBy("price", descending: true)
            .startAfter([lastDream.price])
            .limit(itemCount)
            .get();
      }
    } else {
      if (lastDream == null) {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("laptop")
            .where("brand", whereIn: brandQueryList)
            .orderBy("point", descending: true)
            .limit(itemCount)
            .get();
      } else {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("laptop")
            .where("brand", whereIn: brandQueryList)
            .orderBy("point", descending: true)
            .startAfter([lastDream.point])
            .limit(itemCount)
            .get();
      }
    }
    
    for (DocumentSnapshot snap in _querySnapShot.docs) {
      Phones oneDream = Phones.fromMap(snap.data() as Map<String, dynamic>);
      _allDream.add(oneDream);
    }
    return _allDream;
  }
  
  @override
  Future<List<Phones>> getAllTVPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice) async{
    
    
    QuerySnapshot _querySnapShot;
    List<Phones> _allDream = [];
    print(minPrice);
    print(maxPrice);
    if (minPrice != null && maxPrice != null) {
      if (lastDream == null) {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("televizyon")
            .where("price", isGreaterThanOrEqualTo: minPrice)
            .where("price", isLessThanOrEqualTo: maxPrice)
            .where("brand", whereIn: brandQueryList)
            .orderBy("price", descending: true)
            .limit(itemCount)
            .get();
      } else {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("televizyon")
            .where("price", isGreaterThanOrEqualTo: minPrice)
            .where("price", isLessThanOrEqualTo: maxPrice)
            .where("brand", whereIn: brandQueryList)
            .orderBy("price", descending: true)
            .startAfter([lastDream.price])
            .limit(itemCount)
            .get();
      }
    } else {
      if (lastDream == null) {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("televizyon")
            .where("brand", whereIn: brandQueryList)
            .orderBy("point", descending: true)
            .limit(itemCount)
            .get();
      } else {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("televizyon")
            .where("brand", whereIn: brandQueryList)
            .orderBy("point", descending: true)
            .startAfter([lastDream.point])
            .limit(itemCount)
            .get();
      }
    }
    
    for (DocumentSnapshot snap in _querySnapShot.docs) {
      Phones oneDream = Phones.fromMap(snap.data() as Map<String, dynamic>);
      _allDream.add(oneDream);
    }
    return _allDream;
  }
  
  @override
  Future<List<Phones>> getAllMonitorPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice)async {
    QuerySnapshot _querySnapShot;
    List<Phones> _allDream = [];
    print(minPrice);
    print(maxPrice);
    if (minPrice != null && maxPrice != null) {
      if (lastDream == null) {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("monitor")
            .where("price", isGreaterThanOrEqualTo: minPrice)
            .where("price", isLessThanOrEqualTo: maxPrice)
            .where("brand", whereIn: brandQueryList)
            .orderBy("price", descending: true)
            .limit(itemCount)
            .get();
      } else {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("monitor")
            .where("price", isGreaterThanOrEqualTo: minPrice)
            .where("price", isLessThanOrEqualTo: maxPrice)
            .where("brand", whereIn: brandQueryList)
            .orderBy("price", descending: true)
            .startAfter([lastDream.price])
            .limit(itemCount)
            .get();
      }
    } else {
      if (lastDream == null) {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("monitor")
            .where("brand", whereIn: brandQueryList)
            .orderBy("point", descending: true)
            .limit(itemCount)
            .get();
      } else {
        _querySnapShot = await FirebaseFirestore.instance
            .collection("monitor")
            .where("brand", whereIn: brandQueryList)
            .orderBy("point", descending: true)
            .startAfter([lastDream.point])
            .limit(itemCount)
            .get();
      }
    }
    
    for (DocumentSnapshot snap in _querySnapShot.docs) {
      Phones oneDream = Phones.fromMap(snap.data() as Map<String, dynamic>);
      _allDream.add(oneDream);
    }
    return _allDream;
  }
}
