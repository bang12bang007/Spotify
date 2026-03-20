import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';


import '../../../shared/getIt.dart';
import '../../infrastructure/repository/authen_repository.dart';
import '../../usecase/usecase.dart';


class SignUpUseCase implements UseCase<Either, CreateUserRq> {
  @override
  Future<Either> call(CreateUserRq params) async {
    try {
      return Right(await getIt<AuthenRepository>()
          .createUserWithEmailAndPassword(params));
    } catch (e) {
      throw Exception(e);
    }
  }
}
