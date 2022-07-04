// ignore_for_file: camel_case_types, use_key_in_widget_constructors, deprecated_member_use, avoid_print, must_be_immutable
import 'dart:math';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/auth.config.dart';
import 'package:food_app/screens/addpassword.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class verification extends StatefulWidget {
  String getCode;
  verification({required this.getCode});

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  final _formKey = GlobalKey<FormState>();

  final number1 = TextEditingController();
  final number2 = TextEditingController();
  final number3 = TextEditingController();
  final number4 = TextEditingController();

  String inputCode() {
    String inputveifyCode =
        number1.text + number2.text + number3.text + number4.text;
    return inputveifyCode;
  }

  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");

  @override
  void initState() {
    super.initState();
    inputCode();
    // Initialize the package
    emailAuth;
    emailAuth.config(remoteServerConfiguration);
  }

  void verifyOtp() async {
    var result = emailAuth.validateOtp(
      recipientMail: widget.getCode,
      userOtp: inputCode(),
    );
    if (result) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => addPassword(getEmail: widget.getCode),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Invalid verification code',
        backgroundColor: Colors.black.withOpacity(0.6),
      );
    }
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
          Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                        'Enter 4-digit\nVerification Code',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'Code sent to ******@gmail.com. This code will '
                      '\nexpired in 5min',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: HexColor('#FFFFFF'),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 100,
                                  offset: const Offset(0, 20),
                                  color: HexColor('#15BE77').withOpacity(0.5),
                                )
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: TextFormField(
                                  controller: number1,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return null;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: HexColor('#15BE77'),
                                  //controller: _number1,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: HexColor('#FFFFFF'),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 100,
                                  offset: const Offset(0, 20),
                                  color: HexColor('#15BE77').withOpacity(0.5),
                                )
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: TextFormField(
                                  controller: number2,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return null;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: HexColor('#15BE77'),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: HexColor('#FFFFFF'),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 100,
                                  offset: const Offset(0, 20),
                                  color: HexColor('#15BE77').withOpacity(0.5),
                                )
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: TextFormField(
                                  controller: number3,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return null;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: HexColor('#15BE77'),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: HexColor('#FFFFFF'),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 100,
                                  offset: const Offset(0, 20),
                                  color: HexColor('#15BE77').withOpacity(0.5),
                                )
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: TextFormField(
                                  controller: number4,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return null;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: HexColor('#15BE77'),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Center(
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            verifyOtp();
                            print(inputCode());
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: primatyButton(btnText: 'Verify'),
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
