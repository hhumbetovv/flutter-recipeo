part of 'recipe_details.view.dart';

sealed class _RecipeDetailsState extends State<RecipeDetailsView> with AutomaticKeepAliveClientMixin {
  late final DraggableScrollableController controller;
  final ValueNotifier<double?> dragSize = ValueNotifier(null);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    ValueNotifier(null);
    controller = DraggableScrollableController()
      ..addListener(() {
        dragSize.value = controller.size;
      });
  }

  @override
  void dispose() {
    controller.dispose();
    dragSize.dispose();
    super.dispose();
  }
}
