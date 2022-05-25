import 'dart:async';


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:io' show Platform;

import 'package:orangetask_mohamedmohsen/controllers/login/LoginStates.dart';
import 'package:orangetask_mohamedmohsen/models/login_model.dart';
import 'package:orangetask_mohamedmohsen/shared/network/end_points.dart';
import 'package:orangetask_mohamedmohsen/shared/network/remote/dio_helper.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  ///Login
  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPassword = true;

  Future<void> userLogin({required String userName, required String password}) async {
    emit(LoginLoadingState());
      await DioHelper.postData(url: endPointLOGIN, data: {
        "email": userName,
        "password": password
      }).then((value) {
        loginModel = LoginModel.fromMap(value.data);
        print(loginModel?.message);
        emit(LoginSuccessState());

      }).catchError((error){
        print(error);
        emit(LoginErrorState());
      });
  }
  changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());

  }
}
