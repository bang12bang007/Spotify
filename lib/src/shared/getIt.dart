import 'package:flutter_application_1/data/responsitory/auth/authen_implement.dart';
import 'package:get_it/get_it.dart';

import '../core/domains/source/auth/authen_service.dart';
import '../core/domains/usecase/signIn_usecase.dart';
import '../core/domains/usecase/signUp_usecase.dart';
import '../core/infrastructure/repository/authen_repository.dart';
import '../core/presentations/bloc/auth/authentication_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerSingleton<AuthenService>(
    AuthenServiceImpl(),
  );
  getIt.registerSingleton<AuthenRepository>(
    AuthenImplement(),
  );

  getIt.registerSingleton<SignUpUseCase>(
    SignUpUseCase(),
  );
  getIt.registerSingleton<SignInUseCase>(
    SignInUseCase(getIt<AuthenRepository>()),
  );
  getIt.registerSingleton<AuthenticationBloc>(
    AuthenticationBloc(getIt<SignInUseCase>()),
  );
}
