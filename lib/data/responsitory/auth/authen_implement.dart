import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';
import 'package:flutter_application_1/domains/repository/auth/authen_repository.dart';
import 'package:flutter_application_1/domains/source/auth/authen_service.dart';
import 'package:flutter_application_1/getIt.dart';

class AuthenImplement extends AuthenRepository {
  @override
  Future<Either> createUserWithEmailAndPassword(
      CreateUserRq createUserRq) async {
    try {
      return await getIt<AuthenService>()
          .createUserWithEmailAndPassword(createUserRq);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> isSignedIn() {
    throw UnimplementedError();
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await getIt<AuthenService>()
          .signInWithEmailAndPassword(email, password);
      return result.fold(
        (l) => throw Exception(l),
        (r) => r,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
