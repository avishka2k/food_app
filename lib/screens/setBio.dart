// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/widget/primarybtn.dart';
import 'package:hexcolor/hexcolor.dart';

class setBio extends StatefulWidget {
  const setBio({Key? key}) : super(key: key);

  @override
  State<setBio> createState() => _setBioState();
}

class _setBioState extends State<setBio> {
  final _firstName = TextEditingController();
  final _secondName = TextEditingController();
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
          SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                        'Fill in your bio to\nget started',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'This data will be displayed in your account\nprofile for security',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 100,
                          offset: const Offset(0, 20),
                          color: HexColor('#15BE77').withOpacity(0.1),
                        )
                      ]),
                      child: TextFormField(
                        cursorColor: HexColor('#15BE77'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Request';
                          }
                          return null;
                        },
                        controller: _firstName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.2.w,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'First Name',
                          labelText: 'First Name',
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
                        cursorColor: HexColor('#15BE77'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Request';
                          }
                          return null;
                        },
                        controller: _secondName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.2.w,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Last Name',
                          labelText: 'Last Name',
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
                          if (_formKey.currentState!.validate()) {}
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
