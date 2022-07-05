// ignore_for_file: camel_case_types, use_build_context_synchronously, avoid_print

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/screens/auth/siginwithgoogle.dart';
import 'package:food_app/screens/emialVerify/sendemail.dart';
import 'package:food_app/screens/forgotPassword.dart';
import 'package:food_app/screens/signup.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class login extends StatefulWidget {
  // final VoidCallback showRegisterPage;
  // const login({
  //   Key? key,
  //   required this.showRegisterPage,
  // }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final _emailControllar = TextEditingController();
  final _passwordControllar = TextEditingController();

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailControllar.text.trim(),
        password: _passwordControllar.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Invalid user name or pasword",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print(e.toString());
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailControllar.dispose();
    _passwordControllar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Text(
                        'Login To Your Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Form(
                        key: _formKey,
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
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
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
                            SizedBox(height: 15.h),
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
                                  if (value!.length <= 5) {
                                    return 'Minimum 5 characters';
                                  }
                                  return null;
                                },
                                controller: _passwordControllar,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.2.w,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  hintText: '',
                                  labelText: 'Password',
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => forgotPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot your Password?',
                              style: TextStyle(
                                fontSize: 12.sp,
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signIn();
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: primatyButton(btnText: 'Login'),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You Don\'t have an account? ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: HexColor('#15BE77'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const sendMail(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor('#15BE77'),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        'Or Continue With',
                        style: TextStyle(
                            fontSize: 13.sp,
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
                            width: 120.w,
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
                                  width: 25.w,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              googleAuthService().signInWithGoogle();
                            },
                            child: Container(
                              width: 120.w,
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
                                    width: 25.w,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
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
    );
  }
}
