import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/cooking_duration.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/data/models/ingredient_model.dart';
import 'package:flutter_recipeo/data/models/step_model.dart';
import 'package:image_picker/image_picker.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit()
      : super(
          CreatePostState(
            cookingDuration: CookingDuration.thirty,
            foodDescription: '',
            foodName: '',
            foodType: FoodType.food,
            imageError: false,
            nameError: false,
            postImage: null,
            pageIndex: 0,
            ingredients: [
              IngredientModel(value: ''),
              IngredientModel(value: ''),
            ],
            steps: [
              StepModel(value: ''),
            ],
          ),
        );

  final ImagePicker imagePicker = ImagePicker();

  void pickImage(ImageSource? source) async {
    try {
      if (source != null) {
        final XFile? pickedImage = await imagePicker.pickImage(source: source);
        emit(state.copyWithForImage(postImage: pickedImage));
      }
    } catch (e) {
      rethrow;
    }
  }

  void onFoodTypeSelected(FoodType? type) {
    if (type != null) {
      emit(state.copyWith(foodType: type));
    }
  }

  void onFoodNameChanged(String name) {
    emit(state.copyWith(foodName: name));
  }

  void onFoodDescriptionChanged(String description) {
    emit(state.copyWith(foodDescription: description));
  }

  void onCookingDurationChanged(int value) {
    emit(state.copyWith(
      cookingDuration: switch (value) {
        1 => CookingDuration.lessThanTen,
        3 => CookingDuration.moreThanSixty,
        _ => CookingDuration.thirty,
      },
    ));
  }

  void setPageIndex(int value) {
    emit(state.copyWith(pageIndex: value));
  }

  bool checkNavigation() {
    emit(state.copyWith(nameError: false, imageError: false));
    if (state.foodName.trim().isEmpty) emit(state.copyWith(nameError: true));
    if (state.postImage == null) emit(state.copyWith(imageError: true));
    if (state.foodName.trim().isNotEmpty && state.postImage != null) return true;
    return false;
  }

  void resetNameError() {
    emit(state.copyWith(nameError: false));
  }

  void resetImageError() {
    emit(state.copyWith(imageError: false));
  }

  void addIngredient() {
    emit(
      state.copyWith(
        ingredients: [
          ...state.ingredients,
          IngredientModel(value: ''),
        ],
      ),
    );
  }

  void setIngredient(String value, int index) {
    final List<IngredientModel> updatedIngredients = List<IngredientModel>.from(state.ingredients);
    updatedIngredients[index].value = value;
    emit(state.copyWith(ingredients: updatedIngredients));
  }

  void reorderIngredient(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex--;
    final List<IngredientModel> updatedIngredients = List<IngredientModel>.from(state.ingredients);
    final IngredientModel ingredient = updatedIngredients.removeAt(oldIndex);
    updatedIngredients.insert(newIndex, ingredient);
    emit(state.copyWith(ingredients: updatedIngredients));
  }

  void removeIngredient(int index) {
    final List<IngredientModel> updatedIngredients = List<IngredientModel>.from(state.ingredients);
    updatedIngredients.removeAt(index);
    emit(state.copyWith(ingredients: updatedIngredients));
  }

  void dispose() {
    emit(
      CreatePostState(
          postImage: null,
          imageError: false,
          foodType: FoodType.food,
          cookingDuration: CookingDuration.thirty,
          foodName: '',
          nameError: false,
          foodDescription: '',
          pageIndex: 0,
          ingredients: [
            IngredientModel(value: ''),
            IngredientModel(value: ''),
          ],
          steps: [
            StepModel(value: ''),
          ]),
    );
  }
}
