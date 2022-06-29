// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: FractionalOffset.topCenter,
                  image: AssetImage('assets/BgPattern.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Center(
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/Logo.png'),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Login To Your Account',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Form(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    blurRadius: 100,
                                    offset: const Offset(0, 20),
                                    color: HexColor('#15BE77').withOpacity(0.1),
                                  )
                                ]),
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.2.w,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: 'example@gmail.com',
                                    labelText: 'Email',
                                    labelStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HexColor('#15BE77'),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    blurRadius: 100,
                                    offset: const Offset(0, 20),
                                    color: HexColor('#15BE77').withOpacity(0.1),
                                  )
                                ]),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.2.w,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: '',
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HexColor('#15BE77'),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Text(
                                'Forgot your Password?',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: HexColor('#15BE77'),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: primatyButton(btnText: 'Login'),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Text(
                          'Or Continue With',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4),
                                    width: 0.2.w),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 70,
                                    offset: const Offset(2, 20),
                                    color: HexColor('#15BE77').withOpacity(0.2),
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                      'assets/icons/facebook.png',
                                    ),
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Facebook',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              width: 100.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4),
                                    width: 0.2.w),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 70,
                                    offset: const Offset(2, 20),
                                    color: HexColor('#15BE77').withOpacity(0.2),
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                      'assets/icons/google.png',
                                    ),
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
