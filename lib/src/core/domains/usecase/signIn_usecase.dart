import 'package:dartz/dartz.dart';


import '../../infrastructure/repository/authen_repository.dart';
import '../../usecase/usecase.dart';

class SignInUseCase implements UseCase<Either, String> {
  final AuthenRepository _authenRepository;
  SignInUseCase(this._authenRepository);

  @override
  Future<Either<dynamic, dynamic>> call(String params) async {
  
    final parts = params.split(',');
    if (parts.length != 2) {
      return Left('Invalid parameters');
    }
    final email = parts[0].trim();
    final password = parts[1].trim();

    try {
      final result =
          await _authenRepository.signInWithEmailAndPassword(email, password);

      if (result != null) {
        return Right(result);
      } else {
        return Left('Sign in failed');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
