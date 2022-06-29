// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:food_app/widget/primarybtn.dart';

class onbordingTow extends StatelessWidget {
  const onbordingTow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
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
                  const Text(
                    'Food Ninja is Where Your \nComfort Food Lives',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Enjoy a fast and smooth food delivery'
                    ' at \nyour doorstep',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 40),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      onPressed: () {},
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
