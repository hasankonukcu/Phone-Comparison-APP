import 'package:compare_app/models/comment.dart';
import 'package:compare_app/models/phone_model.dart';
import 'package:compare_app/models/reply_model.dart';
import 'package:compare_app/models/user.dart';

abstract class DataBase {
  Future<bool> saveUser(Users user);
  Future<Users> readUser(String userID);
  Future<bool> updateUserName(String userID, newUserName);
  Future<bool> updateSurname(String userID, newsurName);
  Future<bool> updateDateOfBirth(String userID, newDate);
  Future<bool> updateMaritalStatus(String userID, newMaritalStatus);
  Future<List<CommentModel>> getComments(int phoneID,String type);

  Future<List<Phones>> getAllCompare(List ids);
  Future<bool> like(CommentModel comment,Users user,String type);
  Future<bool> disslike(CommentModel comment,Users user,String type);
  Future<bool> reply(ReplyModel reply,String type);
  Future<List<CommentModel>> getAllLikes(String userID,String type);
  Future<List<Phones>> getAllPhonesPagination(Phones? lastDream, int itemCount,
      List<String>? brandQueryList, int? minPrice, int? maxPrice);
  Future<List<Phones>> getAllLaptopPagination(Phones? lastDream, int itemCount,
      List<String>? brandQueryList, int? minPrice, int? maxPrice);
  Future<List<Phones>> getAllTVPagination(Phones? lastDream, int itemCount,
      List<String>? brandQueryList, int? minPrice, int? maxPrice);
  Future<List<Phones>> getAllMonitorPagination(Phones? lastDream, int itemCount,
      List<String>? brandQueryList, int? minPrice, int? maxPrice);
  Future<List<Phones>> getAllPhone();
}
