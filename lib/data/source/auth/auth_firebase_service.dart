import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/model/auth/auth_user_req.dart';

abstract class AuFirebaseService {
  Future<void> signIn(UserAuth userAuth);
  Future<void> signOut();
}

class AuFirebaseServiceImpl extends AuFirebaseService {
  @override
  Future<void> signIn(UserAuth userAuth) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userAuth.email!, password: userAuth.password!);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
