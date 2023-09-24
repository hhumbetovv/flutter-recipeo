import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/config/init.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';

import 'presentation/app.dart';

void main() async {
  await initialize();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CreatePostCubit()),
    ],
    child: const RecipeoApp(),
  ));
}
