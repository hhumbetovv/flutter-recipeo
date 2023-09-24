part of 'create_post_cubit.dart';

class CreatePostState extends Equatable {
  //! First Page
  final XFile? postImage;
  final bool imageError;
  final FoodType foodType;
  final CookingDuration cookingDuration;
  final String foodName;
  final bool nameError;
  final String foodDescription;

  //! Second Page
  final int pageIndex;
  final List<IngredientModel> ingredients;
  final List<StepModel> steps;

  const CreatePostState({
    required this.postImage,
    required this.imageError,
    required this.foodType,
    required this.cookingDuration,
    required this.foodName,
    required this.nameError,
    required this.foodDescription,
    required this.pageIndex,
    required this.ingredients,
    required this.steps,
  });

  @override
  List<Object?> get props => [
        postImage,
        imageError,
        foodType,
        cookingDuration,
        foodName,
        nameError,
        pageIndex,
        foodDescription,
        ingredients,
      ];

  CreatePostState copyWith({
    XFile? postImage,
    bool? imageError,
    FoodType? foodType,
    CookingDuration? cookingDuration,
    String? foodName,
    bool? nameError,
    String? foodDescription,
    int? pageIndex,
    List<IngredientModel>? ingredients,
    List<StepModel>? steps,
  }) {
    return CreatePostState(
      postImage: this.postImage,
      imageError: imageError ?? this.imageError,
      foodType: foodType ?? this.foodType,
      cookingDuration: cookingDuration ?? this.cookingDuration,
      foodName: foodName ?? this.foodName,
      nameError: nameError ?? this.nameError,
      foodDescription: foodDescription ?? this.foodDescription,
      pageIndex: pageIndex ?? this.pageIndex,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
    );
  }

  CreatePostState copyWithForImage({
    XFile? postImage,
    bool? imageError,
    FoodType? foodType,
    CookingDuration? cookingDuration,
    String? foodName,
    bool? nameError,
    String? foodDescription,
    int? pageIndex,
    List<IngredientModel>? ingredients,
    List<StepModel>? steps,
  }) {
    return CreatePostState(
      postImage: postImage,
      imageError: imageError ?? this.imageError,
      foodType: foodType ?? this.foodType,
      cookingDuration: cookingDuration ?? this.cookingDuration,
      foodName: foodName ?? this.foodName,
      nameError: nameError ?? this.nameError,
      foodDescription: foodDescription ?? this.foodDescription,
      pageIndex: pageIndex ?? this.pageIndex,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
    );
  }
}
