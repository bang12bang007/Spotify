import 'package:flutter_application_1/data/responsitory/auth/authen_implement.dart';
import 'package:flutter_application_1/domains/repository/auth/authen_repository.dart';
import 'package:flutter_application_1/domains/source/auth/authen_service.dart';
import 'package:flutter_application_1/domains/usecase/signIn_usecase.dart';
import 'package:flutter_application_1/domains/usecase/signUp_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerSingleton<AuthenService>(
    AuthenServiceImpl(),
  );
  getIt.registerSingleton<AuthenRepository>(
    AuthenImplement(),
  );

  getIt.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );
  getIt.registerSingleton<SigninUsecase>(
    SigninUsecase(getIt<AuthenRepository>()),
  );
}
