// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class forgotPassword extends StatelessWidget {
  const forgotPassword({Key? key}) : super(key: key);

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
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: HexColor('#F9A84D').withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/back.png',
                          color: HexColor('#DA6317'),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
