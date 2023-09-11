import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_recipeo/data/models/user.model.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _service = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  UserModel? get currentUser {
    User? user = _service.currentUser;
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Future<bool> get isFirstRun async {
    DocumentSnapshot userdoc = await users.doc(currentUser?.uid).get();
    if (userdoc.exists) return false;
    return true;
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await _service.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      return await _service.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register({required String email, required String password}) async {
    try {
      await _service.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //     debugPrint('credential: ${credential.toString()}');
  //     debugPrint(googleUser?.displayName.toString());
  //     debugPrint(googleUser?.photoUrl.toString());
  //     await _service.signInWithCredential(credential);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
