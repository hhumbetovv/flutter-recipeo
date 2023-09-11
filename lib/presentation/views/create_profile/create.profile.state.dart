part of 'create.profile.view.dart';

sealed class CreateProfileState extends State<CreateProfileView> with LoadingState {
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
      //! SetUp Singletons
      AuthService authService = locator<AuthService>();
      UserService userService = locator<UserService>();
      StorageService storageService = locator<StorageService>();
      //! Get uid
      final String uid = authService.currentUser!.uid;
      //! Get Image
      String? imageUrl;
      if (image != null) {
        String imagePath = 'users/$uid.${image!.path.split(".").last}';
        imageUrl = await storageService.uploadImage(File(image!.path), imagePath);
      }
      //! Create User
      final UserModel user = UserModel(
        uid: authService.currentUser!.uid,
        displayName: displayName,
        image: imageUrl,
      );
      //! Upload User
      await userService.createUser(user: user);
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
