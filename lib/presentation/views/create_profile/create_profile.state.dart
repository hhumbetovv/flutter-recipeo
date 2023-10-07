part of 'create_profile.view.dart';

sealed class _CreateProfileState extends State<CreateProfileView> with LoadingState {
  XFile? image;
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  bool hasError = false;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void onSubmit() async {
    toggleLoading();
    setState(() {
      hasError = false;
    });
    final String displayName = nameController.text.trim();
    if (displayName.isEmpty) {
      setState(() {
        hasError = true;
      });
    } else {
      UserService userService = locator<UserService>();
      await userService.createUser(displayName: displayName, image: image);
      if (mounted) context.go(Routes.home);
    }
    toggleLoading();
  }

  void pickImage() async {
    final ImageSource? source = await showImageSourceSheet(context);
    try {
      if (source != null) {
        final XFile? pickedImage = await imagePicker.pickImage(source: source);
        setState(() {
          image = pickedImage;
        });
      }
    } catch (e) {
      if (mounted) showAppSnackBar(context, e.toString());
    }
  }
}
