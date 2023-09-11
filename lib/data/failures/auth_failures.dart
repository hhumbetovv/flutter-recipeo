import 'package:flutter_recipeo/constants/text.manager.dart';

sealed class FirebaseFailures {
  static String getAuthFailure(String code) {
    switch (code) {
      case 'email-already-in-use':
        return TextManager.usedEmail;
      case 'user-not-found':
        return TextManager.emailNotFound;
      case 'wrong-password':
        return TextManager.wrongPassword;
      default:
        return TextManager.errorOccured;
    }
  }
}
