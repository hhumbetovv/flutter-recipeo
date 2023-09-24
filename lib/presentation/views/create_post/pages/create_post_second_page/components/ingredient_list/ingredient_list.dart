import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_recipeo/presentation/global/inputs/base_decoration.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'parts/ingredient.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({
    Key? key,
  }) : super(key: key);

  Widget proxyDecorator(child, index, animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Material(
          elevation: 0,
          color: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }

  bool checkEquality<T>(List<T> list1, List<T> list2) {
    if (list1.length != list2.length) {
      return false;
    }

    final set1 = Set<T>.from(list1);
    final set2 = Set<T>.from(list2);

    return set1.length == set2.length && set1.containsAll(set2);
  }

  bool buildWhen(CreatePostState previous, CreatePostState current) {
    final List<String> previousList = previous.ingredients.map((e) => e.value).toList();
    final List<String> currentList = current.ingredients.map((e) => e.value).toList();
    return previousList.length != currentList.length || checkEquality(previousList, currentList);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      buildWhen: buildWhen,
      builder: (context, state) {
        return ReorderableListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          proxyDecorator: proxyDecorator,
          children: [
            for (int index = 0; index < state.ingredients.length; index++)
              Ingredient(
                key: ObjectKey(state.ingredients[index].key),
                ingredient: state.ingredients[index].value,
                index: index,
                isSingle: state.ingredients.length == 1,
              ),
          ],
          onReorder: (oldIndex, newIndex) {
            context.read<CreatePostCubit>().reorderIngredient(oldIndex, newIndex);
          },
        );
      },
    );
  }
}
