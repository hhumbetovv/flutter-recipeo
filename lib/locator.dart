import 'package:flutter_recipeo/data/services/auth.service.dart';
import 'package:flutter_recipeo/data/services/post.service.dart';
import 'package:flutter_recipeo/data/services/storage.service.dart';
import 'package:flutter_recipeo/data/services/user.service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(AuthService());
  locator.registerSingleton(StorageService());
  locator.registerSingleton(UserService());
  locator.registerSingleton(PostService());
}
