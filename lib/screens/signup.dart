// ignore_for_file: camel_case_types, avoid_print, use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class signup extends StatefulWidget {
  final VoidCallback showLoginPage;
  const signup({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();
  final _emailControllar = TextEditingController();
  final _passwordControllar = TextEditingController();
  final _confirmPasswordControllar = TextEditingController();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future signUpAuth() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailControllar.text.trim(),
        password: _passwordControllar.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Sorry, email address elready exists.",
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
    _confirmPasswordControllar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
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
                              'Sign Up For Free',
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
                                        color: HexColor('#15BE77')
                                            .withOpacity(0.1),
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
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: HexColor('#15BE77'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0.2.w,
                                              color: Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 100,
                                          offset: const Offset(0, 20),
                                          color: HexColor('#15BE77')
                                              .withOpacity(0.1),
                                        )
                                      ],
                                    ),
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
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: HexColor('#15BE77'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0.2.w,
                                              color: Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 100,
                                          offset: const Offset(0, 20),
                                          color: HexColor('#15BE77')
                                              .withOpacity(0.1),
                                        )
                                      ],
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.length <= 5) {
                                          return 'Minimum 5 characters';
                                        } else if (value !=
                                            _passwordControllar.text) {
                                          return 'Password not match';
                                        }
                                        return null;
                                      },
                                      controller: _confirmPasswordControllar,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0.2.w,
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        hintText: '',
                                        labelText: 'Confirm Password',
                                        labelStyle: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: HexColor('#15BE77'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: HexColor('#15BE77'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0.2.w,
                                              color: Colors.red,
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

                          SizedBox(height: 20.h),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signUpAuth();
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            padding: const EdgeInsets.all(0.0),
                            child: primatyButton(btnText: 'Create Account'),
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: widget.showLoginPage,
                            child: Text(
                              'Alredy have an account?',
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
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
