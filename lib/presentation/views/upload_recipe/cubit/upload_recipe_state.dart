part of 'upload_recipe_cubit.dart';

class UploadRecipeState extends Equatable {
  final int pageIndex;
  final bool isLoading;
  final XFile? recipeImage;
  final bool imageError;
  final FoodType foodType;
  final CookingDuration cookingDuration;
  final String foodName;
  final bool nameError;
  final String foodDescription;
  final List<IngredientModel> ingredients;
  final List<StepModel> steps;

  const UploadRecipeState({
    required this.pageIndex,
    required this.isLoading,
    required this.recipeImage,
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
        recipeImage,
        imageError,
        foodType,
        cookingDuration,
        foodName,
        nameError,
        foodDescription,
        ingredients,
        steps,
      ];

  UploadRecipeState copyWith({
    bool? isLoading,
    XFile? recipeImage,
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
    return UploadRecipeState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLoading: isLoading ?? this.isLoading,
      recipeImage: this.recipeImage,
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

  UploadRecipeState copyWithForImage({
    int? pageIndex,
    bool? isLoading,
    XFile? recipeImage,
    bool? imageError,
    FoodType? foodType,
    CookingDuration? cookingDuration,
    String? foodName,
    bool? nameError,
    String? foodDescription,
    List<IngredientModel>? ingredients,
    List<StepModel>? steps,
  }) {
    return UploadRecipeState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLoading: isLoading ?? this.isLoading,
      recipeImage: recipeImage,
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
