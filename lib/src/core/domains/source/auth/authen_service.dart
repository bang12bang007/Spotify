import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';

abstract class AuthenService {
  Future<Either<String, User?>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<String, User?>> createUserWithEmailAndPassword(
    CreateUserRq createUserRq,
  );

  Future<void> signOut();

  Future<bool> isSignedIn();
}

class AuthenServiceImpl implements AuthenService {
  final FirebaseAuth firebaseAuth;

  AuthenServiceImpl(this.firebaseAuth);

  @override
  Future<Either<String, User?>> createUserWithEmailAndPassword(
    CreateUserRq createUserRq,
  ) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: createUserRq.email.trim(),
        password: createUserRq.password.trim(),
      );

      return Right(credential.user);
    } on FirebaseAuthException catch (error) {
      return Left(_mapFirebaseAuthError(error));
    } catch (_) {
      return const Left(
        'Đã xảy ra lỗi, vui lòng thử lại.',
      );
    }
  }

  @override
  Future<Either<String, User?>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      return Right(credential.user);
    } on FirebaseAuthException catch (error) {
      return Left(_mapFirebaseAuthError(error));
    } catch (_) {
      return const Left(
        'Đã xảy ra lỗi, vui lòng thử lại.',
      );
    }
  }

  @override
  Future<bool> isSignedIn() async {
    return firebaseAuth.currentUser != null;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  String _mapFirebaseAuthError(
    FirebaseAuthException error,
  ) {
    switch (error.code) {
      case 'weak-password':
        return 'Mật khẩu quá yếu.';

      case 'email-already-in-use':
        return 'Email đã tồn tại.';

      case 'invalid-email':
        return 'Email không hợp lệ.';

      case 'user-disabled':
        return 'Tài khoản đã bị vô hiệu hóa.';

      case 'user-not-found':
        return 'Không tìm thấy tài khoản.';

      case 'wrong-password':
      case 'invalid-credential':
        return 'Email hoặc mật khẩu không chính xác.';

      case 'network-request-failed':
        return 'Không có kết nối mạng.';

      case 'operation-not-allowed':
        return 'Đăng nhập bằng Email/Password chưa được bật.';

      case 'too-many-requests':
        return 'Bạn đã thử quá nhiều lần. Vui lòng thử lại sau.';

      default:
        return 'Đã xảy ra lỗi, vui lòng thử lại.';
    }
  }
}
