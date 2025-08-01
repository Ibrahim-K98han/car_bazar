import 'package:car_bazar/data/model/auth/user_response_model.dart';
import 'package:car_bazar/presentation/errors/errors_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
 const  LoginState();
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();

  @override
  List<Object?> get props => [];
}

class LoginStateLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginStateLogoutLoading extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginStateLogoutLoaded extends LoginState {
  final String message;
  final int statusCode;

  LoginStateLogoutLoaded(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}


class LoginStateLogoutError extends LoginState {
  final String message;
  final int statusCode;

   LoginStateLogoutError(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}

class LoginStateLoaded extends LoginState {
  final UserResponseModel userResponseModel;

   LoginStateLoaded({required this.userResponseModel});

  @override
  List<Object?> get props => [userResponseModel];
}

class LoginStateError extends LoginState {
  final String message;
  final int statusCode;

   LoginStateError({required this.message, required this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class LoginStateFormValidate extends LoginState {
  final Errors errors;

   LoginStateFormValidate(this.errors);

  @override
  List<Object?> get props => [errors];
}
