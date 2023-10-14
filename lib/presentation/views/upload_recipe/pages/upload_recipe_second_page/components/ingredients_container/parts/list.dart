part of '../ingredients_container.dart';

class _List extends StatelessWidget {
  const _List({
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

  bool buildWhen(UploadRecipeState previous, UploadRecipeState current) {
    final List<String> previousList = previous.ingredients.map((e) => e.value).toList();
    final List<String> currentList = current.ingredients.map((e) => e.value).toList();
    return previousList.length != currentList.length || ListUtils.checkEquality(previousList, currentList);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
      buildWhen: buildWhen,
      builder: (context, state) {
        return ReorderableListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          proxyDecorator: proxyDecorator,
          children: [
            for (int index = 0; index < state.ingredients.length; index++)
              _ListItem(
                key: ObjectKey(state.ingredients[index].key),
                ingredient: state.ingredients[index].value,
                index: index,
                isSingle: state.ingredients.length == 1,
              ),
          ],
          onReorder: (oldIndex, newIndex) {
            context.read<UploadRecipeCubit>().reorderElement<IngredientModel>(oldIndex, newIndex);
          },
        );
      },
    );
  }
}
