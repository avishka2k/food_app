// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/screens/login.dart';
import 'package:food_app/widget/primarybtn.dart';

class onbordingTow extends StatelessWidget {
  const onbordingTow({Key? key}) : super(key: key);

  get toggleScreens => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            const Expanded(
              flex: 3,
              child: Image(
                image: AssetImage('assets/onbordingImg2.png'),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    'Food Ninja is Where Your \nComfort Food Lives',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20.h),
                  Text(
                    'Enjoy a fast and smooth food delivery'
                    ' at \nyour doorstep',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30.h),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         login(showRegisterPage: toggleScreens),
                      //   ),
                      // );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    child: primatyButton(btnText: 'Next'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
