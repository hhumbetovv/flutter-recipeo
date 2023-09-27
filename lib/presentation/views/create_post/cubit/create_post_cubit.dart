import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/cooking_duration.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/data/models/post_model.dart';
import 'package:flutter_recipeo/data/models/reordable_element_model.dart';
import 'package:flutter_recipeo/data/models/user_model.dart';
import 'package:flutter_recipeo/data/services/auth.service.dart';
import 'package:flutter_recipeo/data/services/post.service.dart';
import 'package:flutter_recipeo/data/services/storage.service.dart';
import 'package:flutter_recipeo/data/services/user.service.dart';
import 'package:flutter_recipeo/locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

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

  List<T> _getReordableList<T extends ReordableElementModel>() {
    if (T == IngredientModel) {
      return List<T>.from(state.ingredients);
    } else {
      return List<T>.from(state.steps);
    }
  }

  void _setReordableList<T extends ReordableElementModel>(List<T> list) {
    if (T == IngredientModel) {
      emit(state.copyWith(ingredients: list as List<IngredientModel>));
    } else {
      emit(state.copyWith(steps: list as List<StepModel>));
    }
  }

  void addReordableElement<T extends ReordableElementModel>() {
    if (T == IngredientModel) {
      _setReordableList<IngredientModel>([...state.ingredients, IngredientModel(value: '')]);
    } else {
      _setReordableList<StepModel>([...state.steps, StepModel(value: '')]);
    }
  }

  void setReordableElement<T extends ReordableElementModel>(String value, int index) {
    final List<T> updatedList = _getReordableList<T>();
    updatedList[index].value = value;
    _setReordableList<T>(updatedList);
  }

  void reorderElement<T extends ReordableElementModel>(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex--;
    final List<T> updatedList = _getReordableList<T>();
    final T element = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, element);
    _setReordableList<T>(updatedList);
  }

  void removeReordableElement<T extends ReordableElementModel>(int index) {
    final List<T> updatedList = _getReordableList<T>();
    updatedList.removeAt(index);
    _setReordableList<T>(updatedList);
  }

  Future<void> uploadPost() async {
    try {
      AuthService authService = locator<AuthService>();
      UserService userService = locator<UserService>();
      PostService postService = locator<PostService>();
      StorageService storageService = locator<StorageService>();

      final String id = const Uuid().v4();
      final String imagePath = 'posts/$id.${state.postImage!.path.split(".").last}';
      final String imageUrl = await storageService.uploadImage(File(state.postImage!.path), imagePath);

      final PostModel post = PostModel(
        id: id,
        foodName: state.foodName,
        foodDescription: state.foodDescription,
        image: imageUrl,
        type: state.foodType,
        duration: state.cookingDuration,
        ingredients: state.ingredients.map((el) => el.value).where((val) => val.isNotEmpty).toList(),
        steps: state.steps.map((el) => el.value).where((val) => val.isNotEmpty).toList(),
      );
      await postService.createPost(post: post);

      final UserModel user = await userService.getUser(uid: authService.currentUserId!);
      await userService.updateUser(
        user: UserModel(
          uid: user.uid,
          displayName: user.displayName,
          image: user.image,
          posts: [...user.posts, id],
        ),
      );
    } catch (e) {
      rethrow;
    }
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
        ],
      ),
    );
  }
}