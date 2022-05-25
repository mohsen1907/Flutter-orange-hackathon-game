import 'package:flutter/material.dart';
import 'package:orangetask_mohamedmohsen/shared/components/constants.dart';
import 'package:orangetask_mohamedmohsen/view/login_screen.dart';

import 'shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MainColor,
      ),
      home: LoginScreen(),
    );
  }
}
