part of '../steps_container.dart';

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

  bool buildWhen(CreatePostState previous, CreatePostState current) {
    final List<String> previousList = previous.steps.map((e) => e.value).toList();
    final List<String> currentList = current.steps.map((e) => e.value).toList();
    return previousList.length != currentList.length || ListUtils.checkEquality(previousList, currentList);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      buildWhen: buildWhen,
      builder: (context, state) {
        return ReorderableListView(
          proxyDecorator: proxyDecorator,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            for (int index = 0; index < state.steps.length; index++)
              _ListItem(
                key: ObjectKey(state.steps[index].key),
                step: state.steps[index].value,
                index: index,
                isSingle: state.steps.length == 1,
              ),
          ],
          onReorder: (oldIndex, newIndex) {
            context.read<CreatePostCubit>().reorderElement<StepModel>(oldIndex, newIndex);
          },
        );
      },
    );
  }
}
