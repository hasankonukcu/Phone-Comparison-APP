
import 'package:compare_app/repostory/user_repository.dart';
import 'package:compare_app/service/firebase_auth_service.dart';
import 'package:compare_app/service/firebase_db_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseDBSevice());
  locator.registerLazySingleton(() => FirebaseAuthService());
  
  locator.registerLazySingleton(() => UserRepository());


}
