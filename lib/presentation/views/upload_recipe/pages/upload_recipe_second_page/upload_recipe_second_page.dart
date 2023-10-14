import 'package:flutter/material.dart';

import 'components/ingredients_container/ingredients_container.dart';
import 'components/steps_container/steps_container.dart';

class UploadRecipeSecondPage extends StatelessWidget {
  const UploadRecipeSecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IngredientsContainer(),
          SizedBox(height: 24),
          StepsContainer(),
        ],
      ),
    );
  }
}
