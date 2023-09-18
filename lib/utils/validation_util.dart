import 'package:flutter_recipeo/constants/field_error.dart';

sealed class ValidationUtil {
  static const String _emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String _numberPattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static final RegExp _emailRegExp = RegExp(_emailPattern);
  static final RegExp _numberRegExp = RegExp(_numberPattern);

  static FieldError? checkUsername(String? value) {
    value = value?.replaceAll(' ', '');
    if (value == null || value.isEmpty) return FieldError.empty;
    return null;
  }

  // static FieldError? checkNumber(String? value) {
  //   value = value?.replaceAll(' ', '');
  //   if (value == null || value.isEmpty) return FieldError.empty;
  //   if (!isNumber(value)) return FieldError.wrongNumberFormat;
  //   return null;
  // }

  static FieldError? checkEmail(String? value) {
    value = value?.replaceAll(' ', '');
    if (value == null || value.isEmpty) return FieldError.empty;
    if (!isEmail(value)) return FieldError.wrongEmailFormat;
    return null;
  }

  // static FieldError? checkEmailOrNumber(String? value) {
  //   value = value?.replaceAll(' ', '');
  //   if (value == null || value.isEmpty) return FieldErrors.empty;
  //   if (!isEmail(value) && !isNumber(value)) return FieldErrors.wrongEmailOrNumberFormat;
  //   return null;
  // }

  static FieldError? checkPassword(String? value) {
    value = value?.replaceAll(' ', '');
    if (value == null || value.isEmpty) return FieldError.empty;
    if (value.length < 6) return FieldError.wrongLengthPassword;
    if (!value.contains(RegExp(r'[a-zA-Z]'))) return FieldError.mustHaveLetter;
    if (!value.contains(RegExp(r'[0-9]'))) return FieldError.mustHaveNumber;
    return null;
  }

  static bool isNumber(String value) {
    return _numberRegExp.hasMatch(value);
  }

  static bool isEmail(String value) {
    return _emailRegExp.hasMatch(value);
  }
}
