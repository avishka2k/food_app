// ignore_for_file: camel_case_types, use_key_in_widget_constructors
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/widget/primarybtn.dart';

import 'package:hexcolor/hexcolor.dart';

class pwResetDone extends StatelessWidget {
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: 100.h),
                Image(
                  image: const AssetImage('assets/profileReady.png'),
                  width: 180.w,
                ),
                SizedBox(height: 30.h),
                Text(
                  'Congrats!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: <Color>[
                          HexColor('53E88B'),
                          HexColor('15BE77'),
                        ],
                      ).createShader(
                        const Rect.fromLTWH(0.0, 0.0, 200, 100),
                      ),
                  ),
                ),
                SizedBox(height: 15.h),
                const Text(
                  'Password Reset Succesful',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 80.h),

                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: primatyButton(btnText: 'Done'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
