import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user!.uid;
  }

  Future<bool> isSignedIn() async {
    final currentUser = await auth.currentUser;
    return currentUser != null;
  }

  Future<String> signUpWithEmailAndPassword(String email, String password,
      {required String username}) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return result.user!.uid;
  }

  Future<void> signOut() {
    return Future.wait([auth.signOut()]);
  }
}
