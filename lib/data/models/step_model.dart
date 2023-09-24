import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class StepModel {
  String _value;
  XFile? image;
  late final String _key;

  StepModel({
    required String value,
  })  : _key = const Uuid().v4(),
        _value = value;

  String get value => _value;
  String get key => _key;

  set value(value) {
    _value = value;
  }
}
