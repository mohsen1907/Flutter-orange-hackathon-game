

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

Widget customButton({
  required void Function() function,
  required String text,
  double width = double.infinity,
  double height = 60,
  Color background = mainColor,
  double radius = 10.0,
  Color textColor = Colors.white,
  Color borderColor = Colors.white,
  double borderWidth = 0,

}) =>
    Container(
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radius)),
      width: width,
      child: MaterialButton(
        onPressed: function,
        height: height,
        shape: RoundedRectangleBorder(side: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: BorderStyle.solid
        ), borderRadius: BorderRadius.circular(radius)),
        child: Text(
          text.toUpperCase(),
          style:
          TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );


Widget defaultButton(
    {required Function() onPressed,
    required Widget text,
    required double width,
    required double height,
    required Color mainColor,
    required Color borderColor})
 =>MaterialButton(
    onPressed: onPressed,
    child: Container(
      height:height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: mainColor,
        // gradient: LinearGradient(
        //   colors: [
        //     Color(0xffcc6213),
        //     Color(0xffba0b08),
        //     Color(0xff931c04),
        //     Color(0xff3f0303),
        //   ],
        // ),
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: text,
      ),
    ),
  );

Widget customTextFormField({
  required TextInputType keyboardType,
  required FormFieldValidator validate,
  TextEditingController? controller,
  String? text,
  String? hintText,
  double? hintFontSize = 13,
  Function? onSubmit,
  Color? fieldColor = textFieldColor,
  InputBorder? border = InputBorder.none,
  double? width = double.infinity,
  bool readOnly = false,
  Function? onTap,
  int maxLines = 1,
  int? maxLength,
  void Function(String value)? onChange,
  IconData? prefixIcon,

  ///For password
  IconData? suffixIcon,
  Function? suffixPressed,
  bool isPassword = false,
}) =>
    Container(
      child: TextFormField(
        readOnly: readOnly,
        keyboardType: keyboardType,
        initialValue: text,
        maxLength: maxLength,
        validator: validate,
        controller: controller,
        maxLines: maxLines,
        obscureText: isPassword,
        // textDirection: TextDirection.rtl,
        onTap: onTap != null
            ? () {
          onTap();
        }
            : null,
        onChanged: onChange,
        cursorColor: mainColor,
        onFieldSubmitted: (s) {
          onSubmit!(s);
        },
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: hintFontSize),
          errorStyle: const TextStyle(height: 0.6),
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: fieldColor,
          suffixIcon: suffixIcon != null
              ? IconButton(
            onPressed: suffixPressed != null
                ? () {
              suffixPressed();
            }
                : null,
            icon: Icon(suffixIcon),
          )
              : null,
          contentPadding: const EdgeInsets.all(20),
          isDense: true,
          // hintTextDirection: TextDirection.rtl,
        ),
      ),
    );

Widget defoultTextForme({
  required String Function(String?) ? validator,
  required TextInputType?  type,
  required TextEditingController? controle,
  required String? textlable,
  required String? image ,
    Function (String?)?submint,
    Function (String?)?onchange,

  IconData? sufex,
  bool textScure = false,
})=>
    TextFormField(
      validator:validator,
      keyboardType: type,
      onFieldSubmitted:submint,
      onChanged: onchange,
      controller:controle,
      decoration: InputDecoration(
          fillColor: Colors.grey[300],
          labelStyle: TextStyle(color: Colors.grey),
          border:OutlineInputBorder(), labelText: textlable,
           prefixIcon: Image.asset(image!),
      ),
    );

  Widget customPanel(BuildContext context,Color? color,radius) => Container(
    height: radius,
    width: radius,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color
    ),
  );


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);