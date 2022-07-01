// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names
import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class forgotPassword extends StatelessWidget {
  final _emailControllar = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(-0, -180),
            child: Transform.rotate(
              angle: pi / 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/BgPattern.png'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.h,
              horizontal: 25.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: HexColor('#F9A84D').withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/back.png',
                          color: HexColor('#DA6317'),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Please Enter Your Email Address To \nRecieve a Verification Code.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 100,
                            offset: const Offset(0, 20),
                            color: HexColor('#15BE77').withOpacity(0.1),
                          )
                        ]),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Cant\'t be empty';
                            } else if (EmailValidator.validate(
                                    _emailControllar.text) ==
                                false) {
                              return 'Invalid Email Address';
                            }
                            return null;
                          },
                          controller: _emailControllar,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.2.w,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'example@gmail.com',
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#15BE77'),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor('#15BE77'),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.2.w,
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: primatyButton(btnText: 'Submit'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
