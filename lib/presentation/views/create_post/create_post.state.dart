part of 'create_post.view.dart';

sealed class _CreatePostState extends State<CreatePostView> with LoadingState {
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  FoodType foodType = FoodType.food;
  XFile? postImage;
  int sliderValue = 2;
  bool imageError = false;
  bool nameError = false;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void onSliderValueChanged(int value) {
    setState(() {
      sliderValue = value;
    });
  }

  void onFoodSelectionChanged(FoodType? value) {
    if (value != null) {
      setState(() {
        foodType = value;
      });
    }
  }

  void goToNextPage() {
    setState(() {
      imageError = false;
      nameError = false;
    });
    if (postImage == null) throwImageError();
    if (nameController.text.trim().isEmpty) throwNameError();
  }

  void throwImageError() {
    setState(() {
      imageError = true;
    });
    showAppSnackBar(context, TextManager.postImageError);
  }

  void throwNameError() {
    setState(() {
      nameError = true;
    });
    showAppSnackBar(context, TextManager.foodNameError);
  }

  void pickImage() async {
    final ImageSource? source = await showImageSourceSheet(context);
    try {
      if (source != null) {
        final XFile? pickedImage = await imagePicker.pickImage(source: source);
        setState(() {
          postImage = pickedImage;
        });
      }
    } catch (e) {
      if (mounted) showAppSnackBar(context, e.toString());
    }
  }
}
