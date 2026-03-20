import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';

abstract class AuthenService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<Either<String, User?>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either> createUserWithEmailAndPassword(CreateUserRq createUserRq);
  Future<void> signOut();
  Future<bool> isSignedIn();
}

class AuthenServiceImpl extends AuthenService {
  @override
  Future<Either> createUserWithEmailAndPassword(
      CreateUserRq createUserRq) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: createUserRq.email, password: createUserRq.password);

      return const Right('success');
    } on FirebaseAuthException catch (e) {
      var message = 'Đã xảy ra lỗi, vui lòng thử lại.';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'email-already-in-use') {
        message = "Email đã tồn tại.";
      }
      return Left(message);
    }
  }

  @override
  Future<bool> isSignedIn() {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, User?>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left('Email không tồn tại.');
      } else if (e.code == 'wrong-password') {
        return const Left('Mật khẩu không chính xác.');
      } else {
        return const Left('Đã xảy ra lỗi, vui lòng thử lại.');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
