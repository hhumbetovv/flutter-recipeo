import 'package:get_it/get_it.dart';

import 'data/services/auth.service.dart';
import 'data/services/post.service.dart';
import 'data/services/storage.service.dart';
import 'data/services/user.service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(AuthService());
  locator.registerSingleton(StorageService());
  locator.registerSingleton(UserService());
  locator.registerSingleton(PostService());
}
