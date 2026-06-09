import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';

import '../../../src/core/domains/source/auth/authen_service.dart';
import '../../../src/core/infrastructure/repository/authen_repository.dart';

class AuthenImplement implements AuthenRepository {
  final AuthenService authenService;

  AuthenImplement(this.authenService);

  @override
  Future<Either<String, User?>> createUserWithEmailAndPassword(
    CreateUserRq createUserRq,
  ) {
    return authenService.createUserWithEmailAndPassword(
      createUserRq,
    );
  }

  @override
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final result = await authenService.signInWithEmailAndPassword(
      email,
      password,
    );

    return result.fold(
      (message) {
        throw Exception(message);
      },
      (user) {
        return user;
      },
    );
  }

  @override
  Future<bool> isSignedIn() {
    return authenService.isSignedIn();
  }

  @override
  Future<void> signOut() {
    return authenService.signOut();
  }
}
