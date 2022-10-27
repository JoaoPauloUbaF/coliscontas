import 'package:coliscontas/database/auth/auth_service.dart';
import 'package:coliscontas/database/user/user_repository.dart';
import 'package:coliscontas/models/user_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

setup() {
  getIt.registerLazySingleton<UserRepository>(() => UserRepository());
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerFactory<UserModel>(
      () => UserModel.fromMap(getIt<UserRepository>().getUserInstance()));
}
