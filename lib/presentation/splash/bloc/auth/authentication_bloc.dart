import 'dart:async';

import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';
import 'package:flutter_application_1/domains/usecase/signIn_usecase.dart';
import 'package:flutter_application_1/presentation/splash/bloc/auth/authen_state.dart';

class AuthenticationBloc {
  late final SigninUsecase _signinUsecase;
  final _authStateController = StreamController<AuthenState>.broadcast();
  final _errorController = StreamController<String>.broadcast();

  AuthenticationBloc(this._signinUsecase);
  Stream<AuthenState> get authSate => _authStateController.stream;
  Stream<String> get error => _errorController.stream;

  Future<void> signIn(String email, String password) async {
    try {
      _authStateController.add(AuthenState.loading);
      final rq = CreateUserRq(email: email, password: password);
      final result = await _signinUsecase.call(rq.toString());
      result.fold((l) {
        _errorController.add(
          l.toString(),
        );
      }, (r) {
        _authStateController.add(AuthenState.success);
      });
    } catch (e) {
      _authStateController.add(AuthenState.error);
      _errorController.add(e.toString());
    }
  }

  void dispose() {
    _authStateController.close();
    _errorController.close();
  }
}
