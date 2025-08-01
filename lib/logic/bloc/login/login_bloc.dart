import 'dart:developer';

import 'package:car_bazar/data/model/auth/login_state_model.dart';
import 'package:car_bazar/data/model/auth/user_response_model.dart';
import 'package:car_bazar/logic/bloc/login/login_event.dart';
import 'package:car_bazar/logic/bloc/login/login_state.dart';
import 'package:car_bazar/logic/repository/auth_repository.dart';
import 'package:car_bazar/presentation/errors/failure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStateModel> {
  final AuthRepository _repository;
  UserResponseModel? _users;

  bool get isLoggedIn => _users != null && _users!.accessToken.isNotEmpty;

  UserResponseModel? get userInformation => _users;

  set saveUserData(UserResponseModel userData) => _users = userData;

  LoginBloc({required AuthRepository repository})
    : _repository = repository,
      super(LoginStateModel()) {
    on<LoginEventUserEmail>((event, emit) {
      emit(state.copyWith(email: event.email, loginState: LoginStateInitial()));
    });
    on<LoginEventPassword>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          loginState: LoginStateInitial(),
        ),
      );
    });
    on<SaveUserCredentialEvent>((event, emit) {
      emit(
        state.copyWith(
          isActive: event.isActive,
          loginState: LoginStateInitial(),
        ),
      );
    });
    on<ShowPasswordEvent>((event, emit) {
      emit(
        state.copyWith(show: !(event.show), loginState: LoginStateInitial()),
      );
    });
    on<LoginEventLanguageCode>((event, emit) {
      emit(state.copyWith(languageCode: event.languageCode));
    });
    on<LoginEventCurrencyIcon>((event, emit) {
      emit(state.copyWith(isActive: !state.isActive));
    });
    on<LoginEventRememberMe>((event, emit) {
      emit(state.copyWith(isActive: !state.isActive));
    });
    on<LoginEventSubmit>(_loginEvent);
    on<LoginEventSaveCredential>(_saveCredential);

    final result = _repository.getExistingUserInfo();
    result.fold((failure) => _users = null, (success) {
      saveUserData = success;
      log('$success', name: 'saved-user-data');
    });
  }

  Future<void> _saveCredential(
    LoginEventSaveCredential event,
    Emitter<LoginStateModel> emit,
  ) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      if (state.isActive) {
        pref.setString('email', state.email);
        pref.setString('password', state.password);
      } else {
        final email = pref.getString('email');
        final password = pref.getString('password');
        if (email?.trim().isNotEmpty ?? false) {
          pref.remove('email');
        }
        if (password?.trim().isNotEmpty ?? false) {
          pref.remove('password');
        }
      }
    } catch (e) {
      debugPrint(
        'Error occurring while saving user credentials: ${e.toString()}',
      );
    }
  }

  Future<void> _loginEvent(
    LoginEventSubmit event,
    Emitter<LoginStateModel> emit,
  ) async {
    emit(state.copyWith(loginState: LoginStateLoading()));
    final result = await _repository.login(state);
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = LoginStateFormValidate(failure.errors);
          emit(state.copyWith(loginState: errors));
        } else {
          final errors = LoginStateError(
            message: failure.message,
            statusCode: failure.statusCode,
          );
          emit(state.copyWith(loginState: errors));
        }
      },
      (success) {
        final userLoaded = LoginStateLoaded(userResponseModel: success);
        _users = success;
        emit(state.copyWith(loginState: userLoaded));
      },
    );
  }
}
