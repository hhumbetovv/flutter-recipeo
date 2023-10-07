import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/init.dart';
import 'presentation/app.dart';
import 'presentation/views/create_post/cubit/create_post_cubit.dart';

void main() async {
  await initialize();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CreatePostCubit()),
    ],
    child: const RecipeoApp(),
  ));
}
