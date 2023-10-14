import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/init.dart';
import 'presentation/app.dart';
import 'presentation/views/upload_recipe/cubit/upload_recipe_cubit.dart';

void main() async {
  await initialize();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UploadRecipeCubit()),
      ],
      child: const RecipeoApp(),
    ),
  );
}
