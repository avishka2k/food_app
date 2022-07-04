// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/screens/login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introducionPage extends StatefulWidget {
  @override
  State<introducionPage> createState() => _introducionPageState();
}

class _introducionPageState extends State<introducionPage> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
                titlePadding: EdgeInsets.only(bottom: 10.h),
                bodyTextStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: "Find Your Comfort\n Food here",
              body: 'Here You Can find a chef of dish '
                  'for every\n taste and color. Enjoy!',
              image: Image.asset(
                'assets/onbordingImg1.png',
                fit: BoxFit.cover,
              ),
            ),
            PageViewModel(
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
                titlePadding: EdgeInsets.only(bottom: 10.h),
                bodyTextStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: "Food Ninja is Where Your \nComfort Food Lives",
              body: 'Enjoy a fast and smooth food delivery'
                  ' at \nyour doorstep',
              image: Image.asset(
                'assets/onbordingImg2.png',
                fit: BoxFit.cover,
              ),
            )
          ],
          done: const Text("Done",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
          onDone: () {
            Navigator.pushAndRemoveUntil(
                (context),
                MaterialPageRoute(builder: (context) => login()),
                (route) => false);
          },
          next: const Text('Next',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
          nextStyle: TextButton.styleFrom(
            backgroundColor: HexColor('53E88B'),
          ),
          doneStyle: TextButton.styleFrom(
            backgroundColor: HexColor('15BE77'),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size(10, 10),
            activeSize: const Size(20, 10),
            activeColor: HexColor('15BE77'),
            color: HexColor('53E88B').withOpacity(0.5),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
}
