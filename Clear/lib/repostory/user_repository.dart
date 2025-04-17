import 'package:compare_app/locator.dart';
import 'package:compare_app/models/comment.dart';
import 'package:compare_app/models/user.dart';
import 'package:compare_app/service/auth_base.dart';
import 'package:compare_app/service/firebase_auth_service.dart';
import 'package:compare_app/service/firebase_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();

  final FirebaseDBSevice _firestoreDBService = locator<FirebaseDBSevice>();

  AppMode appMode = AppMode.RELEASE;
  Map<String, String> userTokens = <String, String>{};

  @override
  Future<Users?> currentUser() async {
    Users? _user = await _firebaseAuthService.currentUser();
    if (_user != null) {
      return await _firestoreDBService.readUser(_user.usersID);
    } else {
      return null;
    }
  }

  @override
  Future<Users?> signInAnonymous() async {
    return await _firebaseAuthService.signInAnonymous();
  }

  @override
  Future<bool> signOut() async {
    return await _firebaseAuthService.signOut();
    
  }

  @override
  Future<Users?> signInWithGoogle() async {
    Users? _user = await _firebaseAuthService.signInWithGoogle();
    if (_user != null) {
      bool sonuc = await _firestoreDBService.saveUser(_user);
      if (sonuc == true) {
        return await _firestoreDBService.readUser(_user.usersID);
      } else {
        await _firebaseAuthService.signOut();
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<Users?> signInWithFacebook() async {
    Users? _user = await _firebaseAuthService.signInWithFacebook();
    print(_user!.email);
    if (_user != null) {
      bool sonuc = await _firestoreDBService.saveUser(_user);
      if (sonuc == true) {
        return await _firestoreDBService.readUser(_user.usersID);
      } else {
        await _firebaseAuthService.signOut();
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<Users?> createUserWithEmailAndPassword(
      String email, String password) async {
    Users? _user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email, password);
    bool sonuc = await _firestoreDBService.saveUser(_user!);
    
    if (sonuc == true) {
      return await _firestoreDBService.readUser(_user.usersID);
    } else {
      return null;
    }
  }

  @override
  Future<Users?> signInWithEmailAndPassword(
      String email, String password) async {
    Users? _user =
        await _firebaseAuthService.signInWithEmailAndPassword(email, password);

    return await _firestoreDBService.readUser(_user!.usersID);
  }

  Future<bool> updateUserName(String userID, String newUserName) async {
    return await _firestoreDBService.updateUserName(userID, newUserName);
  }

  Future<bool> saveDream(CommentModel saveMessage,String type) async {
    var dbWrite = await _firestoreDBService.saveDream(saveMessage,type);
    if (dbWrite) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateSurname(String userID, String newsurName) async {
    return await _firestoreDBService.updateSurname(userID, newsurName);
  }

  Future<bool> updateDateOfBirth(String userID, String newDate) async {
    return await _firestoreDBService.updateDateOfBirth(userID, newDate);
  }
}
