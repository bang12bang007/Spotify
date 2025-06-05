import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';
import 'package:flutter_application_1/domains/repository/auth/authen_repository.dart';
import 'package:flutter_application_1/getIt.dart';

class SignupUsecase implements UseCase<Either, CreateUserRq> {
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
