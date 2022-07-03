// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, use_build_context_synchronously, avoid_print
import 'dart:math';
import 'package:email_auth/email_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/auth.config.dart';
import 'package:food_app/screens/verification.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final _emailControllar = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth;
    emailAuth.config(remoteServerConfiguration);
  }

  void sendOtp() async {
    var result = await emailAuth.sendOtp(
      recipientMail: _emailControllar.text,
      otpLength: 4,
    );
    if (result) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => verification(
            getCode: _emailControllar.text,
          ),
        ),
      );
    } else {
      print('Not Sent');
    }
  }

  @override
  void dispose() {
    _emailControllar.dispose();
    super.dispose();
  }

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
            child: Padding(
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
                            if (_formKey.currentState!.validate()) {
                              sendOtp();
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: primatyButton(btnText: 'Send OTP'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
