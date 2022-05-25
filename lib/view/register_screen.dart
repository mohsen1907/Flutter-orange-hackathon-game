import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orangetask_mohamedmohsen/controllers/register/RegisterCubit.dart';
import 'package:orangetask_mohamedmohsen/controllers/register/RegisterStates.dart';
import 'package:orangetask_mohamedmohsen/shared/components/components.dart';

import '../shared/components/constants.dart';

class RegisterScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final verticalSpace = 10.0;

  @override
  Widget build(BuildContext context) {
    final rectangleRadius = MediaQuery.of(context).size.width/2;
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
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
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Hello,',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(' Friend!',
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
                                'Sign Up',
                                style: TextStyle(fontSize: 23.33, color: Colors.black),
                              ),
                              SizedBox(
                                height: 35,
                              ),

                              customTextFormField(keyboardType: TextInputType.name, validate: (value){
                                if(value.isEmpty){
                                  return "Can't leave name Field Empty";
                                }
                                return null;
                              },
                                prefixIcon: Icons.person,
                                hintText: "Full Name",
                                controller: nameController,),
                               SizedBox(
                                height: verticalSpace,
                              ),

                              customTextFormField(keyboardType: TextInputType.emailAddress, validate: (value){
                                if(value.isEmpty){
                                  return "Can't leave E-Mail Field Empty";
                                }
                                return null;
                              },
                                hintText: "E-Mail",
                                prefixIcon: Icons.mail_outline,
                                controller: emailController,),
                              SizedBox(
                                height: verticalSpace,
                              ),
                              customTextFormField(
                                isPassword: cubit.isPassword,
                                prefixIcon: Icons.lock_outlined,
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

                               SizedBox(
                                height: verticalSpace,
                              ),

                              customTextFormField(keyboardType: TextInputType.phone, validate: (value){
                                if(value.isEmpty){
                                  return "Can't leave phone number Field Empty";
                                }
                                return null;
                              },
                                prefixIcon: Icons.call,
                                hintText: "phone number",
                                controller: phoneController,),
                              SizedBox(
                                height: verticalSpace,
                              ),

                              customTextFormField(keyboardType: TextInputType.streetAddress, validate: (value){
                                if(value.isEmpty){
                                  return "Can't leave address Field Empty";
                                }
                                return null;
                              },
                                prefixIcon: Icons.location_on_outlined,
                                hintText: "address",
                                controller: addressController,),
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
                              ConditionalBuilder(
                                condition: state is! RegisterLoadingState,
                                fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                                builder: (BuildContext context) => customButton(function: (){
                                  print("Register click");
                                  if (formKey.currentState!.validate()){
                                    cubit.userRegister(email: emailController.text, name: nameController.text, password: passwordController.text, phone: phoneController.text, address: addressController.text);
                                  }
                                }, text: "Register"),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have account ?"),
                                  TextButton(onPressed: (){}, child: Text("Sign up",style: TextStyle(color: mainColor),))
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
