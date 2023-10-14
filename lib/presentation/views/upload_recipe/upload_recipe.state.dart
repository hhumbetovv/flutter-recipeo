part of 'upload_recipe.view.dart';

sealed class _UploadRecipeState extends State<UploadRecipeView> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
