import 'dart:async';
import 'package:compare_app/locator.dart';
import 'package:compare_app/models/comment.dart';
import 'package:compare_app/models/phone_model.dart';
import 'package:compare_app/models/reply_model.dart';
import 'package:compare_app/models/user.dart';
import 'package:compare_app/repostory/user_repository.dart';
import 'package:compare_app/service/DBbase.dart';
import 'package:compare_app/service/auth_base.dart';
import 'package:compare_app/service/firebase_db_service.dart';
import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements AuthBase, DataBase {
  ViewState _state = ViewState.Idle;
  final UserRepository _userRepository = locator<UserRepository>();
  Users? _user;
  String? emailErrorMessage;
  String? passwordErrorMessage;
  String? dreamErrorMessage;
  final FirebaseDBSevice _firebaseDBSevice = locator<FirebaseDBSevice>();

  List<Phones> _allPhones = [];
  String _sliderPhoneList = "populer";
  int _lastCategories = 0;

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
  int? get lastCatogori => _lastCategories;

  set lastCatog(int int){
    _lastCategories = int;
  }

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

  Users? get user => _user;

  ViewState get state => _state;
  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<Users?> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      notifyListeners();
      if (_user != null)
        return _user;
      else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users?> signInAnonymous() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInAnonymous();
      notifyListeners();

      return _user;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      notifyListeners();

      return sonuc;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users?> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      notifyListeners();
      if (_user != null)
        return _user;
      else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users?> signInWithFacebook() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithFacebook();
      notifyListeners();
      if (_user != null)
        return _user;
      else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      if (_emailPassControl(email, password)) {
        state = ViewState.Busy;
        _user = await _userRepository.createUserWithEmailAndPassword(
            email, password);
        notifyListeners();

        return _user;
      } else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<Users?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      if (_emailPassControl(email, password)) {
        state = ViewState.Busy;
        _user =
            await _userRepository.signInWithEmailAndPassword(email, password);
        notifyListeners();

        return _user;
      } else
        return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  bool _emailPassControl(String email, String pass) {
    var sonuc = true;

    if (pass.length < 6) {
      passwordErrorMessage = "En az 6 karakter olmalı";
      sonuc = false;
    } else
      passwordErrorMessage = null;
    if (!email.contains('@')) {
      emailErrorMessage = "Geçersiz email adresi";
      sonuc = false;
    } else
      emailErrorMessage = null;

    return sonuc;
  }

  bool _createDreamControl(String dream) {
    var sonuc = true;

    if (dream.length < 10) {
      dreamErrorMessage = "En az 10 karakter olmalı";
      sonuc = false;
    }
    return sonuc;
  }

/*
  Future<List<Dreams>> getAllDream(String userID) async {
    var allDreamList = await _userRepository.getAllDream(userID);
    return allDreamList;
  }*/

  Future<bool> saveDream(CommentModel saveComment,String type) async {
    return await _userRepository.saveDream(saveComment,type);
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

  @override
  Future<List<Phones>> getAllPhone() async {
    return await _firebaseDBSevice.getAllPhone();
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
  Future<Users> readUser(String userID) async {
    return await _firebaseDBSevice.readUser(userID);
  }

  @override
  Future<bool> saveUser(Users user) async {
    return await _firebaseDBSevice.saveUser(user);
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
  Future<List<CommentModel>> getComments(int phoneID,String type) async {
    return await _firebaseDBSevice.getComments(phoneID,type);
  }

  @override
  Future<bool> like(CommentModel comment, Users user,String type) async {
    return await _firebaseDBSevice.like(comment, user,type);
  }

  @override
  Future<bool> disslike(CommentModel comment, Users user,String type) async {
    return await _firebaseDBSevice.disslike(comment, user,type);
  }

  @override
  Future<bool> reply(ReplyModel reply,String type) async {
    return await _firebaseDBSevice.reply(reply,type);
  }
  
  @override
  Future<List<CommentModel>> getAllLikes(String userID,String type) async{
    return await _firebaseDBSevice.getAllLikes(userID,type);
  }
  
  @override
  Future<List<Phones>> getAllLaptopPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice) async{
    return await _firebaseDBSevice.getAllLaptopPagination(
        lastDream, itemCount, brandQueryList, minPrice, maxPrice);
  }
  
  @override
  Future<List<Phones>> getAllTVPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice) async{
    return await _firebaseDBSevice.getAllTVPagination(
        lastDream, itemCount, brandQueryList, minPrice, maxPrice);
  }
  
  @override
  Future<List<Phones>> getAllMonitorPagination(Phones? lastDream, int itemCount, List<String>? brandQueryList, int? minPrice, int? maxPrice)async {
    return await _firebaseDBSevice.getAllMonitorPagination(
        lastDream, itemCount, brandQueryList, minPrice, maxPrice);
  }

 
}
