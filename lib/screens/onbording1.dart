import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/screens/onbording2.dart';
import 'package:food_app/widget/primarybtn.dart';

// ignore: camel_case_types
class onbordingOne extends StatelessWidget {
  const onbordingOne({Key? key}) : super(key: key);

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
                image: AssetImage('assets/onbordingImg1.png'),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    'Find Your Comfort\n Food here',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20.h),
                  Text(
                    'Here You Can find a chef of dish '
                    'for every\n taste and color. Enjoy!',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30.h),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const onbordingTow(),
                            ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: primatyButton(btnText: 'Next'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
