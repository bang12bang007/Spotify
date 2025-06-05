import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';

abstract class AuthenRepository {
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<Either> createUserWithEmailAndPassword(CreateUserRq createUserRq);
  Future<void> signOut();
  Future<bool> isSignedIn();
}
