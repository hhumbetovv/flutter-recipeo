import 'package:flutter/material.dart';
import 'package:flutter_recipeo/config/init.dart';

import 'presentation/app.dart';

void main() async {
  await initialize();
  runApp(const RecipeoApp());
}
