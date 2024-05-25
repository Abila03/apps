import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<bool> isLoggedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  static Future<void> registerUser(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> logoutUser() async {
    await _auth.signOut();
  }

  static Future<String?> getCurrentUserId() async {
    final currentUser = _auth.currentUser;
    return currentUser?.uid;
  }
}
