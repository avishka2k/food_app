// ignore_for_file: camel_case_types, avoid_print, use_build_context_synchronously

import 'package:email_auth/email_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/auth.config.dart';
import 'package:food_app/screens/verification.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class sendMail extends StatefulWidget {
  const sendMail({Key? key}) : super(key: key);

  @override
  State<sendMail> createState() => _sendMailState();
}

class _sendMailState extends State<sendMail> {
  final _formKey = GlobalKey<FormState>();
  final _emailControllar = TextEditingController();

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
                            SizedBox(height: 40.h),
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
                            SizedBox(height: 50.h),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
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
                      child: primatyButton(btnText: 'Continue'),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
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
      ),
    );
  }
}
