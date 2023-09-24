import 'package:uuid/uuid.dart';

class IngredientModel {
  String _value;
  late final String _key;

  IngredientModel({
    required String value,
  })  : _key = const Uuid().v4(),
        _value = value;

  String get value => _value;
  String get key => _key;

  set value(value) {
    _value = value;
  }
}
