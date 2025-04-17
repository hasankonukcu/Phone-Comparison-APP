
import 'package:compare_app/locator.dart';
import 'package:compare_app/models/comment.dart';
import 'package:compare_app/models/phone_model.dart';
import 'package:compare_app/models/reply_model.dart';
import 'package:compare_app/models/user.dart';
import 'package:compare_app/service/DBbase.dart';
import 'package:compare_app/service/firebase_db_service.dart';
import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class PhoneModels with ChangeNotifier implements DataBase {

  ViewState _state = ViewState.Idle;
  
  final FirebaseDBSevice _firebaseDBSevice = locator<FirebaseDBSevice>();

  List<Phones> _allPhones = [];
  
  String _sliderPhoneList = "populer";

  List compareList = [];

  List get _compareList => compareList;

  set removeCompareList(String id) {
    
    compareList.remove(id);
    
    notifyListeners();
  
  }
  
  set addCompareList(String id) {
    
    compareList.add(id);
    
    notifyListeners();
  
  }

  List<Phones>? get phones => _allPhones;

  String? get sliderPhones => _sliderPhoneList;

  set slider(String str) {
    
    if (str == "Bizim Seçtiklerimiz") {
      
      _sliderPhoneList = "bizimSectiklerimiz";
    
    }
    
    if (str == "En Popüler") {
      
      _sliderPhoneList = "popular";
    
    }
    
    if (str == "Fiyat Performans") {
      
      _sliderPhoneList = "fiyatPerformans";
    
    }

    notifyListeners();
  
  }

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<List<Phones>> getAllCompare(List ids) async {
    try {
      state = ViewState.Busy;
      return await _firebaseDBSevice.getAllCompare(ids);
    } finally {
      state = ViewState.Idle;
    }
  }

  Future<List<Phones>> getAllPhones() async {
    try {
      state = ViewState.Busy;
      _allPhones = await _firebaseDBSevice.getAllPhones();
      return _allPhones;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<List<Phones>> getAllPhonesPagination(Phones? lastDream, int itemCount,
      List<String>? brandQueryList, int? minPrice, int? maxPrice) async {
    return await _firebaseDBSevice.getAllPhonesPagination(
        lastDream, itemCount, brandQueryList, minPrice, maxPrice);
  }

  @override
  Future<List<Phones>> getAllPhone() async {
    return await _firebaseDBSevice.getAllPhone();
  }

  @override
  Future<Users> readUser(String userID) {
    // TODO: implement readUser
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser(Users user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Future<bool> updateDateOfBirth(String userID, newDate) {
    // TODO: implement updateDateOfBirth
    throw UnimplementedError();
  }

  @override
  Future<bool> updateMaritalStatus(String userID, newMaritalStatus) {
    // TODO: implement updateMaritalStatus
    throw UnimplementedError();
  }

  @override
  Future<bool> updateSurname(String userID, newsurName) {
    // TODO: implement updateSurname
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserName(String userID, newUserName) {
    // TODO: implement updateUserName
    throw UnimplementedError();
  }

  @override
  Future<List<CommentModel>> getComments(int phoneID,String type) {
    // TODO: implement getComments
    throw UnimplementedError();
  }
  
  @override
  Future<bool> like(CommentModel comment, Users user,String type) {
    // TODO: implement Like
    throw UnimplementedError();
  }
  
  @override
  Future<bool> disslike(CommentModel comment, Users user,String type) {
    // TODO: implement disslike
    throw UnimplementedError();
  }

  @override
  Future<bool> reply(ReplyModel reply,String type) {
    // TODO: implement reply
    throw UnimplementedError();
  }
  
  @override
  Future<List<ReplyModel>> getReplys(String phoneID, String commentID,String type) {
    // TODO: implement getReplys
    throw UnimplementedError();
  }
  
  @override
  Future<List<CommentModel>> getAllLikes(String userID,String type) {
    // TODO: implement getAllLikes
    throw UnimplementedError();
  }
  
  @override
  Future<List<Phones>> getAllLaptopPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice)async {
    return await _firebaseDBSevice.getAllLaptopPagination(
        lastDream, itemCount, brandQueryList, minPrice, maxPrice);
  }
  
  @override
  Future<List<Phones>> getAllTVPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice) async{
    return await _firebaseDBSevice.getAllTVPagination(
        lastDream, itemCount, brandQueryList, minPrice, maxPrice);
  }
  
  @override
  Future<List<Phones>> getAllMonitorPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice) async{
    return await _firebaseDBSevice.getAllMonitorPagination(
        lastDream, itemCount, brandQueryList, minPrice, maxPrice);
  }
}
