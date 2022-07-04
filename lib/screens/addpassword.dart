// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, use_build_context_synchronously, avoid_print
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/screens/setBio.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class addPassword extends StatefulWidget {
  String getEmail;
  addPassword({required this.getEmail});

  @override
  State<addPassword> createState() => _addPasswordState();
}

class _addPasswordState extends State<addPassword> {
  final _passwordControllar = TextEditingController();
  final _confirmPasswordControllar = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Future siginUp() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: widget.getEmail.trim(),
  //       password: _passwordControllar.text.trim(),
  //     );

  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return setBio();
  //     }));
  //   } on FirebaseAuthException catch (e) {
  //     print(e.toString());
  //     Fluttertoast.showToast(
  //       msg: 'not success',
  //       backgroundColor: Colors.black.withOpacity(0.6),
  //     );
  //   }
  //   Navigator.pop(context);
  // }

  // @override
  // void dispose() {
  //   _passwordControllar.dispose();
  //   widget.getEmail;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(100, -200),
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
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30.h,
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
                        'Set Your Password',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'Set the password for your account,\nso you '
                      'can login and access all the feature.',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 100,
                            offset: const Offset(0, 20),
                            color: HexColor('#15BE77').withOpacity(0.1),
                          )
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: HexColor('#15BE77'),
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
                          labelText: 'New Password',
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
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 100,
                            offset: const Offset(0, 20),
                            color: HexColor('#15BE77').withOpacity(0.1),
                          )
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: HexColor('#15BE77'),
                        validator: (value) {
                          if (value!.length <= 5) {
                            return 'Minimum 5 characters';
                          } else if (value != _passwordControllar.text) {
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
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: '',
                          labelText: 'Confirm Password',
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
                    SizedBox(height: 40.h),
                    Center(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => setBio(
                                  getpwFormSetPw: _passwordControllar.text,
                                  geteFormSete: widget.getEmail,
                                ),
                              ),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: primatyButton(btnText: 'Next'),
                      ),
                    ),
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
