import 'package:flutter/material.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_second_page/components/ingredients_container/ingredients_container.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_second_page/components/steps_container/steps_container.dart';

class CreatePostSecondPage extends StatelessWidget {
  const CreatePostSecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IngredientsContainer(),
            SizedBox(height: 24),
            StepsContainer(),
          ],
        ),
      ),
    );
  }
}
