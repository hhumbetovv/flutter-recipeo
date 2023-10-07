part of 'create_post_cubit.dart';

class CreatePostState extends Equatable {
  final int pageIndex;
  final bool isLoading;
  final XFile? postImage;
  final bool imageError;
  final FoodType foodType;
  final CookingDuration cookingDuration;
  final String foodName;
  final bool nameError;
  final String foodDescription;
  final List<IngredientModel> ingredients;
  final List<StepModel> steps;

  const CreatePostState({
    required this.pageIndex,
    required this.isLoading,
    required this.postImage,
    required this.imageError,
    required this.foodType,
    required this.cookingDuration,
    required this.foodName,
    required this.nameError,
    required this.foodDescription,
    required this.ingredients,
    required this.steps,
  });

  @override
  List<Object?> get props => [
        pageIndex,
        isLoading,
        postImage,
        imageError,
        foodType,
        cookingDuration,
        foodName,
        nameError,
        foodDescription,
        ingredients,
        steps,
      ];

  CreatePostState copyWith({
    bool? isLoading,
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
      pageIndex: pageIndex ?? this.pageIndex,
      isLoading: isLoading ?? this.isLoading,
      postImage: this.postImage,
      imageError: imageError ?? this.imageError,
      foodType: foodType ?? this.foodType,
      cookingDuration: cookingDuration ?? this.cookingDuration,
      foodName: foodName ?? this.foodName,
      nameError: nameError ?? this.nameError,
      foodDescription: foodDescription ?? this.foodDescription,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
    );
  }

  CreatePostState copyWithForImage({
    int? pageIndex,
    bool? isLoading,
    XFile? postImage,
    bool? imageError,
    FoodType? foodType,
    CookingDuration? cookingDuration,
    String? foodName,
    bool? nameError,
    String? foodDescription,
    List<IngredientModel>? ingredients,
    List<StepModel>? steps,
  }) {
    return CreatePostState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLoading: isLoading ?? this.isLoading,
      postImage: postImage,
      imageError: imageError ?? this.imageError,
      foodType: foodType ?? this.foodType,
      cookingDuration: cookingDuration ?? this.cookingDuration,
      foodName: foodName ?? this.foodName,
      nameError: nameError ?? this.nameError,
      foodDescription: foodDescription ?? this.foodDescription,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
    );
  }
}
