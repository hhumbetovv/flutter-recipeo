part of 'create_post.view.dart';

sealed class _CreatePostState extends State<CreatePostView> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    // context.read<CreatePostCubit>().dispose();
    super.dispose();
  }
}
