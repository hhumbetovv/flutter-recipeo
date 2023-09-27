import 'package:uuid/uuid.dart';

class ReordableElementModel {
  String value;
  late final String _key;

  ReordableElementModel({
    required this.value,
  }) : _key = const Uuid().v4();

  String get key => _key;
}

class IngredientModel extends ReordableElementModel {
  IngredientModel({
    required super.value,
  });
}

class StepModel extends ReordableElementModel {
  StepModel({
    required super.value,
  });
}
