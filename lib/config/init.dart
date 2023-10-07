import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import '../firebase_options.dart';
import '../locator.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();
}
