
import 'package:dio/dio.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{}

class LoginErrorState extends LoginStates {}

class LoginSuccessAuthentication extends LoginStates{}

class LoginFailAuthentication extends LoginStates{}

class LoginChangePasswordVisibilityState extends LoginStates{}

class LoginSendVerificationCodeLoadingState extends LoginStates{}

class LoginSendVerificationCodeSuccessState extends LoginStates{}

class LoginSendVerificationCodeErrorState extends LoginStates{}

class LoginUserVerifyLoadingState extends LoginStates{}

class LoginUserVerifySuccessState extends LoginStates{}

class LoginUserVerifyErrorState extends LoginStates{}

class LoginOTPChangeHasErrorState extends LoginStates{}

class LoginOTPChangeState extends LoginStates{}

class LoginOTPTimerState extends LoginStates{}

class LoginOTPTimerEndState extends LoginStates{}