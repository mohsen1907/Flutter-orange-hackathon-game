import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orangetask_mohamedmohsen/controllers/register/RegisterStates.dart';
import 'package:dio/dio.dart';
import 'package:orangetask_mohamedmohsen/shared/network/end_points.dart';
import 'package:orangetask_mohamedmohsen/shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPassword = true;

  changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }
  Future<void> userRegister({
    required String email,
    required String name,
    required String password,
    required String phone,
    required String address
  }) async {
    emit(RegisterLoadingState());
    await DioHelper.postData(url: endPointREGISTER, data: {
      "name": "Mohammed ashraf",
      "email": "bosayousef981@gmail.com",
      "password": "asdfghMMM9",
      "phone": "12312312312",
      "address": "asasdadada dasdad"
    }
    ).then((value) {
      emit(RegisterSuccessState());
    }).catchError((error){
      print(error);
      emit(RegisterErrorState());
    });
  }


}