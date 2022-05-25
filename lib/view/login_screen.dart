import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orangetask_mohamedmohsen/controllers/login/LoginCubit.dart';
import 'package:orangetask_mohamedmohsen/controllers/login/LoginStates.dart';
import 'package:orangetask_mohamedmohsen/shared/components/components.dart';
import 'package:orangetask_mohamedmohsen/shared/components/constants.dart';
import 'package:orangetask_mohamedmohsen/view/register_screen.dart';

class LoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final rectangleRadius = MediaQuery.of(context).size.width/2;
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginStates>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is LoginSuccessState){
      Fluttertoast.showToast(msg: "تم تسجيل الدخول بنجاح");
    }
  },
  builder: (context, state) {
    LoginCubit cubit = LoginCubit.get(context);
    return SafeArea(
      child: Scaffold(
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height-MediaQuery.of(context).viewPadding.top,
                child: Stack(
                  children: [
                    Positioned(
                      top: -rectangleRadius/2-20,
                      right: -rectangleRadius/4+15,
                      child: RotationTransition(  turns: new AlwaysStoppedAnimation(-15/360),
                          child: customPanel(context,MainColor,rectangleRadius)),
                    ),
                    Positioned(
                      top: -rectangleRadius/2,
                      right: -rectangleRadius/4,
                      child: RotationTransition(  turns: new AlwaysStoppedAnimation(-15/360),
                          child: customPanel(context,MainColor.shade50,rectangleRadius)),
                    ),
                    Positioned(
                      bottom: -rectangleRadius/2-20,
                      left: -rectangleRadius/4+15,
                      child: RotationTransition(  turns: new AlwaysStoppedAnimation(-15/360),
                          child: customPanel(context,MainColor,rectangleRadius)),
                    ),
                    Positioned(
                      bottom: -rectangleRadius/2,
                      left: -rectangleRadius/4,
                      child: RotationTransition( turns: new AlwaysStoppedAnimation(-15/360),
                          child: customPanel(context,MainColor.shade50,rectangleRadius)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            SvgPicture.asset('assets/svgs/orange-logo.svg',height: 50,width: 50,),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(' Back!',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Login',
                              style: TextStyle(fontSize: 23.33, color: Colors.black),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                           customTextFormField(keyboardType: TextInputType.emailAddress, validate: (value){
                             if(value.isEmpty){
                               return "Can't leave E-Mail Field Empty";
                             }
                             return null;
                           },
                               hintText: "E-Mail",
                           controller: emailController,),
                            const SizedBox(
                              height: 40,
                            ),
                            customTextFormField(
                              isPassword: cubit.isPassword,
                              keyboardType: TextInputType.visiblePassword, validate: (value){
                              if(value.isEmpty){
                                return "Can't leave E-Mail Field Empty";
                              }
                              return null;
                            },
                              suffixIcon: cubit.suffix,
                              suffixPressed: cubit.changePasswordVisibility,
                              hintText: "Password",
                              controller: passwordController,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forget Password',
                                    style: TextStyle(color: mainColor),
                                  ),
                                )],
                            ),
                            SizedBox(height: 20,),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                              builder: (BuildContext context) => customButton(function: (){
                                print("login click");
                                if (formKey.currentState!.validate()){
                                  cubit.userLogin(userName: emailController.text, password: passwordController.text);
                                }
                              }, text: "Login"),

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text("Don't have account ?"),
                              TextButton(onPressed: (){
                                navigateTo(context, RegisterScreen());
                              }, child: Text("Sign up",style: TextStyle(color: mainColor),))
                            ],),
                          ]),
                    ),
                  ],
                ),
              ),
                ),
            ),
          ),
    );
  },
),
);
  }
}
